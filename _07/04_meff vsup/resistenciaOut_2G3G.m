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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\3G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\FBG
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\re
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\output\re\teste

%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

pule = 1;

if pule == 1
for aux = 3:4

op2 = [];

if aux ==  3   
op2 = rdcelpa('re/n_2g_meff_004_v2_dd_iv.elpa','*',[],op2); %nao convergiram
op2 = rdcelpa('re/n_2g_meff_01_v2_dd_iv.elpa','*',[],op2);  %nao convergiram
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

pule = 1;

if pule == 1
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
end

plotar = 0;
if plotar == 1
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
annotation('arrow', 'Position', [0.7 0.8 0.1 -0.3]);

annotation('textbox','String','m_{eff}',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.65 0.82 0.065 0.066],...
    'FitBoxToText','on');

if aux == 1
print('meff_1G_vsup', '-depsc');
elseif aux == 2
print('meff_FBG_vsup', '-depsc');
elseif aux == 3
print('meff_2G_vsup', '-depsc');
else 
print('meff_3G_vsup', '-depsc');
end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_out
for i=1:length(op2)

%if (aux == 3 && i >= 8)
%op2(i).I_d = smooth(op2(i).I_d);
%end

res_out(aux, i) = calc_res4(i, op2,aux);
%res_out(aux, i) = calc_res3(i, op2,aux);
end

% if (aux == 4) %3G
	% for i=1:length(op2)
	% % res_out(aux, i) = calc_res4(i, op2);
	
	% indice_out = find(op2(i).V_d>=0.5 & op2(i).V_d<=0.7); %para 3g
	
	% a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
	% b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));

	% res_out(aux,i) = b/a;

	% end
% end

% if (aux == 3) || (aux == 4	) %2G
	% for i=1:length(op2)
	% res_out(aux, i) = calc_res4(i, op2);
	% end
% end


%%%% teste
% i = 5
% indice_out = find(op2(i).V_d>=0.9 & op2(i).V_d<=1.1);
% p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);
% r_out = 1/p_out(1);



end %for

end %if pule

if pule == 2
meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

aux_res_out_1 = [711539.451284156	2711525.47721837	31165959.3163325	41116334.6952039	486205490.001001	949466960.747351	1358261344.78783	1620948647.49778	1766019715.00355	1842498405.75374	1883142945.84270];
aux_res_out_2 = [1068134.27854138	7591745.59029720	73190030.8905381	46968207.2283623	702640929.995299	1268667292.51492	1794585237.75119	2159944162.46608	2370442447.71617	2479116595.16329	2531143485.15237];
aux_res_out_3 = [2456863.66020084	31657096.5952843	864328026.258473	132667958.454827	41625781617.4587	575339741102.249	205878956841.915	-27765112885.6596	-397125158787.186	-17882578982.2700	36410099739.0084];
aux_res_out_4 = [93306809.2387210	386606475.282610	1216199934.97971	3033705744.21654	2630230118.36391	3338536522.14199	3874914859.50974	4359655283.56973	4798698303.02947	5198197729.36987	5560455167.73925];

%2G: v1
%2450412.86025737	30545589.6660950

%2G só refeitas
%2456863.66020084	31657096.5952843

if pule == 2
%para VGS max
aux_res_out_1 = [1807738.54735352	347614517.144027	19382076139.5213	611223933.008614	35014765087.6027	38745606316.3464	41758908584.9838	44375315558.9000	46737115106.0633	48916268712.4958	50953735163.2687];
aux_res_out_2 = [231942442.809668	9443480127.74970	160195951569.779	2220416727.85155	999714080988.291	1264524645317.29	1426745193643.30	1538671033352.32	1625034896473.08	1697158666684.88	1760455055264.39];
aux_res_out_3 = [113735244.740864	847261750.575827	1517723169.49946	-69810878832.2869	1727278852.98986	1935681340.60783	1785575767.17052	1720336258.65918	1697105621.13164	1681466052.42625	1670234566.36236];
aux_res_out_4 = [139385.713063130	468661.194271367	2166349.41678682	1052430193.21759	12549737.6118792	22602398.8471154	36466026.9156837	54263044.9777850	75903283.3916860	101142377.338468	129637734.070815];
end

%% 
%aux_res_out_1 = aux_res_out_1 * 1e-3;
%aux_res_out_2 = aux_res_out_2 * 1e-3;
%aux_res_out_3 = aux_res_out_3 * 1e-3;
%aux_res_out_4 = aux_res_out_4 * 1e-3;


figure
semilogy(meff, aux_res_out_1,'Color',map(1,:), 'Marker', '*');
axis([0 1 1e5 1e14]);
hold
semilogy(meff, aux_res_out_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_out_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_out_4,'Color',map(4,:),'Marker', '*');

xlabel('Effective mass');
ylabel('R_{0} (\Omega)');

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');

end