%% Hamed Ahmadi, Creating Gaussian process regression (GPR) Model
%--------------------------------------------------------------------------
clear all;clc;clf;close all;
format short g;
global GPRm 

tic
Nrun=  100; % Number of GPR to train

for N=1:Nrun;
randomN = rng(round(rand()*10000));
    % Data
    run Data_gpr; close all;
    [Rt,Ct]=size(info);
    dl=info(:,1);
    inp=info(:,2:Ct-1);
    out=info(:,Ct);

    fprintf('Run %0.0f out of %0.0f',N,Nrun)
    disp('...')

    % Train a GP regression model
    % This code specifies all the model options and trains the model.
    GPRm = fitrgp(...
        inp,  out, ...
        'BasisFunction', 'pureQuadratic', ...  %'none' | 'constant' | 'linear' | 'pureQuadratic' |%;
        'KernelFunction', 'matern52', ...
        'Standardize', true, 'Verbose',0);
    % 'squaredexponential' 'matern52' 'matern32'  'ardsquaredexponential'
    % 'ardmatern32' 'ardmatern52';

    ypred=predict(GPRm, inp);

    % Perform cross-validation
    partitionedModel = crossval(GPRm, 'KFold', 5);
    % Compute validation predictions
    yval = kfoldPredict(partitionedModel);
    % Compute goodness of fits

    RMSEpred = sqrt(mean((ypred-out) .^ 2));
    R2pred= 1 - RMSEpred^2 / var(out, 1);

    RMSEval = sqrt(mean((yval-out) .^ 2));
    R2val= 1 - RMSEval^2 / var(out, 1);
    res_pred=ypred-out;
    res_val=yval-out;

    call=corrcoef([ypred yval]);
    R2PV=(call(1,2))^2;

    call_=corrcoef([RMSEpred RMSEval]);
    RMSEPV=(call(1,2))^2;

    clc
    % disp('         #net       R2tr        R2test        R2val        R2all')
    RSQ(N,:)= [1000+N R2pred R2val R2PV];
    RMSE(N,:)= [1000+N RMSEpred RMSEval];

    save(['C:\MATLAB\GPRmodel\SavedGPR\'...
        num2str(1000+N)])

end

%Selecting best net
disp('         #net       R2pred       R2val        R2PV')
RSQ(N,:)= [1000+N  R2pred R2val R2PV]
[R1,R2]=max(RSQ(:,2:4));
bestnet1= RSQ(R2,:)
sortrows (RSQ,3)

disp('         #net      RMSEpred      RMSEval')
RMSE(N,:)= [1000+N  RMSEpred RMSEval];
[Re1,Re2]=min(RMSE(:,2:3));
bestnet2=  RMSE(Re2,:)
sortrows (RMSE,3);

toc