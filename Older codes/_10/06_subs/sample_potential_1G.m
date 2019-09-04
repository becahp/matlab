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
    0.75, 0, 0.75];

	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\12_substrato\02_psi_1G


%%
%%%Read data and store it in a struct
%op2 = [];		

%aux = 2
%%%%%%%%%
 
for aux=1:4 
op2 = [];		
if aux == 1
op2 =  rdcelpa('n_1g_10_op1_dd_psi.elpa','*',[],op2); %0V
end

if aux == 2
op2 =  rdcelpa('n_1g_20_op1_dd_psi.elpa','*',[],op2); %2V
end

if aux == 3
op2 =  rdcelpa('n_sub_1g_10_op1_dd_psi.elpa','*',[],op2); %-1V
end

if aux == 4
op2 =  rdcelpa('n_sub_1g_20_op1_dd_psi.elpa','*',[],op2); %-1V
end

%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');

%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.Isum, op1.G);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


%op2(1).I_s = abs(op2(1).I_s);
%op2(2).I_s = abs(op2(2).I_s);

op2(1).x = op2(1).x * 1e9;
op2(1).y = op2(1).y * 1e9;
op2(1).z = op2(1).z * 1e9;

%-------------------------------------------------------------------------------------------------------------------------------------
% pegar potenciais onde z = 0
z_min = find(op2(1).z == 0, 1);
z_max = find(op2(1).z == 0, 1, 'last');

%pegar vetores de x, y e psi
vectorX= unique(op2(1).x);
vectorY= unique(op2(1).y);
vectorPSI = op2(1).psi(z_min:z_max)';

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

figure
contourf(vectorX, vectorY, matrixPSI, 10);
xlabel('x (nm)')
ylabel('y (nm)')
title('\psi(x,y)')
%ylabel('\psi (V)')
%axis([-1e-8 5.1e-7 0 1.5e-7])
%axis([0 94 0 66])


%max(max(matrixPSI,[],2))
%min(min(matrixPSI,[],2))

%colorbar
h = colorbar;
set(h, 'ylim', [-1 2])
caxis([-0.99 1.99])

if (aux == 1) || (aux == 2)
%print rectangles and lines
%source
rectangle('Position',[-10 0 10 30],'EdgeColor','w', 'LineWidth',3)
%drain
rectangle('Position',[500 0 10 50],'EdgeColor','w', 'LineWidth',3)

%GS
rectangle('Position',[8 8 192 42],'EdgeColor','w', 'LineWidth',3)
%G
%rectangle('Position',[200 108 92 42],'EdgeColor','w', 'LineWidth',3)
%GD
%rectangle('Position',[400 108 92 42],'EdgeColor','w', 'LineWidth',3)

%cnt
line([0,500],[0,0],'Color','white','LineStyle','--')
end

if (aux == 3) || (aux == 4)
%print rectangles and lines
%source
rectangle('Position',[-10 100 10 30],'EdgeColor','w', 'LineWidth',3)
%drain
rectangle('Position',[500 100 10 50],'EdgeColor','w', 'LineWidth',3)

%GS
rectangle('Position',[8 108 192 42],'EdgeColor','w', 'LineWidth',3)
%G
%rectangle('Position',[200 108 92 42],'EdgeColor','w', 'LineWidth',3)
%GD
%rectangle('Position',[400 108 92 42],'EdgeColor','w', 'LineWidth',3)

%cnt
line([0,500],[100,100],'Color','white','LineStyle','--')
end

str = ['1G_pot' int2str(aux)];
print(str, '-depsc');
end %for aux = 1:4