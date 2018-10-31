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


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer_n\nHP_sp_40

%+ em inqu.elpa: d_n, d_p versus x
%+ plotar para nHP: 0V, 0.5V, 1.0V

%%
%%%Read data and store it in a struct
op2 = [];	
aux = 1
%%%%%%%%%

if aux == 1
op2 =  rdcelpa('nHP_sp_40_op1_dd_inqu.elpa','*',[],op2);	%1 V
end

if aux == 2
op2 =  rdcelpa('nHP_sp_40_op51_dd_inqu.elpa','*',[],op2);	%0.5 V
end

if aux == 3
op2 =  rdcelpa('nHP_sp_40_op101_dd_inqu.elpa','*',[],op2);	%0.0 V
end



%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).x = op2(1).x * 10^9;
op2(1).d_n = abs(op2(1).d_n);
op2(1).d_p = abs(op2(1).d_p);

figure
h(1) = semilogy(op2(1).x,op2(1).d_n );
hold
h(2) = semilogy(op2(1).x,op2(1).d_p );

xlabel('x (nm)')
ylabel('Charge density (1/m)')
axis([0 129 01e-3 1e10])


legend({'electron','holes'},'Location', 'best'); 
legend('boxoff')