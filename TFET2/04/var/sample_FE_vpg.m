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
aux = 2;

if aux == 1 
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\04_FE\var_vds05
end

if aux == 2
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\04_FE\var_vds05_sem
end

%------------------------------------------------------------------------------------------------------------------------------------- PSI

%preciso dos nomes nHP_BG_inv_25_dd_iv, nHP_BG_inv_25_op
if aux == 1
nomeFile = ['var_vds05'];
tamanho = 161;
um = 81;
end

if aux == 2
nomeFile = ['var_vds05_sem'];
tamanho = 161;
um = 81;
end


auxStr = [nomeFile '_op' num2str(um) '_dd_inqu.elpa'];

op2 =  rdcelpa(auxStr,'*',[],op2);	% 0.0

% mod_name='vpg' shape='rect'   low_xyz= 15e-9	 31e-9 	0 		upp_xyz= 37e-9   66e-9 100e-9 cont_name='GS' /
if gate == 'PG'
x_min = find(op2(1).x == 1.900000000000000e-08, 1);
x_max = find(op2(1).x == 3.000000000000000E-08, 1);
end

% mod_name='gate' shape='rect'  low_xyz= 57e-9  31e-9	0 		upp_xyz= 79e-9   66e-9 100e-9 cont_name='G' /
if gate == 'CG'
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
	% Create a text file name, and read the file.
  %textFileName = ['nHP_BG_inv_25_op' num2str(k) '_dd_inqu.elpa'];
  textFileName = [nomeFile '_op' num2str(k) '_dd_inqu.elpa'];

  if exist(textFileName, 'file')
	 op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V
    
	if gate == 'PG'
	x_min = find(op2(1).x == 1.900000000000000e-08, 1);
	x_max = find(op2(1).x == 3.000000000000000E-08, 1);
	end

	% mod_name='gate' shape='rect'  low_xyz= 57e-9  31e-9	0 		upp_xyz= 79e-9   66e-9 100e-9 cont_name='G' /
	if gate == 'CG'
	x_min = find(op2(1).x == 6.100000000000000e-08, 1);
	x_max = find(op2(1).x == 7.200000000000000E-08, 1);
	end

     x_mean = (x_max + x_min)/2;
	 
     psi_s(k) = op2(1).psi_semi(x_mean) - psi_zero; %Electrostatic potential in the channel [V]
	
     Qs_eff(k) = op2(1).space_charge(x_mean) - qs_zero;

	 sigma(k) = (Qs_eff(k)) * q / w;
	 
	 
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
plot = 0
if plot == 123
	%plot Vgs vs Psi_s
	figure
	h(1) = plot(op2(1).V_gs,psi_s);
	xlabel('V_pg (V)');
	ylabel('\Psi_{channel} (V)');
	%xlim([0 0.5])

	auxStr = [gate '_' nomeFile '_psi'];
	print(auxStr, '-depsc');

	%-------------------------------------------------------------------------------------------------------------------------------------
	%plot Vgs vs sigma
	figure
	h(1) = plot(op2(1).V_gs,sigma*1e6);

	xlabel('V_pg (V)')
	ylabel('\sigma_{channel} (\mu C/m^2)')
	%xlim([0 0.5])

	auxStr = [gate '_' nomeFile '_sigma'];
	print(auxStr, '-depsc');
end
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
alpha_eps = 0.5;
q = 1.60217653e-19;

for k = 1:tamanho
  %Eox(k) =  (1/(1 + 1/(2*alpha*eps_ox))) * ((op2(1).V_g(k) - psi_s(k)) / tox);
  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_ox) / (1-(abs(alpha) * eps_ox)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_ox * abs(Qs_eff(k)));

  %teste = Qs(k) / (x_eff * w);
  %teste = 0;

  teste = abs(Qs_eff(k)) * q / w;
  %sigma(k) = teste;

  %eps_FE = 0.7/abs(alpha);
  %Vg_FE(k) = op2(1).V_g(k) - ((0.7) / (1-(0.7)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_FE) / (1-(abs(alpha) * eps_FE)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  Vg_FE(k) = op2(1).V_gs(k) - ((alpha_eps) / (1-(alpha_eps)))*(tFE/tox * (op2(1).V_gs(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  novo(k) = op2(1).V_gs(k) - psi_s(k);
  testeQs(k) = tFE/eps_FE * abs(teste);
end

%-------------------------------------------------------------------------------------------------------------------------------------
plot = 123
if plot == 123
figure
h(1) = semilogy(op2(1).V_gs,op2(1).I_d);
hold
h(2) = semilogy(Vg_FE,op2(1).I_d);

xlabel('V_{pg} (V)')
ylabel('I_d (A)')
%xlim([0 0.5])

%axis([0 0.5 1E-8 2e-5])

%if aux == 11 || aux == 22 || aux == 221
%axis([0 0.5 1E-15 1e-7])
%ay = gca;
%ay.YTick = [1e-15 1e-13 1e-11 1e-9 1e-7];
%end
if aux == 1
legend('mmFET', 'mmNCFET', 'Location', 'Northwest');
end

if aux == 2
legend('nFET', 'nNCFET', 'Location', 'Northwest');
end

legend('boxoff')

auxStr = ['FE_' nomeFile];
print(auxStr, '-depsc');

end
%-------------------------------------------------------------------------------------------------------------------------------------
plot = 0;
if plot == 1234
alpha_eps = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7];

for i=1:8

for k = 1:tamanho
  teste = abs(Qs_eff(k)) * q / w;  
  Vg_FE(k) = op2(1).V_gs(k) - ((alpha_eps(i)) / (1-(alpha_eps(i))))*(tFE/tox * (op2(1).V_gs(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );
end


figure
h(1) = semilogy(op2(1).V_gs,op2(1).I_d);
hold
h(2) = semilogy(Vg_FE,op2(1).I_d);

xlabel('V_pg (V)')
ylabel('I_d (A)')
hold off;

end

end

