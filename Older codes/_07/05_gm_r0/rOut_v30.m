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


plotar = 0;
if plotar == 1
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


if plotar == 4 %para fit de 1.5 a 2V
aux_res_out_1 = [1466023.02575180	71180507.1122516	15391042727.8121	28530045718.9313	33657867646.5367	36940383181.0290	39538412424.1947	41795376300.8417	43845143729.2188	45749413628.6542	47540903442.7571 ];
aux_res_out_2 = [64126084.6288257	5380947596.58559	116050394358.497	434137826601.288	752324392502.232	951556269620.540	1073458852954.54	1157554522789.28	1222553525525.17	1276858095274.27	1324517344939.85 ];
aux_res_out_3 = [36335515.9283723	1688775524.41949	3635922135.93573	4940700802.14214	5761117522.84585	6974477554.76267	5825258770.42133	6250025332.65756	6606858416.08793	6606180995.76596	6467690018.33019 ];
aux_res_out_4 = [58170689.2608489	275897820.854422	1072046604.89700	1871324240.58932	2529089333.87969	3054647935.83737	3463833556.76243	3783031825.46385	4032895880.60231	4230164402.91642	4384728710.32813 ];

meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

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

if plotar == 5
op2 = [];

op2 = rdcelpa('1G/n_1g_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_10_vsup_ron_dd_iv.elpa','*',[],op2);

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on
xlabel('V_{ds} (V)')
ylabel('I_{ds} (A)')
grid on
h(2) = plot(op2(2).V_d,op2(2).I_d );
h(3) = plot(op2(3).V_d,op2(3).I_d );


legend({'1G', 'FBG','2G'}, 'Location', 'best');
end

plotar = 123
if plotar == 123
%gm
aux_res_out_1 = [5.264488685	255.609201	55269.23444	102451.3942	120865.4027	132652.916	141982.439	150087.1963	157447.9111	164286.1443	170719.3843]; 
aux_res_out_2 = [342.8821745	28771.9268	620521.4586	2321334.959	4022678.527	5087971.374	5739784.487	6189444.033	6536993.701	6827360.235	7082194.243];
aux_res_out_3 = [207.6649391	9659.379792	20270.26591	27544.40697	32118.23019	38882.71237	32475.81765	34843.89123	36833.23567	36829.45905	36057.37185];
aux_res_out_4 = [208.8909451	990.7490747	3849.719358	6719.925348	9081.959798	10969.24074	12438.6263	13584.86729	14482.12911	15190.52037	15745.5608];

meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

figure
semilogy(meff, aux_res_out_1,'Color',map(1,:), 'Marker', '*');
%axis([0 1 1e5 1e14]);

hold
semilogy(meff, aux_res_out_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, aux_res_out_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, aux_res_out_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('gm r_{0}');

legend({'1G', 'FBG','2G', '3G'}, 'Location', 'best');
legend('boxoff');
end

