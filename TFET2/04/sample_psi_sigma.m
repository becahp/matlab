clear;
close all;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Object type: Line
set(0,'DefaultLineLineWidth',2);
set(0,'DefaultLineMarkerSize',8);

% Object type: Axes
set(0,'DefaultAxesFontName','Arial');
set(0,'DefaultAxesFontSize',20);
set(0,'DefaultAxesLineWidth',1.5);
set(0,'DefaultAxesTickLength',[0.02 0.02]);
% set(0,'DefaultAxesUnits','inches');
% set(0,'DefaultAxesOuterPosition', [0 0 7 7]);
% set(0,'DefaultAxesPosition',[1 1 5 4]);
%%set(0,'DefaultAxesUnits','normalized');
%%set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
%%set(0,'DefaultAxesPosition',[0.15 0.15 0.7 0.7]);

% Object type: Text
set(0,'DefaultTextFontName','Arial');
set(0,'DefaultTextFontSize',20);
set(0,'DefaultTextInterpreter','remove')
% set(0,'DefaultTextFontName','remove');
% set(0,'DefaultTextFontSize','remove');
% set(0,'DefaultTextInterpreter','remove');

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

op2 =  rdcelpa(auxStr,'*',[],op2);	% 0.0

if gate == 'PG'
x_min = find(op2(1).x == 6.100000000000000e-08, 1);
x_max = find(op2(1).x == 7.200000000000000E-08, 1);
end



x_mean = (x_max + x_min)/2;
%vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
psi_zero = op2(1).psi_semi(x_mean);
%psi_zero = 0.180139165800000;

qs_zero = op2(1).space_charge(x_mean);
%qs_zero = 1.072943641000000e+08;
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
	 
	 
     op2 = [];
	else
		fprintf('File %s does not exist.\n', textFileName);
	end
	
end

%------------------------------------------------------------------------------------------------------------------------------------- VGS, ID
%pegar VGS
auxStr = [nomeFile '_dd_iv.elpa'];
op2 =  rdcelpa(auxStr,'*',[],op2);


%-------------------------------------------------------------------------------------------------------------------------------------
psiArray(j).x = op2(1).V_g;
psiArray(j).y = psi_s;

sigmaArray(j).x = op2(1).V_g;
sigmaArray(j).y = sigma;

op2 = [];

%clear textFileName x_min x_max x_mean psi_s x_eff vectorQs w Qs Qs_eff
end %for j

%-------------------------------------------------------------------------------------------------------------------------------------
figure
h(1) = plot(psiArray(1).x,psiArray(1).y);
hold
h(2) = plot(psiArray(2).x,psiArray(2).y);

xlabel('V_g (V)');
ylabel('\Psi_{channel} (V)');
xlim([0 0.5])
ylim([0 0.5])

if aux == 1
	auxStr = [gate '_HP_psi'];
	legend('HP vbg=1V', 'HP vbg=0V','Location', 'best');
end
if aux == 2
	auxStr = [gate '_LP_psi'];
	legend('LP vbg=1V', 'LP vbg=0V','Location', 'best');
end

legend('boxoff')
print(auxStr, '-depsc');

%--------------------------------------------------

figure
h(1) = plot(sigmaArray(1).x,sigmaArray(1).y*1e6);
hold
h(2) = plot(sigmaArray(2).x,sigmaArray(2).y*1e6);

xlabel('V_g (V)')
ylabel('\sigma_{channel} (\mu C/m^2)')
xlim([0 0.5])

if aux == 1
	auxStr = [gate '_HP_sigma'];
	
	legend('HP vbg=1V', 'HP vbg=0V','Location', 'best');
	
end
if aux == 2
	auxStr = [gate '_LP_sigma'];
	legend('LP vbg=1V', 'LP vbg=0V','Location', 'best');
end
legend('boxoff')
print(auxStr, '-depsc');
%-------------------------------------------------------------------------------------------------------------------------------------


