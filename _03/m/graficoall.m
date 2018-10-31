clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close 00_all figures, and then repeat the first example.
close all;
 
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
set(0,'DefaultAxesUnits','normalized');
set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
set(0,'DefaultAxesPosition',[0.15 0.15 0.7 0.7]); 
 
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

meff = [3.276444651734383E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% [ss1,Ion_Ioff1,Ion_I01] = all_fbg;
% [ss2,Ion_Ioff2,Ion_I02] = all_1g;
% [ss3,Ion_Ioff3,Ion_I03] = all_2g;
% [ss4,Ion_Ioff4,Ion_I04] = all_3g;

ss_1 = [130	219	321	402	470	530	584	634	680	724	765]; %ss(1);
ss_2 = [158	266	415	544	657	757	847	930	1007	1079	1147]; %ss(2);
ss_3 = [111	172	235	282	321	354	384	410	435	458	480]; %ss(3);
ss_4 = [133	103	107	114	121	129	136	143	151	158	166]; %ss(4);

Ion_Ioff_1 = [3120.53430811884	914.510494065627	343.197969384060	180.493151408093	112.135339984313	77.2115902586595	57.0326732695333	44.3400742877832	35.8446102720163	29.8730895828928	25.5102364121678]; %Ion_Ioff(1); 
Ion_Ioff_2 = [298.065342047618	239.244237566324	127.471866927401	78.2642048620817	53.4567925749531	39.3478896182774	30.5805722285345	24.7623464250493	20.7034899425815	17.7541101570307	15.5396584015104]; %Ion_Ioff(2); 
Ion_Ioff_3 = [24906871.7555587	472303.370755159	153687.117885946	50011.4496418059	22449.9572698692	12084.2569643932	7320.62586738727	4819.13996256525	3374.53645943818	2478.24187144691	1890.04426005328]; %Ion_Ioff(3); 
Ion_Ioff_4 = [86350.2385346174	99546.4045322499	78568.2717227481	52414.3725743552	35152.0329449267	24478.2271116701	17722.3292075446	13158.1245132427	10032.4098875099	7853.48602586254	6264.44239184046]; %Ion_Ioff(4); 

Ion_I0_1 = [1560.77171242431	454.461614568071	169.607570063765	88.8621186876369	55.0498951791045	37.8194963071517	27.8845382289043	21.6463702222922	17.4772963291210	14.5507085319036	12.4150539519792]; %Ion_I0(1);
Ion_I0_2 = [369.401498548962	220.724622349951	102.706206336747	58.9032376181918	38.4936095556530	27.4401442945142	20.8036477500780	16.5118185078497	13.5776595879127	11.4801325667550	9.92641329482579]; %Ion_I0(2);
Ion_I0_3 = [3094.36504882919	900.219439913075	336.594469652083	176.064233249578	108.756036562391	74.4125344963356	54.6146445642705	42.1795827398342	33.8627863122648	28.0235641210011	23.7619528552810]; %Ion_I0(3);
Ion_I0_4 = [307.569932618819	599.077851522214	389.401557210700	250.825433260591	173.445861675784	127.177213017833	97.5080595048490	76.6841972057975	61.8227559795767	51.0491138421888	42.8438324834318]; %Ion_I0(4);

%% 
figure
semilogy(meff, ss_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, ss_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, ss_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, ss_4,'Color',map(4,:),'Marker', '*');

xlabel('Effective mass');
ylabel('Subthreshold Slope mV/dec');

legend({'FBG', '1G', '2G', '3G'});

print('all_ss', '-depsc');

%% 
figure
semilogy(meff, Ion_Ioff_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, Ion_Ioff_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, Ion_Ioff_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, Ion_Ioff_4,'Color',map(4,:),'Marker', '*');

xlabel('Effective mass');
ylabel('I_{on}/I_{off}');
%axis ([0 1 0 0.1*10^7])
legend({'FBG', '1G', '2G', '3G'});

print('all_ion_ioff', '-depsc');


%%
figure
semilogy(meff, Ion_I0_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, Ion_I0_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, Ion_I0_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, Ion_I0_4,'Color',map(4,:),'Marker', '*');

xlabel('Effective mass');
ylabel('I_{on}/I_0');

legend({'FBG', '1G', '2G', '3G'});

print('all_ion_i0', '-depsc');