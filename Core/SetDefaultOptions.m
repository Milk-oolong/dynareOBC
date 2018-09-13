function dynareOBC = SetDefaultOptions( dynareOBC )
    dynareOBC = SetDefaultOption( dynareOBC, 'AltPTest', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Bypass', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'CalculateTheoreticalVariance', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'CompileSimulationCode', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'CubatureAcceleration', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'CubaturePruningCutOff', 0.01 );
    dynareOBC = SetDefaultOption( dynareOBC, 'CubatureTolerance', eps ^ 0.375 );
    dynareOBC = SetDefaultOption( dynareOBC, 'DataFile', [ dynareOBC.BaseFileName '.xlsx' ] );
    dynareOBC = SetDefaultOption( dynareOBC, 'Debug', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'DisplayBoundsSolutionProgress', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'DynamicNu', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'Estimation', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FastCubature', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FeasibilityTestGridSize', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'FilterCubatureDegree', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'FirstOrderAroundRSS1OrMean2', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FixedParameters', '' );
    dynareOBC = SetDefaultOption( dynareOBC, 'FSolveFunctor', @( OptiFunction, OptiX0, varargin ) lsqnonlin( OptiFunction, OptiX0, [], [], optimset( 'algorithm', 'trust-region-reflective', 'display', 'iter', 'MaxFunEvals', Inf, 'MaxIter', Inf, 'TolX', sqrt( eps ), 'TolFun', sqrt( eps ), varargin{:} ) ) );   
    dynareOBC = SetDefaultOption( dynareOBC, 'FullHorizon', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FullTest', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'GaussianCubatureDegree', 0 );    
    dynareOBC = SetDefaultOption( dynareOBC, 'Global', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'HigherOrderSobolDegree', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'IgnoreBoundFailures', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'ImportanceSampling', true );
    dynareOBC = SetDefaultOption( dynareOBC, 'ImportanceSamplingAccuracy', 12 );
    dynareOBC = SetDefaultOption( dynareOBC, 'ImportanceSamplingMinConstraintProbability', 0.0001 );
    dynareOBC = SetDefaultOption( dynareOBC, 'InitialStateFile', '' );
    dynareOBC = SetDefaultOption( dynareOBC, 'IntegerTolerance', sqrt( sqrt( eps ) ) );
    dynareOBC = SetDefaultOption( dynareOBC, 'IRFPeriods', 40 );
    dynareOBC = SetDefaultOption( dynareOBC, 'IRFsAroundZero', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'LPSolver', 'xpress,gurobi,cplex,mosek,scip,linprog,glpk,lpsolve,cdd,qsopt,*' );
    dynareOBC = SetDefaultOption( dynareOBC, 'MaxCubatureDimension', 128 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MaxCubatureSerialLoop', 2 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MaximisationFunctions', 'CMAESWrapper,FMinConWrapper' );   
    dynareOBC = SetDefaultOption( dynareOBC, 'MaxParametricSolutionDimension', 4 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MedianIRFs', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'MILPSolver', 'gurobi,cplex,xpress,mosek,scip,cbc,intlinprog,lpsolve,glpk,*' );
    dynareOBC = SetDefaultOption( dynareOBC, 'MLVSimulationAccuracy', 9 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MLVSimulationMode', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MLVSimulationSubSample', 1 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MultiThreadBoundsProblem', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoCleanUp', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoCorr', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoCubature', true );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoDisplay', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'NoGraph', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoMoments', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoSkewLikelihood', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoTLikelihood', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'Omega', 1000 * ( 1 + eps ) );
    dynareOBC = SetDefaultOption( dynareOBC, 'Order', 2 );
    dynareOBC = SetDefaultOption( dynareOBC, 'OrderOverride', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'PeriodsOfUncertainty', 16 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Prior', 'FlatPrior' );
    dynareOBC = SetDefaultOption( dynareOBC, 'PTest', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'QuasiMonteCarloLevel', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Replications', 50 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Resume', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'RetrieveConditionalCovariancesParallelizationCutOff', 256 );
    dynareOBC = SetDefaultOption( dynareOBC, 'RetryOnOptimizerError', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'ReverseSearch', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'SaveMacro', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'SaveMacroName', [ dynareOBC.BaseFileName '-macroexp.mod' ] );
    dynareOBC = SetDefaultOption( dynareOBC, 'SecondOrderConditionalCovariance', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'ShockScale', 1-eps );
    dynareOBC = SetDefaultOption( dynareOBC, 'ShockSequenceFile', '' );
    dynareOBC = SetDefaultOption( dynareOBC, 'SimulateOnGridPoints', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'SimulationDrop', 100 );    
    dynareOBC = SetDefaultOption( dynareOBC, 'SimulationPeriods', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'SkipFirstSolutions', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'SkipStandardErrors', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'SlowIRFs', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'Smoothing', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'Sparse', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'StationaryDistAccuracy', 10 );
    dynareOBC = SetDefaultOption( dynareOBC, 'StationaryDistDrop', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'StdDevThreshold', eps ^ 0.375 );
    dynareOBC = SetDefaultOption( dynareOBC, 'TimeToEscapeBounds', 32 );
    dynareOBC = SetDefaultOption( dynareOBC, 'TimeToReturnToSteadyState', 64 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Tolerance', eps ^ 0.25 );
    dynareOBC = SetDefaultOption( dynareOBC, 'UseSimulationCode', true );
    dynareOBC = SetDefaultOption( dynareOBC, 'UseVPA', false );

    LemkeLCPOptions = struct;
    LemkeLCPOptions.zerotol = sqrt( eps );
    LemkeLCPOptions.lextol  = sqrt( eps );
    LemkeLCPOptions.maxpiv  = 1e10;
    LemkeLCPOptions.nstepf  = 50;
    LemkeLCPOptions.clock   = 0;
    LemkeLCPOptions.verbose = 0;
    LemkeLCPOptions.routine = 0;
    LemkeLCPOptions.timelimit = 60;
    LemkeLCPOptions.normalize = 0;
    LemkeLCPOptions.normalizethres = 1e10;
    
    dynareOBC = SetDefaultOption( dynareOBC, 'LemkeLCPOptions', LemkeLCPOptions );
    
    dynareOBC = orderfields( dynareOBC );
end
