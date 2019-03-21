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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\03_meff_transfer\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\03_meff_transfer\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\03_meff_transfer\FBG


%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

pule = 1;

if pule == 1
for aux = 1:4

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
		gms(aux, i) = gm1G(i).y(find(gm1G(i).x>=0.99 & gm1G(i).x<=1.04)); %encontrar gm em (1,1)
		
		elseif aux == 2
			[gmFBG(i).x,gmFBG(i).y] = plot_elpa_gm_v30(op2(i));
			gms(aux, i) = gmFBG(i).y(find(gmFBG(i).x>=0.99 & gmFBG(i).x<=1.04));
			
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




%%%*****************************************************************************Figuras meff x gm
plotar = 1;

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

gm2G(1).y = smooth (gm2G(1).y);
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


%%%*****************************************************************************Figura 2 meff x gm_peak * r0
if pule == 2
meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

%ganho intrinseco
%aux_res_out_1 = [1.941297588	135.4440743	13533.8978	11645.83262	7382.81342	4829.370044	3320.550362	2387.244296	1781.905123	1372.529623	1085.58334 ];
%aux_res_out_2 = [343.1972301	15324.80365	107420.8663	179588.1821	165810.048	124708.0407	90341.17429	66282.62714	49852.43378	38479.91628	30424.71332 ];
%aux_res_out_3 = [199.4784779	5426.671773	3828.048402	2342.353463	1467.189838	1064.071889	574.3133641	421.4486392	318.6540735	236.3657575	176.983423 ];
%aux_res_out_4 = [116.3261334	140.7820977	118.236087	75.16934633	46.60875952	29.45662964	19.05775947	12.65134673	8.615391652	6.012830666	4.292999224 ];

aux_res_out_1 = [1.52E+01	2.13E+03	1.37E+04	9.19E+03	5.80E+03	3.83E+03	2.66E+03	1.92E+03	1.44E+03	1.11E+03	8.82E+02 ];
aux_res_out_2 = [3.98E+03	3.01E+04	1.33E+05	2.07E+05	1.88E+05	1.41E+05	1.02E+05	7.46E+04	5.60E+04	4.32E+04	3.41E+04 ];
aux_res_out_3 = [6.79E+03	6.91E+03	3.84E+03	2.23E+03	1.38E+03	1.13E+03	6.66E+02	4.50E+02	3.03E+02	2.25E+02	1.82E+02 ];
aux_res_out_4 = [1.16E+02	1.41E+02	1.18E+02	7.52E+01	4.66E+01	2.95E+01	1.91E+01	1.27E+01	8.62E+00	6.01E+00	4.29E+00 ];


figure
semilogy(meff, aux_res_out_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, aux_res_out_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_out_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_out_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('gm r_0');
%axis([0 1 0.5e1 1e6]);

ay = gca;
ay.YTick = [1e0 1e1 1e2 1e3 1e4 1e5 1e6];

%legend({'1G', 'FBG','2G', '3G'}, 'Location', 'northwest');
legend({'1G', 'FBG','2G', '3G'}, 'Position', [0.22 0.22 0.1 0.1]);
legend('boxoff');
%print('00_gm_r0', '-depsc');

end