clear all
close all

%addpath ~/UnB/Artigo/Simulacoes/TFET2/01_miniFET/03_tfet_as
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\01_miniFET\03_tfet_as


op2 = [];
op2 =  rdcelpa('tFET_mini3_v7_dd_iv.elpa','*',[],op2);


op2(1).I_d = abs(op2(1).I_d);

%figure
%h(1) = semilogy(op2(1).V_g,op2(1).I_d );
%xlabel('V_{gs} (V)')
%ylabel('I_{ds} (A)')

i = 1;
ion(i) = op2(i).I_d(1); %1V
ioff(i) = op2(i).I_d(101); %0V
%vgb(i) = op2(i).V_gb(1);
ratio(i) = ion(i)./ioff(i);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
op2 = [];
%addpath ~/UnB/Artigo/Simulacoes/TFET2/01_miniFET/04_dv
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\01_miniFET\04_dv

op2 =  rdcelpa('nFET_mini_v2_dd_iv.elpa','*',[],op2);	%04_dv

op2(1).I_d = abs(op2(1).I_d);

%encontrar vg = 1
%find(op2.V_g == 0.5)
%op2.I_d(find(op2.V_g == 0.5))

%aux = 0.000006303752377
%find(op2.I_d == aux)

i = 1;
ion(i+1) = op2(i).I_d(1); %1V
ioff(i+1) = op2(i).I_d(101); %0V
%vgb(i) = op2(i).V_gb(1);
ratio(i+1) = ion(i+1)./ioff(i+1);


%figure
%h(1) = semilogy(op2(1).V_g,op2(1).I_d );
%xlabel('V_{gs} (V)')
%ylabel('I_{ds} (A)')

