function TwoNLogLikelihood = EstimationObjective( p, M, options, oo, dynareOBC, InitialRun )
    TwoNLogLikelihood = Inf;
    [ T, N ] = size( dynareOBC.EstimationData );
       
    M.params( dynareOBC.EstimationParameterSelect ) = p( 1 : length( dynareOBC.EstimationParameterSelect ) );
    RootMEVar = p( ( length( dynareOBC.EstimationParameterSelect ) + 1 ):end );
    
    [ Info, M, ~, oo, dynareOBC ] = ModelSolution( 1, M, options, oo, dynareOBC, InitialRun );
    if Info ~= 0
        return
    end
    
    NEndo = M.endo_nbr;
    NExo = dynareOBC.OriginalNumVarExo;
    NEndoMult = ( 2 .^ ( dynareOBC.Order - 1 ) ) + 1;
    Nm = NEndoMult * NEndo;
   
    RootQ = chol( M.Sigma_e( 1:NExo, 1:NExo ), 'lower' ); % sparse

    OriginalVarSelect = false( NEndo );
    OriginalVarSelect( 1:dynareOBC.OriginalNumVar ) = true;
    LagIndices = dynareOBC.OriginalLeadLagIncidence( 1, : ) > 0;
    CurrentIndices = dynareOBC.OriginalLeadLagIncidence( 2, : ) > 0;
    LeadIndices = dynareOBC.OriginalLeadLagIncidence( 3, : ) > 0;
    FutureValues = nan( sum( LeadIndices ), 1 );
    NanShock = nan( 1, NExo );

    persistent FullMean;
    persistent FullRootCovariance;
    
    RecalculateMeanAndCovariance = InitialRun || isempty( FullMean ) || isempty( FullRootCovariance ) || any( size( FullMean ) ~= [ Nm 1 ] ) || size( FullRootCovariance, 1 ) ~= Nm || size( FullRootCovariance, 1 ) > Nm || any( ~isfinite( FullMean ) ) || any( any( ~isfinite( FullRootCovariance ) ) );

    EstimationStdDevThreshold = dynareOBC.EstimationStdDevThreshold;
    
    if RecalculateMeanAndCovariance
        OldMean = dynareOBC.Mean_z;
        dr = oo.dr;
        if dynareOBC.Order == 1
            TempOldRootCovariance = ObtainEstimateRootCovariance( dynareOBC.Var_z1( dr.inv_order_var, dr.inv_order_var ), EstimationStdDevThreshold );
        else
            doubleInvOrderVar = [ dr.inv_order_var; dr.inv_order_var ];
            TempOldRootCovariance = ObtainEstimateRootCovariance( dynareOBC.Var_z2( doubleInvOrderVar, doubleInvOrderVar ), EstimationStdDevThreshold );
        end

        OldRootCovariance = zeros( Nm, Nm );
        OldRootCovariance( 1:size( TempOldRootCovariance, 1 ), 1:size( TempOldRootCovariance, 2 ) ) = TempOldRootCovariance;
    else
        OldMean = FullMean;
        OldRootCovariance = FullRootCovariance;
    end
    
    for t = 1:dynareOBC.EstimationFixedPointMaxIterations
        try
            [ Mean, TmpRootCovariance ] = KalmanStep( nan( 1, N ), OldMean, OldRootCovariance, RootQ, RootMEVar, M, oo, dynareOBC, OriginalVarSelect, LagIndices, CurrentIndices, FutureValues, NanShock );
        catch
            Mean = [];
        end
        if isempty( Mean )
            break;
        end
        RootCovariance = ObtainEstimateRootCovariance( TmpRootCovariance * TmpRootCovariance', EstimationStdDevThreshold, size( TmpRootCovariance, 2 ) );
        
        CompNew = RootCovariance * RootCovariance';
        CompNew = [ CompNew(:); Mean ];
        CompOld = OldRootCovariance * OldRootCovariance';
        CompOld = [ CompOld(:); OldMean ];

        OldMean = Mean; % 0.5 * Mean + 0.5 * OldMean;
        OldRootCovariance = RootCovariance; % 0.5 * RootCovariance + 0.5 * OldRootCovariance;
        
        LCompNew = log( abs( CompNew ) );
        SCompNew = isfinite( LCompNew );
        LCompOld = log( abs( CompOld ) );
        SCompOld = isfinite( LCompOld );
        if all( SCompNew == SCompOld )
            Error = max( max( abs( CompNew - CompOld ) ), max( abs( LCompNew( SCompNew ) - LCompOld( SCompOld ) ) ) );
            if Error < 1e-4
                FullMean = OldMean;
                FullRootCovariance = OldRootCovariance;
                break;
            end
        end
    end
    if isempty( OldMean ) || isempty( OldRootCovariance );
        return;
    end

    TwoNLogLikelihood = 0;
    for t = 1:T
        [ Mean, TmpRootCovariance, TwoNLogObservationLikelihood ] = KalmanStep( dynareOBC.EstimationData( t, : ), OldMean, OldRootCovariance, RootQ, RootMEVar, M, oo, dynareOBC, OriginalVarSelect, LagIndices, CurrentIndices, FutureValues, NanShock );
        if isempty( Mean )
            TwoNLogLikelihood = Inf;
            return;
        end
        RootCovariance = ObtainEstimateRootCovariance( TmpRootCovariance * TmpRootCovariance', EstimationStdDevThreshold, size( TmpRootCovariance, 2 ) );
        OldMean = Mean;
        OldRootCovariance = RootCovariance;
        TwoNLogLikelihood = TwoNLogLikelihood + TwoNLogObservationLikelihood;
    end
end
