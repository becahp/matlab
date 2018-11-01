clear;
close all;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

% The new defaults will not take effect if there are any open figures. To
% use them, we close all figures, and then repeat the first example.

%close all;

% Default settings: Default + Object type + Property

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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25     %1D
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp_pot\nHP_BG_000_25 %2D
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_potential\nLP_BG_000_25

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS_n
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\04_backgate

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\10_pot\nHP_BG_000_25_dv %2D


%%
%%%Read data and store it in a struct
op1 = [];
op2 = [];
%aux = 3
%%%%%%%%%

%pegar psi do elpa
%op1 =  rdcelpa('07_backgate_sp/nHP_BG_000_25_dd_iv.elpa','*',[],op1);
%op1 =  rdcelpa('07_backgate_sp/nLP_BG_000_25_dd_iv.elpa','*',[],op1);

%mod_name='cnt' shape='rect' 	 low_xyz= 10e-9  26e-9	50e-9 	upp_xyz= 119e-9  26e-9 50e-9 /
%op2 =  rdcelpa('nHP_BG_000_25/nHP_BG_000_25_op1_dd_psi.elpa','*',[],op2); %0V


%[A,a,fl] = readELPA('nHP_BG_000_25/nHP_BG_000_25_op1_dd_inqu.elpa'); %0.0V
%[V_g, V_s, V_d]=minhafuncao2(fl);

%C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_potential\nHP_BG_000_25

%op2 =  rdcelpa('07_backgate_sp\nHP_BG_000_25\nHP_BG_000_25_op81_dd_inqu.elpa','*',[],op2);	% 0.0
op2 =  rdcelpa('10_pot\nHP_BG_000_25_dv\nHP_BG_000_25_dv_op51_dd_inqu.elpa','*',[],op2);	% 0.0
x_min = find(op2(1).x == 6.100000000000000e-08, 1);
x_max = find(op2(1).x == 7.200000000000000E-08, 1);
x_mean = (x_max + x_min)/2;
%vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
psi_zero = op2(1).psi_semi(x_mean);
op2 =[];

for k = 1:51
  % Create a text file name, and read the file.
  textFileName = ['10_pot\nHP_BG_000_25_dv\nHP_BG_000_25_dv_op' num2str(k) '_dd_psi.elpa'];
  textFileName2 = ['10_pot\nHP_BG_000_25_dv\nHP_BG_000_25_dv_op' num2str(k) '_dd_inqu.elpa'];
  %nHP_BG_000_25_op1_dd_inqu
  if exist(textFileName, 'file')
    op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V

    %------------------------------------------------------------------------------------ gerar matriz

    op2(1).x = op2(1).x * 1e9;
    op2(1).y = op2(1).y * 1e9;
    op2(1).z = op2(1).z * 1e9;

    z_min = find(op2(1).z == 50, 1);
    z_max = find(op2(1).z == 50, 1, 'last');

    %pegar vetores de x, y e psi
    vectorX= unique(op2(1).x);
    vectorY= unique(op2(1).y);
    vectorPSI = op2(1).psi(z_min:z_max)';

    %x_min = find(vectorX == 10, 1);
    %x_max = find(vectorX == 119, 1, 'last');
    x_min = find(vectorX >= 61, 1);
    x_max = find(vectorX == 72);

    x_mean = (x_max + x_min)/2;

    %psi_s(k) = op2(1).psi_semi(x_mean); %Electrostatic potential in the channel [V]
    %psi_s(k) = op2(1).psi_semi(x_mean) - op2(1).psi_semi(1); %Electrostatic potential in the channel [V]

    y_min = find(vectorY == 26, 1);

    %tamanho do vetor de x e y
    x_tam = length(vectorX); %540;
    y_tam = length(vectorY); %51;

    matrixPSI = [];
    for j = 1:y_tam
      row = vectorPSI((j-1)*(x_tam) + 1 : j*x_tam);	%ler uma linha
      %usa uma matriz A temporária
      A = vertcat(matrixPSI,row);
      matrixPSI = A;
      row = [];
    end
    clear A
    %------------------------------------------------------------------------------------ gerar matriz

    %matrix(a,b) a->y, b->x
    %cnt = matrixPSI(y_min,x_min:x_max);
    cnt = matrixPSI(y_min,:)'; %valor de psi em x(10,119) e y(26)
    op2psi(k) = cnt(x_mean);  %op2(1).psi_semi(x_mean) - psi_zero; %Electrostatic potential in the channel [V]

    [A,a,fl] = readELPA(textFileName2); %0.0V
    [V_g, V_s, V_d]=minhafuncao2(fl);
    %x = 1e9*A(:,strcmp(a,'x'));  % position [nm]

    op2Vg(k) = V_g;
    %op2x(k) = x;
    %op2psi(k) = cnt;

    op2 = [];
  else
    fprintf('File %s does not exist.\n', textFileName);
  end
end

%------------------------------------------------------------------------------------ gerar matriz
%C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25
for k = 1:51%31:81
  % Create a text file name, and read the file.
  textFileName = ['10_pot\nHP_BG_000_25_dv\nHP_BG_000_25_dv_op' num2str(k) '_dd_inqu.elpa'];
  %nHP_BG_000_25_op1_dd_inqu
  if exist(textFileName, 'file')
     %op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V

     [A,a,fl] = readELPA(textFileName); %0.0V
     [V_g, V_s, V_d]=minhafuncao2(fl);

     op1 = rdcelpa(textFileName, '*',[],op1);
     op1Vg(k) = V_g;
     op1psi(k) = op1(1).psi_semi(x_mean);
     op1 = [];
  else
    fprintf('File %s does not exist.\n', textFileName);
  end
end



figure
h(1) = plot(op1Vg,op1psi);
xlabel('V_g (V)')
ylabel('\Psi_{channel} (V)')
xlim([0 0.5])
hold
h(2) = plot(op2Vg,op2psi);

%acrescentar legenda
