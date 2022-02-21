%% Hamed Ahmadi, The sensitivity analysis of GPR Model using VSR
%--------------------------------------------------------------------------
clc,clear; close all;
format short g;
load C:\MATLAB\GPRmodel\SavedGPR\ws_gf_gfe2022_final_new.mat;  % Loading best model from training process

% Preparing data for sensitivity analysis
% run Data_gpr;

[Rs,Cs]=size(info);
ninp=Cs-2;
%%
if ninp==2;
    fs1= inp(:,1);
    fs2= inp(:,2);

    fs1(fs1<1e+50)=mean(fs1);
    fs2(fs2<1e+50)=mean(fs2);

    inpSen1=[fs1 inp(:,2)];
    inpSen2=[inp(:,1) fs2];

    %Simulate for constant vars
    inpConstant1=[inp(:,1) fs2];
    YsenC1= predict(GPRm, inpConstant1);
    inpConstant2=[fs1 inp(:,2)];
    YsenC2= predict(GPRm, inpConstant2);

    x1=inp(:,1);
    x2=inp(:,2);
    subplot(221); plot(x1,YsenC1,'o'); xlabel('x1');ylabel('Y')
    subplot(222); plot(x2,YsenC2,'o'); xlabel('x2');ylabel('Y')


    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR= [VSR1 VSR2];
    table(VSR1, VSR2)

elseif ninp==3;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);

    fs1(fs1<1e+50)=max(fs1);
    fs2(fs2<1e+50)=max(fs2);
    fs3(fs3<1e+50)=max(fs3);

    inpSen1=[fs1 inp(:,2) inp(:,3)];
    inpSen2=[inp(:,1) fs2 inp(:,3)];
    inpSen3=[inp(:,1) inp(:,2) fs3];

    %Simulate for constant vars
    inpConstant1=[inp(:,1) fs2 fs3];
    YsenC1= predict(GPRm, inpConstant1);
    inpConstant2=[fs1 inp(:,2) fs3];
    YsenC2= predict(GPRm, inpConstant2);
    inpConstant3=[fs1 fs2 inp(:,3)];
    YsenC3= predict(GPRm, inpConstant3);

    x1=inp(:,1);
    x2=inp(:,2);
    x3=inp(:,3);
    subplot(221); plot(x1,YsenC1,'o'); xlabel('x1');ylabel('Y')
    subplot(222); plot(x2,YsenC2,'o'); xlabel('x2');ylabel('Y')
    subplot(223); plot(x3,YsenC3,'o'); xlabel('x3');ylabel('Y')



    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR= [VSR1 VSR2 VSR3];
    table(VSR1, VSR2, VSR3)


elseif ninp==4;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);
    fs4= inp(:,4);

    fs1(fs1<1e+50)=mean(fs1);
    fs2(fs2<1e+50)=mean(fs2);
    fs3(fs3<1e+50)=mean(fs3);
    fs4(fs4<1e+50)=mean(fs4);


    inpSen1=[fs1 inp(:,2) inp(:,3) inp(:,4)];
    inpSen2=[inp(:,1) fs2 inp(:,3) inp(:,4)];
    inpSen3=[inp(:,1) inp(:,2) fs3 inp(:,4)];
    inpSen4=[inp(:,1) inp(:,2) inp(:,3) fs4];

    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);
    Ysen4= predict(GPRm, inpSen4);


    %Simulate for constant vars
    inpConstant1=[inp(:,1) fs2 fs3 fs4];
    YsenC1= predict(GPRm, inpConstant1);
    inpConstant2=[fs1 inp(:,2) fs3 fs4];
    YsenC2= predict(GPRm, inpConstant2);
    inpConstant3=[fs1 fs2 inp(:,3) fs4];
    YsenC3= predict(GPRm, inpConstant3);
    inpConstant4=[fs1 fs2 fs3 inp(:,4)];
    YsenC4= predict(GPRm, inpConstant4);

    x1=inp(:,1);
    x2=inp(:,2);
    x3=inp(:,3);
    x4=inp(:,4);
    subplot(221); plot(x1,YsenC1,'o'); xlabel('x1');ylabel('Y')
    subplot(222); plot(x2,YsenC2,'o'); xlabel('x2');ylabel('Y')
    subplot(223); plot(x3,YsenC3,'o'); xlabel('x3');ylabel('Y')
    subplot(224); plot(x4,YsenC4,'o'); xlabel('x4');ylabel('Y')

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    ResS4= Ysen4-out;
    SES4=  ResS4.^2;
    MSES4= sum(SES4)/Rs; %= VSE
    %
    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR4= MSES4/MSEall;
    VSR= [VSR1 VSR2 VSR3 VSR4];
    table(VSR1, VSR2, VSR3, VSR4)


elseif ninp==5;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);
    fs4= inp(:,4);
    fs5= inp(:,5);

    fs1(fs1<1e+50)=min(fs1);
    fs2(fs2<1e+50)=min(fs2);
    fs3(fs3<1e+50)=min(fs3);
    fs4(fs4<1e+50)=min(fs4);
    fs5(fs5<1e+50)=min(fs5);

    inpSen1=[fs1 inp(:,2) inp(:,3) inp(:,4) inp(:,5)];
    inpSen2=[inp(:,1) fs2 inp(:,3) inp(:,4) inp(:,5)];
    inpSen3=[inp(:,1) inp(:,2) fs3 inp(:,4) inp(:,5)];
    inpSen4=[inp(:,1) inp(:,2) inp(:,3) fs4 inp(:,5)];
    inpSen5=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) fs5];

    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);
    Ysen4= predict(GPRm, inpSen4);
    Ysen5= predict(GPRm, inpSen5);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    ResS4= Ysen4-out;
    SES4=  ResS4.^2;
    MSES4= sum(SES4)/Rs; %= VSE
    %
    ResS5= Ysen5-out;
    SES5=  ResS5.^2;
    MSES5= sum(SES5)/Rs; %= VSE

    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR4= MSES4/MSEall;
    VSR5= MSES5/MSEall;
    VSR= [VSR1 VSR2 VSR3 VSR4 VSR5];
    table(VSR1, VSR2, VSR3, VSR4, VSR5)

elseif ninp==6;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);
    fs4= inp(:,4);
    fs5= inp(:,5);
    fs6= inp(:,6);

    fs1(fs1<1e+50)=min(fs1);
    fs2(fs2<1e+50)=min(fs2);
    fs3(fs3<1e+50)=min(fs3);
    fs4(fs4<1e+50)=min(fs4);
    fs5(fs5<1e+50)=min(fs5);
    fs6(fs6<1e+50)=min(fs6);

    inpSen1=[fs1 inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6)];
    inpSen2=[inp(:,1) fs2 inp(:,3) inp(:,4) inp(:,5) inp(:,6)];
    inpSen3=[inp(:,1) inp(:,2) fs3 inp(:,4) inp(:,5) inp(:,6)];
    inpSen4=[inp(:,1) inp(:,2) inp(:,3) fs4 inp(:,5) inp(:,6)];
    inpSen5=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) fs5 inp(:,6)];
    inpSen6=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) fs6];


    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);
    Ysen4= predict(GPRm, inpSen4);
    Ysen5= predict(GPRm, inpSen5);
    Ysen6= predict(GPRm, inpSen6);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    ResS4= Ysen4-out;
    SES4=  ResS4.^2;
    MSES4= sum(SES4)/Rs; %= VSE
    %
    ResS5= Ysen5-out;
    SES5=  ResS5.^2;
    MSES5= sum(SES5)/Rs; %= VSE
    %
    ResS6= Ysen6-out;
    SES6=  ResS6.^2;
    MSES6= sum(SES6)/Rs; %= VSE

    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR4= MSES4/MSEall;
    VSR5= MSES5/MSEall;
    VSR6= MSES6/MSEall;
    VSR= [VSR1 VSR2 VSR3 VSR4 VSR5 VSR6];
    table(VSR1, VSR2, VSR3, VSR4, VSR5, VSR6)

elseif ninp==7;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);
    fs4= inp(:,4);
    fs5= inp(:,5);
    fs6= inp(:,6);
    fs7= inp(:,7);

    fs1(fs1<1e+50)=min(fs1);
    fs2(fs2<1e+50)=min(fs2);
    fs3(fs3<1e+50)=min(fs3);
    fs4(fs4<1e+50)=min(fs4);
    fs5(fs5<1e+50)=min(fs5);
    fs6(fs6<1e+50)=min(fs6);
    fs7(fs7<1e+50)=min(fs7);

    inpSen1=[fs1 inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7)];
    inpSen2=[inp(:,1) fs2 inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7)];
    inpSen3=[inp(:,1) inp(:,2) fs3 inp(:,4) inp(:,5) inp(:,6) inp(:,7)];
    inpSen4=[inp(:,1) inp(:,2) inp(:,3) fs4 inp(:,5) inp(:,6) inp(:,7)];
    inpSen5=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) fs5 inp(:,6) inp(:,7)];
    inpSen6=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) fs6 inp(:,7)];
    inpSen7=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) fs7];


    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);
    Ysen4= predict(GPRm, inpSen4);
    Ysen5= predict(GPRm, inpSen5);
    Ysen6= predict(GPRm, inpSen6);
    Ysen7= predict(GPRm, inpSen7);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    ResS4= Ysen4-out;
    SES4=  ResS4.^2;
    MSES4= sum(SES4)/Rs; %= VSE
    %
    ResS5= Ysen5-out;
    SES5=  ResS5.^2;
    MSES5= sum(SES5)/Rs; %= VSE
    %
    ResS6= Ysen6-out;
    SES6=  ResS6.^2;
    MSES6= sum(SES6)/Rs; %= VSE
    %
    ResS7= Ysen7-out;
    SES7=  ResS7.^2;
    MSES7= sum(SES7)/Rs; %= VSE

    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR4= MSES4/MSEall;
    VSR5= MSES5/MSEall;
    VSR6= MSES6/MSEall;
    VSR7= MSES7/MSEall;
    VSR= [VSR1 VSR2 VSR3 VSR4 VSR5 VSR6 VSR7];
    table(VSR1, VSR2, VSR3, VSR4, VSR5, VSR6, VSR7)


elseif ninp==8;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);
    fs4= inp(:,4);
    fs5= inp(:,5);
    fs6= inp(:,6);
    fs7= inp(:,7);
    fs8= inp(:,8);

    fs1(fs1<1e+50)=min(fs1);
    fs2(fs2<1e+50)=min(fs2);
    fs3(fs3<1e+50)=min(fs3);
    fs4(fs4<1e+50)=min(fs4);
    fs5(fs5<1e+50)=min(fs5);
    fs6(fs6<1e+50)=min(fs6);
    fs7(fs7<1e+50)=min(fs7);
    fs8(fs8<1e+50)=min(fs8);

    inpSen1=[fs1 inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8)];
    inpSen2=[inp(:,1) fs2 inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8)];
    inpSen3=[inp(:,1) inp(:,2) fs3 inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8)];
    inpSen4=[inp(:,1) inp(:,2) inp(:,3) fs4 inp(:,5) inp(:,6) inp(:,7) inp(:,8)];
    inpSen5=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) fs5 inp(:,6) inp(:,7) inp(:,8)];
    inpSen6=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) fs6 inp(:,7) inp(:,8)];
    inpSen7=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) fs7 inp(:,8)];
    inpSen8=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) fs8];

    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);
    Ysen4= predict(GPRm, inpSen4);
    Ysen5= predict(GPRm, inpSen5);
    Ysen6= predict(GPRm, inpSen6);
    Ysen7= predict(GPRm, inpSen7);
    Ysen8= predict(GPRm, inpSen8);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    ResS4= Ysen4-out;
    SES4=  ResS4.^2;
    MSES4= sum(SES4)/Rs; %= VSE
    %
    ResS5= Ysen5-out;
    SES5=  ResS5.^2;
    MSES5= sum(SES5)/Rs; %= VSE
    %
    ResS6= Ysen6-out;
    SES6=  ResS6.^2;
    MSES6= sum(SES6)/Rs; %= VSE
    %
    ResS7= Ysen7-out;
    SES7=  ResS7.^2;
    MSES7= sum(SES7)/Rs; %= VSE
    %
    ResS8= Ysen8-out;
    SES8=  ResS8.^2;
    MSES8= sum(SES8)/Rs; %= VSE

    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR4= MSES4/MSEall;
    VSR5= MSES5/MSEall;
    VSR6= MSES6/MSEall;
    VSR7= MSES7/MSEall;
    VSR8= MSES8/MSEall;

    VSR= [VSR1 VSR2 VSR3 VSR4 VSR5 VSR6 VSR7 VSR8];
    table(VSR1, VSR2, VSR3, VSR4, VSR5, VSR6, VSR7, VSR8)


elseif ninp==9;
    fs1= inp(:,1);
    fs2= inp(:,2);
    fs3= inp(:,3);
    fs4= inp(:,4);
    fs5= inp(:,5);
    fs6= inp(:,6);
    fs7= inp(:,7);
    fs8= inp(:,8);
    fs9= inp(:,9);

    fs1(fs1<1e+50)=min(fs1);
    fs2(fs2<1e+50)=min(fs2);
    fs3(fs3<1e+50)=min(fs3);
    fs4(fs4<1e+50)=min(fs4);
    fs5(fs5<1e+50)=min(fs5);
    fs6(fs6<1e+50)=min(fs6);
    fs7(fs7<1e+50)=min(fs7);
    fs8(fs8<1e+50)=min(fs8);
    fs9(fs9<1e+50)=min(fs9);

    inpSen1=[fs1 inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8) inp(:,9)];
    inpSen2=[inp(:,1) fs2 inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8) inp(:,9)];
    inpSen3=[inp(:,1) inp(:,2) fs3 inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8) inp(:,9)];
    inpSen4=[inp(:,1) inp(:,2) inp(:,3) fs4 inp(:,5) inp(:,6) inp(:,7) inp(:,8) inp(:,9)];
    inpSen5=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) fs5 inp(:,6) inp(:,7) inp(:,8) inp(:,9)];
    inpSen6=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) fs6 inp(:,7) inp(:,8) inp(:,9)];
    inpSen7=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) fs7 inp(:,8) inp(:,9)];
    inpSen8=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) fs8 inp(:,9)];
    inpSen9=[inp(:,1) inp(:,2) inp(:,3) inp(:,4) inp(:,5) inp(:,6) inp(:,7) inp(:,8) fs9];

    % Simulating network with modified data matrix
    Ysen1= predict(GPRm, inpSen1);
    Ysen2= predict(GPRm, inpSen2);
    Ysen3= predict(GPRm, inpSen3);
    Ysen4= predict(GPRm, inpSen4);
    Ysen5= predict(GPRm, inpSen5);
    Ysen6= predict(GPRm, inpSen6);
    Ysen7= predict(GPRm, inpSen7);
    Ysen8= predict(GPRm, inpSen8);
    Ysen9= predict(GPRm, inpSen9);

    % Calculating Variable sensitivity error (VSE) Variable sensitivity ratio (VSR)
    Resall= ypred-out;
    SESall=  Resall.^2;
    MSEall= sum(SESall)/Rs; % Model error when all var are available
    %
    ResS1= Ysen1-out;
    SES1=  ResS1.^2;
    MSES1= sum(SES1)/Rs; %= VSE
    %
    ResS2= Ysen2-out;
    SES2=  ResS2.^2;
    MSES2= sum(SES2)/Rs; %= VSE
    %
    ResS3= Ysen3-out;
    SES3=  ResS3.^2;
    MSES3= sum(SES3)/Rs; %= VSE
    %
    ResS4= Ysen4-out;
    SES4=  ResS4.^2;
    MSES4= sum(SES4)/Rs; %= VSE
    %
    ResS5= Ysen5-out;
    SES5=  ResS5.^2;
    MSES5= sum(SES5)/Rs; %= VSE
    %
    ResS6= Ysen6-out;
    SES6=  ResS6.^2;
    MSES6= sum(SES6)/Rs; %= VSE
    %
    ResS7= Ysen7-out;
    SES7=  ResS7.^2;
    MSES7= sum(SES7)/Rs; %= VSE
    %
    ResS8= Ysen8-out;
    SES8=  ResS8.^2;
    MSES8= sum(SES8)/Rs; %= VSE
    %
    ResS9= Ysen9-out;
    SES9=  ResS9.^2;
    MSES9= sum(SES9)/Rs; %= VSE

    VSR1= MSES1/MSEall;
    VSR2= MSES2/MSEall;
    VSR3= MSES3/MSEall;
    VSR4= MSES4/MSEall;
    VSR5= MSES5/MSEall;
    VSR6= MSES6/MSEall;
    VSR7= MSES7/MSEall;
    VSR8= MSES8/MSEall;
    VSR9= MSES9/MSEall;

    VSR= [VSR1 VSR2 VSR3 VSR4 VSR5 VSR6 VSR7 VSR8 VSR9];
    table(VSR1, VSR2, VSR3, VSR4, VSR5, VSR6, VSR7, VSR8, VSR9)
end
