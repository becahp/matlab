% calculo de resistencia para vsup
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


	
%antigo
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\3G

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\04_meff_output\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\04_meff_output\FBG
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\04_meff_output\2G



%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V


	

pule = 0;
if pule == 1
for aux = 1:4

op2 = [];
if aux == 1
op2 = rdcelpa('1G/n_1g_meff_004_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_01_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_02_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_03_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_04_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_05_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_06_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_07_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_08_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_09_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 = rdcelpa('FBG/n_fbg_meff_004_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_01_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_02_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_03_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_04_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_05_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_06_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_07_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_08_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_09_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);
end

if aux ==  3   
op2 = rdcelpa('2G/n_2g_meff_004_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_01_vsup_ron_dd_iv.elpa','*',[],op2); 
op2 = rdcelpa('2G/n_2g_meff_02_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_03_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_04_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_05_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_06_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_07_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_08_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_09_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);
end

if aux == 4
op2 = rdcelpa('3G/n_3g_meff_004_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_01_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_02_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_03_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_04_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_05_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_06_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_07_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_08_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_09_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);
end


plotar = 0;

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on
xlabel('V_{ds} (V)')
ylabel('I_{ds} (A)')
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

h(1).Color  = 'r';
h(2).Color  = [1    0.6  0 ]; %orange
h(3).Color  = 'y';
h(4).Color  = 'g';
h(5).Color  = 'c';
h(6).Color  = 'b';
h(7).Color  = [0.5  0    0.9 ]; %purple
h(8).Color  = 'm';
h(9).Color  = 'k'; %'g';
h(10).Color = map(2,:);
h(11).Color = map(4,:);


								%[x_begin y_begin dx dy].
annotation('arrow', 'Position', [0.6 0.8 0.1 -0.3]);

annotation('textbox','String','m_{eff}',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.55 0.82 0.065 0.066],...
    'FitBoxToText','on');
if plotar == 1
if aux == 1
print('meff_1G_vsup', '-depsc');
elseif aux == 2
print('meff_FBG_vsup', '-depsc');
elseif aux == 3
print('meff_2G_vsup', '-depsc');
else 
print('meff_3G_vsup', '-depsc');
end

end %plotar


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_on
% for i=1:length(op2)
% res(aux, i) = calc_res2(i, op2);
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_out
for i=1:length(op2)
res_out(aux, i) = calc_res3(i, op2, aux);
finita(aux, i) = calc_finita(i, op2, aux);
end


%%%% teste
% i = 5
% indice_out = find(op2(i).V_d>=0.9 & op2(i).V_d<=1.1);
% p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);
% r_out = 1/p_out(1);


end %for

end %if pule

