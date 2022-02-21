function fit=GPR_multi_obj(x)

global GPRm GPRm1 GPRm2 model1 model2 model3

fit1= predict(model1, x);
fit_1= -1*fit1;   %% - for Maximization

fit2= predict(model2, x);
fit_2= -1*fit2;   %% - for Maximization

% fit3= predict(model3, x);
% fit_3= -1*fit3;   %% - for Maximization

fit= [fit_1 fit_2]
end