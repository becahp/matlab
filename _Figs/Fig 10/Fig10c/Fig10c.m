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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\07_meff_ron\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\07_meff_ron\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\07_meff_ron\FBG
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\07_meff_ron\3G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\07_meff_ron\re


%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\3G
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\re


%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

pule = 1;

if pule == 1

for aux = 1:4

op2 = [];
if aux == 1
op2 = rdcelpa('save_elpa/n_1g_meff_004_dd_iv.elpa','*',[],op2); % 1
op2 = rdcelpa('1G/n_1g_meff_01_dd_iv.elpa','*',[],op2);	 % 2
op2 = rdcelpa('1G/n_1g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_10_dd_iv.elpa','*',[],op2);

op2(8).I_d = smooth(op2(8).I_d);
end

if aux == 2
op2 = rdcelpa('FBG/n_fbg_meff_004_dd_iv.elpa','*',[],op2); % 1
op2 = rdcelpa('FBG/n_fbg_meff_01_dd_iv.elpa','*',[],op2);  % 2
op2 = rdcelpa('FBG/n_fbg_meff_02_dd_iv.elpa','*',[],op2);  % 
op2 = rdcelpa('FBG/n_fbg_meff_03_dd_iv.elpa','*',[],op2);  % %% usar no calculo seg 3 de 0.4 a 0.5
op2 = rdcelpa('FBG/n_fbg_meff_04_dd_iv.elpa','*',[],op2);  %  
op2 = rdcelpa('FBG/n_fbg_meff_05_dd_iv.elpa','*',[],op2);  % 
op2 = rdcelpa('FBG/n_fbg_meff_06_dd_iv.elpa','*',[],op2);  % 
op2 = rdcelpa('FBG/n_fbg_meff_07_dd_iv.elpa','*',[],op2);  % 
op2 = rdcelpa('FBG/n_fbg_meff_08_dd_iv.elpa','*',[],op2);  % 9
op2 = rdcelpa('FBG/n_fbg_meff_09_dd_iv.elpa','*',[],op2);  % 
op2 = rdcelpa('FBG/n_fbg_meff_10_dd_iv.elpa','*',[],op2);  % 
end

if aux == 3
op2 = rdcelpa('save_elpa/n_2g_meff_004_dd_iv.elpa','*',[],op2); % 1
op2 = rdcelpa('2G/n_2g_meff_01_dd_iv.elpa','*',[],op2);  % 2
op2 = rdcelpa('2G/n_2g_meff_02_dd_iv.elpa','*',[],op2);	 % 3
op2 = rdcelpa('2G/n_2g_meff_03_dd_iv.elpa','*',[],op2);  % 4
op2 = rdcelpa('2G/n_2g_meff_04_dd_iv.elpa','*',[],op2);  % 5 smooth 
op2 = rdcelpa('2G/n_2g_meff_05_dd_iv.elpa','*',[],op2);  % 6
op2 = rdcelpa('2G/n_2g_meff_06_dd_iv.elpa','*',[],op2);  % 7 tá ok
op2 = rdcelpa('2G/n_2g_meff_07_dd_iv.elpa','*',[],op2);  % 8
op2 = rdcelpa('2G/n_2g_meff_08_dd_iv.elpa','*',[],op2);  % 9
op2 = rdcelpa('2G/n_2g_meff_09_dd_iv.elpa','*',[],op2);  % 10 tá ok
op2 = rdcelpa('2G/n_2g_meff_10_dd_iv.elpa','*',[],op2);  % 11 tá ok

op2(5).I_d = smooth(op2(5).I_d);

end

if aux == 4
op2 = rdcelpa('3G/n_3g_meff_004_dd_iv.elpa','*',[],op2); 
op2 = rdcelpa('3G/n_3g_meff_01_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('3G/n_3g_meff_02_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('save_elpa/n_3g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_04_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('3G/n_3g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_10_dd_iv.elpa','*',[],op2);
end

%for i=1:length(op2)
%op2(i).I_d = smooth(op2(i).I_d);
%end %i=1:length(op2) 


figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on
axis([0 0.6 0 8e-6])
%xlim([0 0.6])
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_on

if  (aux == 1) || (aux == 2) %1G FBG : usar inverso da soma de 3segs
	for i=1:length(op2)
	%res(i) = calc_res(i, op2);
	%[res(1,i),res(2,i)] = calc_res(i, op2);

	res(aux, i) = calc_res4(i, op2);
	end %i=1:length(op2) 

else						%2G 3G : usar inverso de 1 segmento
	for i=1:length(op2)

	indice = find(op2(i).V_d>0.0 & op2(i).V_d<0.2);
	p = polyfit(op2(i).V_d(indice),op2(i).I_d(indice), 1);
	
	res(aux, i) = 1/p(1);
	end %i=1:length(op2) 

end

end %for aux = 1:4

end %if pule


if pule == 0

meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% primeiros valores errados
%aux_res_1 = [1416423.98042636	1584843.12832697	1736122.29696076	1966644.99724292	2318828.17105639	2809504.71234816	3443772.25656512	4228225.30683158	5173931.09085599	6294505.20318453	7604708.52863841];
%aux_res_2 = [1644874.50585947	1560809.57716017	1612544.61798117	1856619.81207543	2237021.72328399	2747405.60423333	3393386.64575797	4185337.83767121	5136036.72868284	6259600.42199283	7570899.12522633];
%aux_res_3 = [142781.174499161	199629.673301637	385228.272816330	699466.403557929	1128382.57637664	1662705.96539677	2362351.75554844	3230937.01762964	4287028.51323948	5547307.69954435	7028932.83299090];
%aux_res_4 = [219179.030145731	544902.424159322	1770304.17390555	4095335.52796050	7842530.73029583	13338919.1314967	20904239.0391289	30838394.5177666	43409077.4756486	58844552.1172962	77326702.0184879];

aux_res_1 = [213152.4574	299327.3612	494539.0231	779410.2033	1099272.599	1713279.546	2388032.049	3106160.427	4217383.512	5261909.557	6997589.738 ];
aux_res_2 = [143887.4873	213921.7757	421229.6598	680260	1141744.266	1684452.526	2368996.639	3202390.116	4388864.879	5400700.958	6774651.649 ];
aux_res_3 = [79859.45469	163288.8745	370444.0478	636178.4011	957707.2897	1383080.734	1858733.578	2483321.577	3160796.702	3985946.405	4942799.414 ];
aux_res_4 = [186560.1498	423943.5362	1158864.56	2352486.125	4127181.608	6702238.459	10101342.33	14439426.26	19768470.97	26105562.67	33434844.61 ];


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
ylim([5e4 4e7])

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');
legend('boxoff');

%print('00_Ron', '-depsc');

end
