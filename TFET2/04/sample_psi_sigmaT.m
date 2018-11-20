clear;
close all;

map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

%%
%%%Read data and store it in a struct
op1 = [];
op2 = [];
%%%%%%%%%

gate = 'PG';
aux = 1

if aux == 1 %HP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\nHP_vds05
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nHP_tbox_25

end

if aux == 2 %LP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\nLP_vds05
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nLP_tbox_25
end

if aux == 221 %vbg = 0V, com vds 0.5V nLP	0.0 1.0 101/
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\03_rampa\nLP_tbox_25_v2
end

%------------------------------------------------------------------------------------------------------------------------------------- PSI
psiArray = [];
sigmaArray = [];

for j=1:2

if aux == 1
	if j == 1
	nomeFile = ['nHP_vds05'];
	tamanho = 101;
	um = 1;
	end

	if j == 2 %nHP_tbox_25_op101_dd_inqu
	nomeFile = ['nHP_tbox_25'];
	tamanho = 101;
	um = tamanho;
	end
end

if aux == 2
	if j == 1
	nomeFile = ['nLP_vds05'];
	tamanho = 101;
	um = 1;
	end

	if j == 2 %
	nomeFile = ['nLP_tbox_25'];
	tamanho = 101;
	um = tamanho;
	end
end

if aux == 221 %
nomeFile = ['nLP_tbox_25_v2'];
tamanho = 101;
um = 1;
end

auxStr = [nomeFile '_op' num2str(um) '_dd_inqu.elpa'];

op1 =  rdcelpa(auxStr,'*',[],op1);	% 0.0


if gate == 'PG'
x_min = find(op1(1).x == 6.100000000000000e-08, 1);
x_max = find(op1(1).x == 7.200000000000000E-08, 1);
end

j
nomeFile
tamanho
um
auxStr
%clear psi_zero qs_zero
%outroPSI = [];
%outroQS = [];

x_mean = (x_max + x_min)/2;
%vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
psi_zero = op1(1).psi_semi(x_mean)
%psi_zero = 0.180139165800000;

qs_zero = op1(1).space_charge(x_mean)
%qs_zero = 1.072943641000000e+08;
op1 = [];
op2 = [];

w = 100e-9;
q = 1.60217653e-19;

for k = 1:tamanho
  textFileName = [nomeFile '_op' num2str(k) '_dd_inqu.elpa'];
  
  if exist(textFileName, 'file')
	 op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V
    
     if gate == 'PG'
		x_min = find(op2(1).x == 6.100000000000000e-08, 1);
		x_max = find(op2(1).x == 7.200000000000000E-08, 1);
	end

     x_mean = (x_max + x_min)/2;
	 
     psi_s(k) = op2(1).psi_semi(x_mean) - psi_zero; %Electrostatic potential in the channel [V]
	
     Qs_eff(k) = op2(1).space_charge(x_mean) - qs_zero;

	 sigma(k) = abs(Qs_eff(k)) * q / w;
	 
	 %psi_s
	 %sigma
	 
     op2 = [];
	else
		fprintf('File %s does not exist.\n', textFileName);
	end
	
end

%------------------------------------------------------------------------------------------------------------------------------------- VGS, ID
%pegar VGS

auxStr = [nomeFile '_dd_iv.elpa'];
op2 =  rdcelpa(auxStr,'*',[],op2);


psiArray(j).x = op2(1).V_g;
psiArray(j).y = psi_s';

sigmaArray(j).x = op2(1).V_g;
sigmaArray(j).y = sigma';

%clear textFileName x_min x_max x_mean psi_s x_eff vectorQs w Qs Qs_eff
clear psi_zero qs_zero
end %for j
