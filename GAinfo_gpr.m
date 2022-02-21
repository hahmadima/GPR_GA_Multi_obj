%% Hamed Ahmadi, Genetic algorithm optimizing the GPR Model
%--------------------------------------------------------------------------
clc; clear all; close all;
format shortG;
randomN = rng(round(rand()*10000));

global X
% Loading best GPR model from training process
load C:\Matlab\GPRmodel\SavedGPR\ws_gf_gfe2022_final_new;
%%Fitness function
fitnessFunction = @GPR_obj;
%%Number of Variables
nvars = Ct-2;
%Start options
options = gaoptimset;
%---GA parameters
run lb_ub_ga.m;

%     zlb=[0.86       3.2            0];
%     zub=[0.86       3.2           13];

options = gaoptimset(options,'PopulationSize' , 30);
% options = gaoptimset(options,'EliteCount' , 2);
options = gaoptimset(options,'Generations' ,1000);
options = gaoptimset(options,'CrossoverFraction' ,0.9);
options = gaoptimset(options,'StallGenLimit' ,300);
options = gaoptimset(options,'StallTimeLimit' ,Inf);
options = gaoptimset(options,'SelectionFcn' , @selectionroulette);
options = gaoptimset(options,'MutationFcn' ,{ @mutationadaptfeasible });
% @mutationgaussian 1 1 @mutationadaptfeasible @mutationuniform 0.05
options = gaoptimset(options,'Display' ,'off');
options = gaoptimset(options,'PlotFcns' ,{ @gaplotbestf @gaplotbestindiv});



% % Run GA
% [X,FVAL,REASON,OUTPUT,POPULATION,SCORES] = ga(fitnessFunction,nvars,[],[],[],[],[],[],[],[],options);
[X,FVAL,REASON,OUTPUT,POPULATION,SCORES] = ga(fitnessFunction,nvars,[],[],[],[],zlb,zub,[],[],options);

Optimal_inputs= X
Optimal_output= -FVAL

save('C:\MATLAB\GPRmodel\SavedGPR\zga_resu_single_')

