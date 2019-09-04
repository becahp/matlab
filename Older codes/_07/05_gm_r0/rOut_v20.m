clear;

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\07_vth\n_3g_06V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g\re



%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_out v2
%R_saida(VGS=VDS=1V) para o 1G, FBG e 2G e R_saida(VGS=VDS=0.6V) para o 3G

op2 = [];
op2 =  rdcelpa('1g/n_1g_vgs_1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('fbg/n_fbg_vgs_1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('2g/n_2g_2V_vgs_1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_3g_06V/n_3g_06V_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('re/n_3g_vds_vg_08_v1_dd_iv.elpa','*',[],op2);


for i=1:3
%indice_out = find(op2(i).D>=1.23 & op2(i).D<=1.43);
%indice_out = find(op2(i).D>=0.9 & op2(i).D<=1.1);				%fit 1V

indice_out = find(op2(i).D>=1.5 & op2(i).D<=2.0);

p_out = polyfit(op2(i).D(indice_out),op2(i).Isum(indice_out), 1);

r_out(i,1) = 1/p_out(1);
%res(3,i) = 1/p_out(1);

% fit = polyval(p_out, op2(i).D);
% figure
% plot(op2(i).D, op2(i).Isum, op2(i).D,fit, 'k--');
% xlabel('V_{ds} (V)')
% ylabel('I_{ds} (A)')


a = op2(i).Isum(indice_out(end)) - op2(i).Isum(indice_out(1)) ;
b =  op2(i).D(indice_out(end)) - op2(i).D(indice_out(1));
finita(i,1) = b/a;


end

%CONSERTAR 3G: ponto 0.6V
%indice_out = find(op2(4).V_d>=0.5 &op2(4).V_d<=0.7);%para 3g
indice_out = find(op2(4).V_d>=0.7 &op2(4).V_d<=1.2);%para 3g

p_out = polyfit(op2(4).V_d(indice_out),op2(4).I_d(indice_out), 1);

r_out(4,1) = 1/p_out(1);
%res(3,4) = 1/p_out(1);

i = 4;
maximo(i) = find(op2(i).V_d>=1.0,1);
if (maximo(i) == 0) || (maximo(i) == 1)
	op2(i).V_d = wrev(op2(i).V_d);
	op2(i).I_d = wrev(op2(i).I_d);
end

a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));
%r_out = b/a;
finita(i,1) = b/a;
