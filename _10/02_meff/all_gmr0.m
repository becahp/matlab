% vsup
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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\transfer\3G
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\09_meffvarias\transfer\re

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\00_trans\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\00_trans\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\00_trans\FBG

%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

pule = 1;

if pule == 1
for aux = 1:4
%aux = 3
op2 = [];
if aux == 1
op2 = rdcelpa('1G/n_1g_vsup_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_vsup_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 = rdcelpa('FBG/n_fbg_vsup_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_vsup_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 3
op2 = rdcelpa('2G/n_2g_vsup_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_vsup_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 4
op2 = rdcelpa('3G/n_3g_vsup_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_vsup_meff_10_dd_iv.elpa','*',[],op2);
end


op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);
op2(9).I_s = abs(op2(9).I_s);
op2(10).I_s = abs(op2(10).I_s);
op2(11).I_s = abs(op2(11).I_s);


plotar = 0;

if plotar == 1
figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op2(1).V_g,op2(1).I_s );
hold on
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
grid on
h(2) = semilogy(op2(2).V_g,op2(2).I_s );
h(3) = semilogy(op2(3).V_g,op2(3).I_s );
h(4) = semilogy(op2(4).V_g,op2(4).I_s );
h(5) = semilogy(op2(5).V_g,op2(5).I_s );      
h(6) = semilogy(op2(6).V_g,op2(6).I_s );      
h(7) = semilogy(op2(7).V_g,op2(7).I_s );      
h(8) = semilogy(op2(8).V_g,op2(8).I_s );
h(9) = semilogy(op2(9).V_g,op2(9).I_s );
h(10) = semilogy(op2(10).V_g,op2(10).I_s );
h(11) = semilogy(op2(11).V_g,op2(11).I_s );
end %plotar figuras


clear indice;
for i=1:length(op2)
	indice(i) = find(op2(i).V_g>=1.5,1);

	if indice(i) == 1
		op2(i).V_g = wrev(op2(i).V_g);
		op2(i).I_s = wrev(op2(i).I_s);
		
		indice(i) = find(op2(i).V_g>=1.5,1);

	end

	op2(i).V_g = op2(i).V_g(1:indice(i));
	op2(i).I_s = op2(i).I_s(1:indice(i));
end

for i=1:length(op2)
%peak_gm(aux,i) = plot_elpa_gmp(op2(i)); %pega todos os gms
%peak_gm2(aux,i) = plot_elpa_gmp(op2(i)); 	%pega os gm,peak

	if aux == 1
		[gm1G(i).x,gm1G(i).y] = plot_elpa_gm_v30(op2(i));
		gms(aux, i) = gm1G(i).y(find(gm1G(i).x>=0.99 & gm1G(i).x<=1.02)); %encontrar gm em (1,1)
		
		elseif aux == 2
			[gmFBG(i).x,gmFBG(i).y] = plot_elpa_gm_v30(op2(i));
			gms(aux, i) = gmFBG(i).y(find(gmFBG(i).x>=0.99 & gmFBG(i).x<=1.02));
			
		elseif aux == 3
			[gm2G(i).x,gm2G(i).y] = plot_elpa_gm_v30(op2(i));
			%gms(aux, i) = gm2G(i).y(find(gm2G(i).x>=0.99 & gm2G(i).x<=1.04));
			gms(aux, i) = gm2G(i).y(find(gm2G(i).x>=0.99 & gm2G(i).x<=1.04,1));

		else
			[gm3G(i).x,gm3G(i).y] = plot_elpa_gm_v30(op2(i));
			gms(aux, i) = gm3G(i).y(find(gm3G(i).x>=0.6 & gm3G(i).x<=0.64)); %encontrar gm em (0.6,0.6)
	end %if aux

end %for que calcula os peak_gm

end %for

end %if pule




%%%*****************************************************************************Cálculo de gm*r0
gm_1 = [6.97755800173665	3.00882039409240	0.935206175083918	0.414939304702741	0.220470946940662	0.130851913784314	0.0838825080639364	0.0569687679118737	0.0404874533257543	0.0298554429921834	0.0227006288657586  ];
gm_2 = [6.74092589758625	2.98168019349650	0.933265688264160	0.414796840059479	0.220604622126417	0.131048377080424	0.0840653268394031	0.0571825921530818	0.0406991324939502	0.0300628311813551	0.0229027464189006  ];
gm_3 = [7.70538755503538	3.24821786667140	1.01201054760588	0.451652937915167	0.241405579043134	0.144113580510638	0.0928968659752380	0.0621464576314648	0.0453246389621046	0.0336085527531976	0.0257039326910529  ];
gm_4 = [1.99973792349981	0.510268972882700	0.110290062482718	0.0401690656801266	0.0184290680838218	0.00964321593223248	0.00550192702912635	0.00334423481250816	0.00213627921660219	0.00142141772606604	0.000979079780734301];

r0_1 = [239526569.821592	1521389374.65584	4220027477.70946	6273862369.42394	7864582861.32859	9184748652.13925	10323942598.5700	11336758414.6277	12255970913.3209	13102461244.8277	13890321864.5244];
r0_2 = [624989990.589958	9855605526.55836	124498565586.262	376311622120.729	602084717885.986	749955470833.618	851537610181.153	928452663304.426	991624204091.981	1046326542906.22	1095328641585.25];
r0_3 = [749681133.625264	1689236014.82837	2523927147.34764	3506813669.01049	3899916490.47240	4452283791.55205	4830601275.81017	4774270250.90176	4582725199.47722	4431597145.28999	4481851944.92024];
r0_4 = [50396522.0778238	245567733.777176	978383265.617044	1698776225.43519	2239692798.95050	2634734761.40093	2926377732.49901	3143906953.20986	3313150909.88868	3443531013.01399	3545852415.07216];

aux_res_1 = gm_1 .* r0_1;
aux_res_2 = gm_2 .* r0_2;
aux_res_3 = gm_3 .* r0_3;
aux_res_4 = gm_4 .* r0_4;

meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];


figure
semilogy(meff, aux_res_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, aux_res_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('gm r_0');
ylim([5e4 4e7])

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');
legend('boxoff');

%%%*****************************************************************************Figura 1 meff x gm_peak
plotar = 123;

if plotar == 1
meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];


aux_res_out_1 = [6.97755800173665	3.00882039409240	0.935206175083918	0.414939304702741	0.220470946940662	0.130851913784314	0.0838825080639364	0.0569687679118737	0.0404874533257543	0.0298554429921834	0.0227006288657586  ];
aux_res_out_2 = [6.74092589758625	2.98168019349650	0.933265688264160	0.414796840059479	0.220604622126417	0.131048377080424	0.0840653268394031	0.0571825921530818	0.0406991324939502	0.0300628311813551	0.0229027464189006  ];
aux_res_out_3 = [7.70538755503538	3.24821786667140	1.01201054760588	0.451652937915167	0.241405579043134	0.144113580510638	0.0928968659752380	0.0621464576314648	0.0453246389621046	0.0336085527531976	0.0257039326910529  ];
aux_res_out_4 = [1.99973792349981	0.510268972882700	0.110290062482718	0.0401690656801266	0.0184290680838218	0.00964321593223248	0.00550192702912635	0.00334423481250816	0.00213627921660219	0.00142141772606604	0.000979079780734301];

%% 
%aux_res_out_1 = aux_res_out_1 * 1e-3;
%aux_res_out_2 = aux_res_out_2 * 1e-3;
%aux_res_out_3 = aux_res_out_3 * 1e-3;
%aux_res_out_4 = aux_res_out_4 * 1e-3;


figure
semilogy(meff, aux_res_out_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, aux_res_out_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_out_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_out_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('gm_{peak} (\muS)');

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');
legend('boxoff')

end


%%%*****************************************************************************Figuras meff x gm
plotar = 1213;

if plotar == 1

figure
for i = 1:length(op2)
	h(i) = plot(gm1G(i).x, gm1G(i).y);
	if i == 1
	%axis([0 1.5 0 3]);
xlabel('V_{gs} (V)')
ylabel('gm (S)')
		hold;
	end %fim do if
end %fim do for

figure


for i = 1:length(op2)
	h(i) = plot(gmFBG(i).x, gmFBG(i).y);
	
	if i == 1
	%axis([0 1.5 0 6]);
xlabel('V_{gs} (V)')
ylabel('gm (S)')
		hold;
	end %fim do if
end %fim do for

%gm2G(1).y = smooth (gm2G(1).y);
figure


for i = 1:length(op2)
	h(i) = plot(gm2G(i).x, gm2G(i).y);
	
	if i == 1
	%axis([0 1.5 0 6]);
	xlabel('V_{gs} (V)')
	ylabel('gm (S)')
		hold;
	end %fim do if
end %fim do for

%plot(gm2G(1).x, gm2G(1).y)
%a = smooth (gm2G(1).y);
%plot(gm2G(1).x, a)
%
%figure
%plot(gm2G(2).x, gm2G(2).y); hold;
%a = smooth (gm2G(2).y);
%plot(gm2G(2).x, a)

%[op.V_g, op.I_s] = unir_op(op3);

figure
for i = 1:length(op2)
	h(i) = plot(gm3G(i).x, gm3G(i).y);
	
	if i == 1
	%axis([0 1.5 0 8]);
	xlabel('V_{gs} (V)')
	ylabel('gm (S)')
		hold;
	end %fim do if
end %fim do for


end %if pule

