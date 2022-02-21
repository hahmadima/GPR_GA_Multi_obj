%% Hamed Ahmadi, Genetic algorithm optimizing the GPR Model
%--------------------------------------------------------------------------
clc; clear all; close all;
format shortG; 
randomN = rng(round(rand()*10000));

global X model1 model2 model3
%% Loading best GPR model from training process
tic
load C:\Matlab\GPRmodel\SavedGPR\ws_adg_gfe2022_final.mat; 
model1 = GPRm;
info1  = info;
inp1   = inp;
out1   = out;
ypred1  = ypred;

load C:\Matlab\GPRmodel\SavedGPR\ws_gf_gfe2022_final_new.mat;
model2 = GPRm;
info2  = info;
inp2   = inp;
out2   = out;
ypred2  = ypred;

% load C:\Matlab\GPRmodel\SavedGPR\ph_neff.mat;
% model3 = GPRm;
% info3  = info;
% inp3   = inp;
% out3   = out;
% ypred3  = ypred;

%% --- GA parameters
fitnessFunction = @GPR_multi_obj; % Fitness function
nvars = Ct-2; % Number of Variables
%Start options
options = gaoptimset;
run lb_ub_ga.m;
%     zlb=[0.81       3.2            0];
%     zub=[0.86       3.6           13];

options = gaoptimset(options,'PopulationSize' , 50);
options = gaoptimset(options,'Generations' , 1000);
options = gaoptimset(options,'CrossoverFraction' , 0.9); % check 0.01 and 0.9
options = gaoptimset(options,'ParetoFraction',0.35);
options = gaoptimset(options,'StallGenLimit' , 100);
options = gaoptimset(options,'TolFun' , 0.0001);
options = gaoptimset(options,'StallTimeLimit' , Inf);
options = gaoptimset(options,'SelectionFcn' , @selectiontournament); 
options = gaoptimset(options,'MutationFcn' , { @mutationadaptfeasible});
options = gaoptimset(options,'Display' ,'off');
options = gaoptimset(options,'PlotFcns' ,{ @gaplotpareto  @gaplotspread}); % @gaplotscorediversity     @gaplotspread

%-- Run Multi_Obj GA
[X,FVAL,REASON,OUTPUT,POPULATION,SCORES] = gamultiobj(fitnessFunction,nvars,[],[],[],[],zlb,zub,options);

clc
OUTPUT
Optimal_inputs = X;
Optimal_outputs = abs(FVAL);
scenario=(1:1:size(Optimal_outputs,1))';
Final_result= table(scenario, Optimal_inputs,Optimal_outputs)

%% PLOTS and save results
run plot_optim_results
toc

save('C:\MATLAB\GPRmodel\SavedGPR\zga_resu_multi_.mat')

