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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_01
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_02
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_03
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\11_eox\nHP_eox_04

%%
%%%Read data and store it in a struct

%aux = 3
%%%%%%%%%
fig = 0;

  %nHP_eox_op1_dd_psi
  %if exist(textFileName, 'file')
	


for k = 1:4
op1 = [];
op2 = [];
name_inqu = ['nHP_eox_0' num2str(k) '/nHP_eox_0' num2str(k) '_op1_dd_inqu.elpa']; %('nHP_eox_01/nHP_eox_01_op1_dd_inqu.elpa','*',[],op1);
name_psi = ['nHP_eox_0' num2str(k) '/nHP_eox_0' num2str(k) '_op1_dd_psi.elpa']; % ('nHP_eox_01/nHP_eox_01_op1_dd_psi.elpa','*',[],op2)

name_inqu
name_psi
%pegar psi do elpa
%op1 =  rdcelpa('07_backgate_sp/nHP_BG_000_25_dd_iv.elpa','*',[],op1);
%op1 =  rdcelpa('07_backgate_sp/nLP_BG_000_25_dd_iv.elpa','*',[],op1);

%op1 =  rdcelpa('nHP_eox_01/nHP_eox_01_op1_dd_inqu.elpa','*',[],op1);
op1 =  rdcelpa(name_inqu,'*',[],op1);

if fig == 1
figure
h(1) = plot(op1(1).x,op1(1).psi_semi);
xlabel('x (nm)')
ylabel('\Psi_{semi}')
end

%mod_name='cnt' shape='rect' 	 low_xyz= 10e-9  26e-9	50e-9 	upp_xyz= 119e-9  26e-9 50e-9 /
%op2 =  rdcelpa('nHP_eox_01/nHP_eox_01_op1_dd_psi.elpa','*',[],op2); %0V
op2 =  rdcelpa(name_psi,'*',[],op2); %0V

		op2(1).x = op2(1).x * 1e9;
		op2(1).y = op2(1).y * 1e9;
		op2(1).z = op2(1).z * 1e9;

		z_min = find(op2(1).z == 50, 1);
		z_max = find(op2(1).z == 50, 1, 'last');

		%pegar vetores de x, y e psi
		vectorX= unique(op2(1).x);
		vectorY= unique(op2(1).y);
		vectorPSI = op2(1).psi(z_min:z_max)';

		x_min = find(vectorX == 10, 1);
		x_max = find(vectorX == 119, 1, 'last');

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

		%matrix(a,b) a->y, b->x
		%cnt = matrixPSI(y_min,x_min:x_max);
		cnt = matrixPSI(y_min,:)';

		if fig == 1
		figure
		h(1) = plot(vectorX,cnt);
		xlabel('x (nm)')
		ylabel('\Psi_{channel} (V)')
		end

figure
h(1) = plot(op1(1).x* 1e9,op1(1).psi_semi);
hold
h(2) = plot(vectorX,cnt, '--');
xlabel('x (nm)')
ylabel('\Psi (V)')

legend({'psi_{semi}', 'psi_{2D}'});
end

%%
%%%Visualize data stored in a struct
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

