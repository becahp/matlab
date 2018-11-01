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
op2 = [];
aux = 1;
%%%%%%%%%

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25
if aux == 1
op2 =  rdcelpa('nHP_BG_000_25_op1_dd_inqu.elpa','*',[],op2);	%1 V

end

if aux == 2
%op2 =  rdcelpa('nHP_BG_000_25_op61_dd_inqu.elpa','*',[],op2);	% 0.2
op2 =  rdcelpa('nHP_BG_000_25_op81_dd_inqu.elpa','*',[],op2);	% 0.0

end


%-------------------------------------------------------------------------------------------------------------------------------------
% pegar potencial do canal embaixo da porta (de 57nm até 79nm)
x_min = find(op2(1).x == 6.100000000000000e-08, 1);
x_max = find(op2(1).x == 7.200000000000000E-08, 1);

%pegar psi
vectorPSI = op2(1).psi_semi(x_min:x_max)'; %Electrostatic potential in the channel
vectorQs = op2(1).space_charge(x_min:x_max)'; %Space charge (cargas no canal)

x_mean = (x_max + x_min)/2
x_eff =  op2(1).x(x_max) - op2(1).x(x_min)
Qs_mean = op2(1).space_charge(x_mean)

Qs_eff = -op2(1).space_charge(x_mean) / x_eff;

%-------------------------------------------------------------------------------------------------------------------------------------
pule = 1
if pule == 1
op2(1).x = op2(1).x * 10^9;
%op2(1).space_charge = abs(op2(1).space_charge);
%op2(1).space_charge = abs(op2(1).psi_semi);

figure
h(1) = plot(op2(1).x,op2(1).space_charge);
xlabel('x (nm)')
ylabel('Space charge')

%print('BG_ox_sp_25_space_charge', '-depsc')

figure
h(1) = plot(op2(1).x,op2(1).psi_semi);
xlabel('x (nm)')
ylabel('\Psi_{semi}')

%print('BG_ox_sp_25_psi_semi', '-depsc')

end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Landau-Khalatnikov equation is solved to determine the electric field across
% the ferroelectric gate insulator corresponding to the charge density generated
% in the substrate
%
% The charge density is non-uniform across the substrate and it is therefore
% integrated across the substrate and divided by gate length for averaging
%
%Vg is determined by Ψs and voltage across the gate insulator (Vox)
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
