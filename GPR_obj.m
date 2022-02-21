function fit=GPR_obj(x)

global GPRm 

fit1= predict(GPRm, x);
fit= -1*fit1   %% - for Maximization
 
end