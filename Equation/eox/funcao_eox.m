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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\10_pot\nHP_eox

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_01
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_02
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_03
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_04

%------------------------------------------------------------------------------------------------------------------------------------- PSI
op2 =  rdcelpa('nHP_eox_op31_dd_inqu.elpa','*',[],op2);	% 0.0
x_min = find(op2(1).x == 6.100000000000000e-08, 1);
x_max = find(op2(1).x == 7.200000000000000E-08, 1);
x_mean = (x_max + x_min)/2;
%vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
psi_zero = op2(1).psi_semi(x_mean);
qs_zero = op2(1).space_charge(x_mean);
op2 = [];
%------------------------------------------------------------------------------------------------------------------------------------- 

for k = 1:4
op1 = [];
op2 = [];
name_inqu = ['nHP_eox_0' num2str(k) '/nHP_eox_0' num2str(k) '_op1_dd_inqu.elpa']; %('nHP_eox_01/nHP_eox_01_op1_dd_inqu.elpa','*',[],op1);
name_iv = ['nHP_eox_0' num2str(k) '/nHP_eox_0' num2str(k) '_dd_iv.elpa']; %nHP_eox_01_dd_iv
name_psi = ['nHP_eox_0' num2str(k) '/nHP_eox_0' num2str(k) '_op1_dd_psi.elpa']; % ('nHP_eox_01/nHP_eox_01_op1_dd_psi.elpa','*',[],op2)

%for k = 1:61
	% Create a text file name, and read the file.
  %textFileName = ['nHP_eox_op' num2str(k) '_dd_inqu.elpa'];
  %nHP_eox_op1_dd_psi
  %if exist(textFileName, 'file')
	   op2 =  rdcelpa(name_inqu,'*',[],op2);	%1 V
     %op2(1).f_x = abs(op2(1).f_x); %absolute values

     %x_min = find(op2(1).x == 5.700000000000000e-08, 1);
     %x_max = find(op2(1).x == 7.900000000000000E-08, 1);

     x_min = find(op2(1).x == 6.100000000000000e-08, 1);
     x_max = find(op2(1).x == 7.200000000000000E-08, 1);

     x_mean = (x_max + x_min)/2;

     %psi_s(k) = op2(1).psi_semi(x_mean); %Electrostatic potential in the channel [V]
     %psi_s(k) = op2(1).psi_semi(x_mean) - op2(1).psi_semi(1); %Electrostatic potential in the channel [V]

     psi_s(k) = op2(1).psi_semi(x_mean) - psi_zero; %Electrostatic potential in the channel [V]
     psi_nozero(k) = op2(1).psi_semi(x_mean); %Electrostatic potential in the channel [V]
     %não sei se está certo
     %x_eff =  op2(1).x(x_max) - op2(1).x(x_min);
     %Qs_eff(k) = -op2(1).space_charge(x_mean) / (x_eff * 100e-9);
     %Qs_mean = op2(1).space_charge(x_mean); %charge in the channel

     %vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel [V]
     %vectorEx = op2(1).f_x(x_min:x_max)'; %Electric field along x-axis [V/m]
     %vectorQs = op2(1).space_charge(x_min:x_max)'; %Space charge (cargas no canal)

     %w = 100e-9;
     %Qs(k) = mean(vectorQs); % * x_eff * w ;%/  (x_eff * 100e-9);

     %Qs_eff(k) = -op2(1).space_charge(x_mean);
     %Qs_eff(k) = op2(1).space_charge(x_mean) - qs_zero;

     %psi_s(k) = mean(vectorPSI);
     %e_x(k) = mean(vectorEx);
     op2 = [];
	
	
end

%------------------------------------------------------------------------------------------------------------------------------------- VGS, ID
%pegar VGS
%VG = linspace(1,0,81);
op2 =  rdcelpa(name_iv,'*',[],op2);

%-------------------------------------------------------------------------------------------------------------------------------------
% space_charge tem que ser multiplicado pelo comprimento da porta
%eps_cnt = 5 * eps_0;
eps_0 = 8.85E-12; %F/m
eps_ox = 16 * eps_0;
%alpha = -2.12E8; %m/
%alpha = -5.1E9; %m/F
%eps_ox * abs(alpha)
tox = 5e-9;

for k = 1:61
  Eox(k) =  ((op2(1).V_g(k) - psi_s(k)) / tox);
  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_ox) / (1-(abs(alpha) * eps_ox)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_ox * abs(Qs_eff(k)));

  Eox_nozero(k) =  ((op2(1).V_g(k) - psi_nozero(k)) / tox);
end

figure
h(1) = plot(op2(1).V_g, Eox);
hold
h(2) = plot(op2(1).V_g,Eox_nozero);
xlabel('V_g (V)')
ylabel('E_{\rm ox} (V/m)')
legend('(V_g - (\psi_{semi} - \psi_{semi}(0)))/ t_{ox}','(V_g - \psi_{semi})/ t_{ox}', 'Location', 'best');
legend('boxoff')

