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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\02_ron\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\02_ron\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\02_ron\FBG

%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V
aux = 3;

op2 = [];

if aux == 1
op2 = rdcelpa('1G/n_1g_meff_004_dd_iv.elpa','*',[],op2);	%
op2 = rdcelpa('1G/n_1g_meff_01_dd_iv.elpa','*',[],op2);	
op2 = rdcelpa('1G/n_1g_meff_02_dd_iv.elpa','*',[],op2);	
op2 = rdcelpa('1G/n_1g_meff_03_dd_iv.elpa','*',[],op2);	
op2 = rdcelpa('1G/n_1g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 = rdcelpa('FBG/n_fbg_meff_004_dd_iv.elpa','*',[],op2);	%
op2 = rdcelpa('FBG/n_fbg_meff_01_dd_iv.elpa','*',[],op2);	
op2 = rdcelpa('FBG/n_fbg_meff_02_dd_iv.elpa','*',[],op2);	
op2 = rdcelpa('FBG/n_fbg_meff_03_dd_iv.elpa','*',[],op2);	
op2 = rdcelpa('FBG/n_fbg_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_06_dd_iv.elpa','*',[],op2); 	
op2 = rdcelpa('FBG/n_fbg_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_10_dd_iv.elpa','*',[],op2);

%op2(7).I_d = smooth(op2(7).I_d)
end

if aux == 3
op2 = rdcelpa('2G/n_2g_meff_004_dd_iv.elpa','*',[],op2);	%
op2 = rdcelpa('2G/n_2g_meff_01_dd_iv.elpa','*',[],op2);		%
op2 = rdcelpa('2G/n_2g_meff_02_dd_iv.elpa','*',[],op2);		
op2 = rdcelpa('2G/n_2g_meff_03_dd_iv.elpa','*',[],op2);		
op2 = rdcelpa('2G/n_2g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_10_dd_iv.elpa','*',[],op2);	
end



%op2(1).I_d = abs(op2(1).I_d);
%op2(2).I_d = abs(op2(2).I_d);
%op2(3).I_d = abs(op2(3).I_d);
%op2(4).I_d = abs(op2(4).I_d);
%op2(5).I_d = abs(op2(5).I_d);
%op2(6).I_d = abs(op2(6).I_d);
%op2(7).I_d = abs(op2(7).I_d);
%op2(8).I_d = abs(op2(8).I_d);
%op2(9).I_d = abs(op2(9).I_d);
%op2(10).I_d = abs(op2(10).I_d);
%op2(11).I_d = abs(op2(11).I_d);


plotar = 1;

if plotar == 1
figure
%h(1) = plot(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on
xlabel('V_{ds} (V)')
ylabel('I_{d} (A)')
grid on
h(2) = plot(op2(2).V_d,op2(2).I_d );
h(3) = plot(op2(3).V_d,op2(3).I_d );
h(4) = plot(op2(4).V_d,op2(4).I_d );
h(5) = plot(op2(5).V_d,op2(5).I_d );      
h(6) = plot(op2(6).V_d,op2(6).I_d );      
h(7) = plot(op2(7).V_d,op2(7).I_d );      
h(8) = plot(op2(8).V_d,op2(8).I_d );
h(9) = plot(op2(9).V_d,op2(9).I_d );
h(10) = plot(op2(10).V_d,op2(10).I_d );
h(11) = plot(op2(11).V_d,op2(11).I_d );
end %plotar figuras

if plotar == 0
figure
%h(3) = plot(op2(3).V_d,op2(3).I_d );
h(5) = plot(op2(5).V_d,op2(5).I_d );      

hold on
xlabel('V_{ds} (V)')
ylabel('I_{d} (A)')
grid on
%h(4) = plot(op2(4).V_d,op2(4).I_d );
%h(5) = plot(op2(5).V_d,op2(5).I_d );      
h(6) = plot(op2(6).V_d,op2(6).I_d );      
h(7) = plot(op2(7).V_d,op2(7).I_d );      
h(8) = plot(op2(8).V_d,op2(8).I_d );
h(9) = plot(op2(9).V_d,op2(9).I_d );
h(10) = plot(op2(10).V_d,op2(10).I_d );
h(11) = plot(op2(11).V_d,op2(11).I_d );
end