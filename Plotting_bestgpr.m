clear;clc;close all;format shortG
% Loading desired GPR model from training process

load C:\MATLAB\GPRmodel\SavedGPR\ws_gf_gfe2022_final_new;
% Display Outputs
[ypred,predsd,yrange] = predict(GPRm,inp,'Alpha',0.05);
OUT=[inp out ypred yval res_pred res_val];
OUTt=table(inp, out, ypred, yval, res_pred, res_val,predsd,yrange)
Mdl_tr = fitlm(ypred,res_pred);
p_tr_res = Mdl_tr.Coefficients.pValue(2,:);

Mdl_val = fitlm(yval,res_val);
p_val_res = Mdl_val.Coefficients.pValue(2,:);


%% Plotting results
createfigure(out, ypred);title(['Actual vs Predicted' '   R^2= ' num2str(R2pred) '  RMSE = ' num2str(RMSEpred)]);grid on;
xlabel('Actual');ylabel('Predicted');legend('Act vs Pred','Regression');
createfigure(out, yval); title(['Actual vs Validation' '   R^2= ' num2str(R2val) '  RMSE = ' num2str(RMSEval)]);grid on;
xlabel('Actual');ylabel('Validation');legend('Act vs Val','Regression');
createfigure(ypred, res_pred); title(['Pred vs Residual' '   P-value = ' num2str(p_tr_res)]);grid on;
xlabel('Predicted');ylabel('Residual');legend('Pred vs Res','Regression')
createfigure(yval, res_val);title(['Validation vs Residual' '   P-value = ' num2str(p_val_res)]);grid on;
xlabel('Validation');ylabel('Residual'); legend('Val vs Res','Regression')

%% All in one
% Tarining
figure (5)
subplot(231);plot(dl,out,'.',dl,ypred,'-');legend('Actual','Predicted');xlabel('Data lines');ylabel('G:F, g/g');
title(['Training' '   R^2= ' num2str(R2pred) '  RMSE = ' num2str(RMSEpred)]);grid on;
% Validation
subplot(234);plot(dl,out,'.',dl,yval,'-');legend('Actual','Validation');xlabel('Data lines');ylabel('G:F, g/g');
title(['Validating' '   R^2= ' num2str(R2val) '  RMSE = ' num2str(RMSEval)]);grid on;
% Actual vs predicted
subplot(232);scatter(out,ypred,'k.');;xlabel('Actual');ylabel('Predicted');
title(['Actual vs predicted' '   R^2= ' num2str(R2pred) '  RMSE = ' num2str(RMSEpred)]);grid on;
% Actual vs validation
subplot(235);scatter(out,yval,'k.');;xlabel('Actual');ylabel('Validation');
title(['Actual vs validation' '   R^2= ' num2str(R2val) '  RMSE = ' num2str(RMSEval)]);grid on;
% Predicted vs residual
subplot(233);scatter(ypred,res_pred,'k.');;xlabel('Predicted');ylabel('Residual');
title(['Predicted vs residual']);grid on;
% Vaidation vs residual
subplot(236);scatter(yval,res_val,'k.');;xlabel('Validation');ylabel('Residual');
title(['Validation vs residual']);grid on;
figure (6)
plot(out, 'O'); hold on; errorbar(ypred,predsd);legend('Actual','Predicted (SD)');xlabel('Data lines');ylabel('Y');
title(['Training' '   R^2= ' num2str(R2pred) '  RMSE = ' num2str(RMSEpred)]);grid on;



%%
% for costume predictin change [inp]
[ypred,predsd,yrange] = predict(GPRm,inp,'Alpha',0.05);
