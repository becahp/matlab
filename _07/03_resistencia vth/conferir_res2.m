clear;
close all;

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\3G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\FBG

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\re

	   
map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];
	
%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

%aux = 1;
op2 = [];

%op2 = rdcelpa('1G/n_1g_meff_004_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('FBG/n_fbg_meff_004_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('2G/n_2g_meff_004_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('2G/n_2g_meff_01_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('2G/n_2g_meff_04_dd_iv.elpa','*',[],op2);


op2 = rdcelpa('re/n_1g_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_fbg_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_04_dd_iv.elpa','*',[],op2);


figure
for i = 1:5
	h(i) = plot(op2(i).V_d, op2(i).I_d);
	
	if i == 1
		hold;
	end %fim do if
end %fim do for


h(1).Color =  map(1,:);
h(2).Color =  map(2,:);
h(3).Color =  map(3,:);
h(4).Color =  map(4,:);
h(5).Color =  map(5,:);

%h(6).Color =  map(1,:);
%h(7).Color =  map(2,:);
%h(8).Color =  map(3,:);
%h(9).Color =  map(4,:);
%h(10).Color =  map(5,:);
%
%
%h(6).LineStyle = '--';
%h(7).LineStyle = '--';
%h(8).LineStyle = '--';
%h(9).LineStyle = '--';
%h(10).LineStyle = '--';

legend([h(1) h(2) h(3) h(4) h(5)], {'1G: meff = 0.04','FBG: meff = 0.04', '2G: meff = 0.04', '2G: meff = 0.1', '2G: meff = 0.4'});

