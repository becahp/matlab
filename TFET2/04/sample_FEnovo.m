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

aux = 11


%%%%%%%%%%%%%%%%%%%%%%%%%% HP
%vbg = -1V
%vpg = 1V
if aux == 1 %vbg = inverso com vds 0.5V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\nHP_vds05
end

%vbg = 0V
%vpg = 1V
if aux == 2 %vbg = 0V, com vds 0.5V
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nHP_tbox_25
end

%vbg = 1V
%vpg = 1V
if aux == 3 %vbg = inverso com vds 0.5V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\HP\nHP_BG_010
end

%%%%%%%%%%%%%%%%%%%%%%%%%% LP
%vbg = 1V
%vpg = -1V
if aux == 11 %vbg = inverso com vds 0.5V NLP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\nLP_vds05
end

%vbg = 0V
%vpg = -1V
if aux == 22 %vbg = 0V, com vds 0.5V nLP	1.0 0.0 101/
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nLP_tbox_25
end

if aux == 221 %vbg = 0V, com vds 0.5V nLP	0.0 1.0 101/
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\03_rampa\nLP_tbox_25_v2
end


%vbg = -1V
%vpg = -1V
if aux == 33 %vbg = inverso com vds 0.5V NLP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\re\nLP_BG_110
end

%------------------------------------------------------------------------------------------------------------------------------------- PSI

%preciso dos nomes nHP_BG_inv_25_dd_iv, nHP_BG_inv_25_op
if aux == 1
nomeFile = ['nHP_vds05'];
tamanho = 101;
um = 1;
end

if aux == 11
nomeFile = ['nLP_vds05'];
tamanho = 101;
um = 1;
end

if aux == 2 %nHP_tbox_25_op101_dd_inqu
nomeFile = ['nHP_tbox_25'];
tamanho = 101;
um = tamanho;
end

if aux == 22 %
nomeFile = ['nLP_tbox_25'];
tamanho = 101;
um = tamanho;
end

if aux == 221 %
nomeFile = ['nLP_tbox_25_v2'];
tamanho = 101;
um = 1;
end

if aux == 3 %
nomeFile = ['nHP_BG_010'];
tamanho = 101;
um = tamanho;
end

if aux == 33 %
nomeFile = ['nLP_BG_110'];
tamanho = 101;
um = 1;
end

auxStr = [nomeFile '_op' num2str(um) '_dd_inqu.elpa'];

op2 =  rdcelpa(auxStr,'*',[],op2);	% 0.0
x_min = find(op2(1).x == 6.100000000000000e-08, 1);
x_max = find(op2(1).x == 7.200000000000000E-08, 1);
x_mean = (x_max + x_min)/2;
%vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
psi_zero = op2(1).psi_semi(x_mean);
%psi_zero = 0.180139165800000;

qs_zero = op2(1).space_charge(x_mean);
%qs_zero = 1.072943641000000e+08;
op2 = [];

for k = 1:tamanho
	% Create a text file name, and read the file.
  %textFileName = ['nHP_BG_inv_25_op' num2str(k) '_dd_inqu.elpa'];
  textFileName = [nomeFile '_op' num2str(k) '_dd_inqu.elpa'];

  if exist(textFileName, 'file')
	 op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V
    
     x_min = find(op2(1).x == 6.100000000000000e-08, 1);
     x_max = find(op2(1).x == 7.200000000000000E-08, 1);

     x_mean = (x_max + x_min)/2;

	 
     psi_s(k) = op2(1).psi_semi(x_mean) - psi_zero; %Electrostatic potential in the channel [V]

     %não sei se está certo
     x_eff =  op2(1).x(x_max) - op2(1).x(x_min);
     %Qs_eff(k) = -op2(1).space_charge(x_mean) / (x_eff * 100e-9);
     %Qs_mean = op2(1).space_charge(x_mean); %charge in the channel

     vectorQs = op2(1).space_charge(x_min:x_max)'; %Space charge (cargas no canal)

     w = 100e-9;
     Qs(k) = mean(vectorQs); % * x_eff * w ;%/  (x_eff * 100e-9);

     %Qs_eff(k) = -op2(1).space_charge(x_mean);
     Qs_eff(k) = op2(1).space_charge(x_mean) - qs_zero;

     %psi_s(k) = mean(vectorPSI);
     %e_x(k) = mean(vectorEx);
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
%plot Vgs vs Psi_s
%figure
%h(1) = plot(op2(1).V_g,psi_s);
%xlabel('V_g (V)');
%ylabel('\Psi_{channel} (V)');
%auxStr = ['CG_' nomeFile '_psi'];
%print(auxStr, '-depsc');

%-------------------------------------------------------------------------------------------------------------------------------------
% space_charge tem que ser multiplicado pelo comprimento da porta
%eps_cnt = 5 * eps_0;
eps_0 = 8.85E-12; %F/m
eps_ox = 16 * eps_0;
alpha = -2.12E8; %m/
%alpha = -5.1E9; %m/F
%eps_ox * abs(alpha)
tox = 5e-9;

%------------------------------------------------------------------------------------------------------------------------------------- FE layer
eps_FE = eps_ox;
tFE = tox;
alpha_eps = 0.6;
%alpha_2 = 0.6;
q = 1.60217653e-19;

for k = 1:tamanho
  %Eox(k) =  (1/(1 + 1/(2*alpha*eps_ox))) * ((op2(1).V_g(k) - psi_s(k)) / tox);
  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_ox) / (1-(abs(alpha) * eps_ox)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_ox * abs(Qs_eff(k)));

  %teste = Qs(k) / (x_eff * w);
  %teste = 0;

  teste = abs(Qs_eff(k)) * q / w;
  sigma(k) = teste;

    %eps_FE = 0.7/abs(alpha);
  %Vg_FE(k) = op2(1).V_g(k) - ((0.7) / (1-(0.7)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_FE) / (1-(abs(alpha) * eps_FE)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  Vg_FE(k) = op2(1).V_g(k) - ((alpha_eps) / (1-(alpha_eps)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  novo(k) = op2(1).V_g(k) - psi_s(k);
  testeQs(k) = tFE/eps_FE * abs(teste);
end


%-------------------------------------------------------------------------------------------------------------------------------------
%plot Vgs vs sigma
%figure
%h(1) = plot(op2(1).V_g,sigma);
%xlabel('V_g (V)')
%ylabel('\sigma_{channel} (C/m^2)')

%auxStr = ['CG_' nomeFile '_sigma'];
%print(auxStr, '-depsc');

%-------------------------------------------------------------------------------------------------------------------------------------
figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d);
hold
h(2) = semilogy(Vg_FE,op2(1).I_d);

xlabel('V_g (V)')
ylabel('I_d (A)')
%xlim([0 0.5])

if aux == 1 || aux == 2 || aux == 3
axis([0 0.5 1E-8 2e-5])
end

if aux == 11 || aux == 22 || aux == 221 || aux == 33
axis([0 0.5 1E-15 1e-7])
ay = gca;
ay.YTick = [1e-15 1e-13 1e-11 1e-9 1e-7];
end

legend('TFET', 'NCTFET with FE layer', 'Location', 'best');
legend('boxoff')

if aux == 1
nomeFile = ['HP_110'];
end
if aux == 2
nomeFile = ['HP_000'];
end
if aux == 3 %
nomeFile = ['HP_010'];
end

if aux == 11
nomeFile = ['LP_010'];
end
if aux == 22 || aux == 221
nomeFile = ['LP_000'];
end
if aux == 33
nomeFile = ['LP_110'];
end


%auxStr = ['newFE_' nomeFile];
%print(auxStr, '-depsc');

