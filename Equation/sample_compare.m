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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\09_new_vds\nHP_BG_000_25_new_vds
%------------------------------------------------------------------------------------------------------------------------------------- PSI

%myFolder = 'C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer_n\nHP_sp_40';

% Read files mat1.mat through mat20.mat, file1.txt through file20.txt,
% and image1.jpg through image20.jpg.  Files are in the current directory.
% Use fullfile() if you need to prepend some other folder to the base file name.
% Adapt to use which ever cases you need.

op2 =  rdcelpa('nHP_BG_000_25_new_vds_op121_dd_inqu.elpa','*',[],op2);	% 0.0
x_min = find(op2(1).x == 6.100000000000000e-08, 1);
x_max = find(op2(1).x == 7.200000000000000E-08, 1);
x_mean = (x_max + x_min)/2;
%vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
psi_zero = op2(1).psi_semi(x_mean);
qs_zero = op2(1).space_charge(x_mean);
op2 = [];

for k = 1:121
	% Create a text file name, and read the file.
  textFileName = ['nHP_BG_000_25_new_vds_op' num2str(k) '_dd_inqu.elpa'];
  %nHP_BG_000_25_new_vds_op1_dd_inqu
  if exist(textFileName, 'file')
	   op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V
     %op2(1).f_x = abs(op2(1).f_x); %absolute values

     %x_min = find(op2(1).x == 5.700000000000000e-08, 1);
     %x_max = find(op2(1).x == 7.900000000000000E-08, 1);

     x_min = find(op2(1).x == 6.100000000000000e-08, 1);
     x_max = find(op2(1).x == 7.200000000000000E-08, 1);

     x_mean = (x_max + x_min)/2;

     %psi_s(k) = op2(1).psi_semi(x_mean); %Electrostatic potential in the channel [V]
     %psi_s(k) = op2(1).psi_semi(x_mean) - op2(1).psi_semi(1); %Electrostatic potential in the channel [V]

     psi_s(k) = op2(1).psi_semi(x_mean) - psi_zero; %Electrostatic potential in the channel [V]

     %não sei se está certo
     x_eff =  op2(1).x(x_max) - op2(1).x(x_min);
     %Qs_eff(k) = -op2(1).space_charge(x_mean) / (x_eff * 100e-9);
     %Qs_mean = op2(1).space_charge(x_mean); %charge in the channel

     %vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel [V]
     %vectorEx = op2(1).f_x(x_min:x_max)'; %Electric field along x-axis [V/m]
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
%VG = linspace(1,0,81);
op2 =  rdcelpa('nHP_BG_000_25_new_vds_dd_iv.elpa','*',[],op2);

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

for k = 1:121
  %Eox(k) =  (1/(1 + 1/(2*alpha*eps_ox))) * ((op2(1).V_g(k) - psi_s(k)) / tox);
  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_ox) / (1-(abs(alpha) * eps_ox)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_ox * abs(Qs_eff(k)));

  %teste = Qs(k) / (x_eff * w);
  %teste = 0;

  teste = abs(Qs_eff(k)) * q / w;

    %eps_FE = 0.7/abs(alpha);
  %Vg_FE(k) = op2(1).V_g(k) - ((0.7) / (1-(0.7)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  %Vg_FE(k) = op2(1).V_g(k) - ((abs(alpha) * eps_FE) / (1-(abs(alpha) * eps_FE)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  Vg_FE(k) = op2(1).V_g(k) - ((alpha_eps) / (1-(alpha_eps)))*(tFE/tox * (op2(1).V_g(k) - psi_s(k)) + tFE/eps_FE * abs(teste) );

  novo(k) = op2(1).V_g(k) - psi_s(k);
  testeQs(k) = tFE/eps_FE * abs(teste);
end

pule = 0
if pule == 1
figure
h(1) = plot(op2(1).V_g, op2(1).V_g);
hold
h(2) = plot(op2(1).V_g,psi_s);
xlabel('V_g (V)')
ylabel('(V)')
legend('V_g', '\psi_{semi}', 'Location', 'best');

figure
h(1) = semilogy(op2(1).V_g, testeQs);

%--------------------------------------------------------------------------------figura certa
figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d);
hold
h(2) = semilogy(Vg_FE,op2(1).I_d);

xlabel('V_g (V)')
ylabel('I_d (A)')
xlim([0 0.5])
legend('TFET', 'NCTFET with FE layer', 'Location', 'best');
legend('boxoff')
end

[Vg_nLP_FE,Vg_nLP,Id_nLP] = funcao_nLP(alpha_eps);

figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d);
hold
h(2) = semilogy(Vg_FE,op2(1).I_d);
h(3) = semilogy(Vg_nLP,Id_nLP);
h(4) = semilogy(Vg_nLP_FE,Id_nLP);

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(1,:);
h(4).Color = map(2,:);

h(3).LineStyle = '--';
h(4).LineStyle = '--';

xlabel('V_g (V)')
ylabel('I_d (A)')
axis([0 0.5 1E-15 1e-4])
%xlim([0 0.5])
%legend('TFET', 'NCTFET with FE layer', 'Location', 'best');
legend('TFET', 'NCTFET com camada FE ', 'Location', 'best');
legend('boxoff')

print('VG_FE_total_t', '-depsc');


op1 =  rdcelpa('nHP_BG_000_25_dd_iv.elpa','*',[],op1);
op1 =  rdcelpa('nLP_BG_000_25_dd_iv.elpa','*',[],op1);

figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d); %nHP
hold
h(2) = semilogy(Vg_FE,op2(1).I_d); %nHP FE
h(3) = semilogy(Vg_nLP,Id_nLP); %nLP
h(4) = semilogy(Vg_nLP_FE,Id_nLP); %nLP FE
h(5) = semilogy(op1(1).V_g,op1(1).I_d); %nHP
h(6) = semilogy(op1(2).V_g,op1(2).I_d); %nLP

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(1,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);

h(3).LineStyle = '--';
h(4).LineStyle = '--';
h(6).LineStyle = '--';

xlabel('V_g (V)')
ylabel('I_d (A)')
axis([0 0.5 1E-15 1e-4])
legend([h(1),h(2),h(5)],{'TFET vds = 0.5V', 'NCTFET with FE layer','TFET vds = 0.4V' }, 'Location', 'best');
legend('boxoff')


%op1 =  rdcelpa('nHP_BG_000_25_dd_iv.elpa','*',[],op1);


%for k = 1:81
%  oi(k,1) = Qs(k);
%  oi(k,2) = Qs_eff(k);
%  oi(k,3) = (Qs(k)) - (Qs_eff(k));
%end
