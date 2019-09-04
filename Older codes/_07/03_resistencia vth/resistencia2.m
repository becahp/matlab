clear;

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\07_vth\n_3g_06V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g\re


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\3G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\FBG
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\re


%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V


op2 = [];
op2 =  rdcelpa('1g/n_1g_vgs_2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('fbg/n_fbg_vgs_2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('2g/n_2g_2V_vgs_2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('3g/n_3g_vds_vg_12_dd_iv.elpa','*',[],op2);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_on
for i=1:4
%res(i) = calc_res(i, op2);
[res(1,i),res(2,i)] = calc_res(i, op2);
end



op2 = [];
op2 = rdcelpa('re/n_1g_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_fbg_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_004_dd_iv.elpa','*',[],op2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_on
for i=1:4
%res(i) = calc_res(i, op2);
[res(5,i)] = calc_res2(i, op2);
end

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
indice_out = find(op2(i).D>=0.9 & op2(i).D<=1.1);

p_out = polyfit(op2(i).D(indice_out),op2(i).Isum(indice_out), 1);

r_out(i) = 1/p_out(1);
res(3,i) = 1/p_out(1);

% fit = polyval(p_out, op2(i).D);
% figure
% plot(op2(i).D, op2(i).Isum, op2(i).D,fit, 'k--');
% xlabel('V_{ds} (V)')
% ylabel('I_{ds} (A)')


a = op2(i).Isum(indice_out(end)) - op2(i).Isum(indice_out(1)) ;
b =  op2(i).D(indice_out(end)) - op2(i).D(indice_out(1));
finita(i) = b/a;


end

%CONSERTAR 3G: ponto 0.6V
%indice_out = find(op2(4).V_d>=0.7 &op2(4).V_d<=0.9);%para 3g
indice_out = find(op2(4).V_d>=0.5 &op2(4).V_d<=0.7);%para 3g

p_out = polyfit(op2(4).V_d(indice_out),op2(4).I_d(indice_out), 1);

fit = polyval(p_out, op2(4).V_d);
figure
plot(op2(4).V_d, op2(4).I_d, op2(4).V_d,fit, 'k--');
xlabel('V_{ds} (V)')
ylabel('I_{ds} (A)')
legend('3G, V_g = 0.8V', 'fit');

r_out(4) = 1/p_out(1);
res(3,4) = 1/p_out(1);

i = 4;
maximo(i) = find(op2(i).V_d>=1.0,1);
if (maximo(i) == 0) || (maximo(i) == 1)
	op2(i).V_d = wrev(op2(i).V_d);
	op2(i).I_d = wrev(op2(i).I_d);
end

a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));
%r_out = b/a;
finita(i) = b/a;


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
