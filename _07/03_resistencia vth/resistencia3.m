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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\3G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\FBG
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\re

%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

pule = 0;

if pule == 1

for aux = 1:4

op2 = [];
if aux == 1
op2 = rdcelpa('re/n_1g_meff_004_dd_iv.elpa','*',[],op2); %
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
op2 = rdcelpa('re/n_fbg_meff_004_dd_iv.elpa','*',[],op2); %
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
end

if aux == 3
op2 = rdcelpa('re/n_2g_meff_004_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('re/n_2g_meff_01_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('2G/n_2g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_04_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('2G/n_2g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 4
op2 = rdcelpa('3G/n_3g_meff_004_dd_iv.elpa','*',[],op2); 
op2 = rdcelpa('re/n_3g_meff_01_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('3G/n_3g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_10_dd_iv.elpa','*',[],op2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_on
for i=1:length(op2)
%res(i) = calc_res(i, op2);
%[res(1,i),res(2,i)] = calc_res(i, op2);

res(aux, i) = calc_res2(i, op2);
end %i=1:length(op2) 

end %for aux = 1:4

end %if pule


meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% primeiros valores errados
% aux_res_1 = [NaN	1584843.12832697	1736122.29696076	1966644.99724292	2318828.17105639	2809504.71234816	3443772.25656512	4228225.30683158	5173931.09085599	6294505.20318453	7604708.52863841];
% aux_res_2 = [NaN	1560809.57716017	1612544.61798117	1856619.81207543	2237021.72328399	2747405.60423333	3393386.64575797	4185337.83767121	5136036.72868284	6259600.42199283	7570899.12522633];
% aux_res_3 = [83410.0091646755	NaN	385228.272816330	699466.403557929	NaN	1662705.96539677	2362351.75554844	3230937.01762964	4287028.51323948	5547307.69954435	7028932.83299090];
% aux_res_4 = [219179.030145731	292761.159232826	1770304.17390555	4095335.52796050	7842530.73029583	13338919.1314967	20904239.0391289	30838394.5177666	43409077.4756486	58844552.1172962	77326702.0184879];

aux_res_1 = [1416423.98042636	1584843.12832697	1736122.29696076	1966644.99724292	2318828.17105639	2809504.71234816	3443772.25656512	4228225.30683158	5173931.09085599	6294505.20318453	7604708.52863841];
aux_res_2 = [1644874.50585947	1560809.57716017	1612544.61798117	1856619.81207543	2237021.72328399	2747405.60423333	3393386.64575797	4185337.83767121	5136036.72868284	6259600.42199283	7570899.12522633];
aux_res_3 = [142781.174499161	199629.673301637	385228.272816330	699466.403557929	1128382.57637664	1662705.96539677	2362351.75554844	3230937.01762964	4287028.51323948	5547307.69954435	7028932.83299090];
aux_res_4 = [219179.030145731	544902.424159322	1770304.17390555	4095335.52796050	7842530.73029583	13338919.1314967	20904239.0391289	30838394.5177666	43409077.4756486	58844552.1172962	77326702.0184879];

%% 
%aux_res_1 = aux_res_1 * 1e-3;
%aux_res_2 = aux_res_2 * 1e-3;
%aux_res_3 = aux_res_3 * 1e-3;
%aux_res_4 = aux_res_4 * 1e-3;


figure
semilogy(meff, aux_res_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, aux_res_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('R_{on} (\Omega)');

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');
legend('boxoff');

cg_1g = 1.55E-17;
cg_fbg = 1.63E-17;
cg_2g = 1.63E-17;
cg_3g = 2.68E-18;

aux_res_1 = aux_res_1 * cg_1g;
aux_res_2 = aux_res_2 * cg_fbg;
aux_res_3 = aux_res_3 * cg_2g;
aux_res_4 = aux_res_4 * cg_3g;


figure
semilogy(meff, aux_res_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, aux_res_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_4,'Color',map(4,:),'Marker', '*');

xlabel('Effective mass');
ylabel('R_{on} x C_G');

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');
legend('boxoff');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indice = struct('a',{},'b',{},'c',{});
% res = struct('a',{},'b',{},'c',{},'media',{});

% indice(1).a = find(op2.D>0.0 & op2.D<0.2);
% indice(1).b = find(op2.D>0.2 & op2.D<0.4);
% indice(1).c = find(op2.D>0.4 & op2.D<0.6);

% %p(1) slope; p(2) constant
% p(1,:) = polyfit(op2.D(indice(1).a),op2.Isum(indice(1).a), 1);
% p(2,:) = polyfit(op2.D(indice(1).b),op2.Isum(indice(1).b), 1);
% p(3,:) = polyfit(op2.D(indice(1).c),op2.Isum(indice(1).c), 1);

% %res(1) = 1/p(1);
% res(1).a = 1/p(1,1);
% res(1).b = 1/p(2,1);
% res(1).c = 1/p(3,1);

% res(1).media = (res(1).a + res(1).b + res(1).c) / segmentos;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%indice(1,:) = find(op2.D>0.0 & op2.D<0.2);
%indice(2,:) = find(op2.D>0.2 & op2.D<0.4);
%indice(3,:) = find(op2.D>0.4 & op2.D<0.6);

%p(1) slope; p(2) constant
%p = polyfit(op2.D(indice),op2.Isum(indice), 1);
%res(1) = 1/p(1);

%for i=1:3
%p = polyfit(op2.D(indice(i)),op2.Isum(indice(i)), 1);
%end
%
%fit = polyval(p, op2.D(indice));
%x = op2.D(indice)
%y = op2.Isum(indice)
%
%figure
%h(1) = plot(op2(1).D,op2(1).Isum ); hold on
%plot(x,y, 'r');
%x = x - 0.05;
%%plot(x,fit,'k--');
