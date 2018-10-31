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


%op2 = rdcelpa('re/n_2g_meff_004_vsup_ron_dd_iv_v1.elpa','*',[],op2); %refeitos
%op2 = rdcelpa('re/n_2g_meff_01_vsup_ron_dd_iv_v1.elpa','*',[],op2);  %refeitos
%op2(2).I_d(19) = NaN;
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


op2(1).I_d = op2(1).I_d *1e6 ;
op2(2).I_d = op2(2).I_d *1e6;
op2(3).I_d = op2(3).I_d *1e6;
op2(4).I_d = op2(4).I_d *1e6;
op2(5).I_d = op2(5).I_d *1e6;
op2(6).I_d = op2(6).I_d *1e6;
op2(7).I_d = op2(7).I_d *1e6;
op2(8).I_d = op2(8).I_d *1e6;
op2(9).I_d = op2(9).I_d *1e6;
op2(10).I_d = op2(10).I_d *1e6 ;
op2(11).I_d = op2(11).I_d *1e6 ;

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on

axis([0 2 0 3])

if aux == 4
axis([0 1.2 0 3])

ay = gca;
ay.XTick = [0 0.2 0.4 0.6 0.8 1.0 1.2];
end

xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')
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

plotar = 1;
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_on
% for i=1:length(op2)
% res(aux, i) = calc_res2(i, op2);
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R_out
for i=1:length(op2)
res_out(aux, i) = calc_res3(i, op2, aux);
end


%%%% teste
% i = 5
% indice_out = find(op2(i).V_d>=0.9 & op2(i).V_d<=1.1);
% p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);
% r_out = 1/p_out(1);


end %for

end %if pule

plotar = 0;
if plotar == 1

aux_res_out_1 = [711539.451284156	2711525.47721837	31165959.3163325	161682063.858076	486205490.001001	949466960.747351	1358261344.78783	1620948647.49778	1766019715.00355	1842498405.75374	1883142945.84270];
aux_res_out_2 = [1068134.27854138	7591745.59029720	73190030.8905381	282301027.116802	702640929.995299	1268667292.51492	1794585237.75119	2159944162.46608	2370442447.71617	2479116595.16329	2531143485.15237];
%aux_res_out_3 = [2456863.66020084	31657096.5952843	864328026.258473	6642589310.07770	41625781617.4587	575339741102.249	205878956841.915	-27765112885.6596	-397125158787.186	-17882578982.2700	36410099739.0084];
aux_res_out_3 = [8935183.886	364718295.6	5297954770	7832031091	9341310421	9951621439	9236583218	9707817980	9395463064	9110149498	9190062662]; %versão com fit de 1 a 2V
aux_res_out_4 = [912983.859707856	2322226.58915355	9096668.73510950	22099356.8797048	41666993.5753867	68105439.9636720	101908458.374177	143652425.510239	193900164.751944	253127698.530532	321727556.955943];

%2G: v1
%2450412.86025737	30545589.6660950

%2G só refeitas
%2456863.66020084	31657096.5952843

if plotar == 2
%para VGS max
aux_res_out_1 = [1807738.54735352	347614517.144027	19382076139.5213	29695140166.1398	35014765087.6027	38745606316.3464	41758908584.9838	44375315558.9000	46737115106.0633	48916268712.4958	50953735163.2687]; 
aux_res_out_2 = [231942442.809668	9443480127.74970	160195951569.779	579522177735.955	999714080988.291	1264524645317.29	1426745193643.30	1538671033352.32	1625034896473.08	1697158666684.88	1760455055264.39];
aux_res_out_3 = [113735244.740864	847261750.575827	1517723169.49946	1662131425.42874	1727278852.98986	1935681340.60783	1785575767.17052	1720336258.65918	1697105621.13164	1681466052.42625	1670234566.36236];
aux_res_out_4 = [99595449.2103693	339538749.013419	791519363.597893	1052430193.21759	1197663533.54865	1302745315.77500	1383555465.62100	1440421596.56407	1480531955.59322	1507364538.02577	1525092154.32154];
end

%% 
%aux_res_out_1 = aux_res_out_1 * 1e-3;
%aux_res_out_2 = aux_res_out_2 * 1e-3;
%aux_res_out_3 = aux_res_out_3 * 1e-3;
%aux_res_out_4 = aux_res_out_4 * 1e-3;
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



if plotar == 3
aux_res_out_1 = [1116525.89196305	11406718.0308764	605927256.423183	6524476697.42000	18400222364.6131	24629766879.4873	26891528145.9819	28016445073.8440	28839098155.0161	29578618906.2793	30295348244.4345];
aux_res_out_2 = [6725485.61239829	168894712.880135	5100597835.77503	33027436657.6705	90587512996.7419	143661142947.037	175011109360.764	191980746477.225	202148903249.728	209254401388.534	214923802733.390];
aux_res_out_3 = [10183469.1061247	633464595.922690	8348235491.09870	13007621276.8224	17243347964.9048	19228592786.7155	20347413407.1328	17921493947.8211	18412505590.5836	19557176817.3188	22591563272.0086];
aux_res_out_4 = [17125349.8648703	66972038.8775163	408864688.585185	1055333794.08211	1785112309.00446	2470578840.13930	3073899882.51794	3594092830.01854	4041657441.05406	4425913646.99876	4755454937.26699];

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