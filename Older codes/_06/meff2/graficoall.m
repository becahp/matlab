clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect %if there are any open figures. To
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

meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% [ss1,Ion_Ioff1,Ion_I01] = all_fbg;
% [ss2,Ion_Ioff2,Ion_I02] = all_1g;
% [ss3,Ion_Ioff3,Ion_I03] = all_2g;
% [ss4,Ion_Ioff4,Ion_I04] = all_3g;

ss_1 = [148	201	273	339	411	435	466	532	558	609	660]; %1g
ss_2 = [143	193	276	348	409	478	527	570	575	626	676]; %fbg
ss_3 = [142	183	276	341	389	436	490	527	574	619	661]; %2g
ss_4 = [66	66	71	78	82	77	80	83	87	91	95]; %3g


peakgm_1 = [8.19466699568132	2.68652212090282	1.88407039709425	1.49132635371964	1.11551497395430	0.819270433367446	0.608876138781066	0.462009759167033	0.358183355603642	0.283229446391303	0.227905795297670];
peakgm_2 = [6.56710842898489	4.32911051287978	2.77155608070044	1.82261118987913	1.23004299380515	0.862287057168004	0.626785615193749	0.470155137095542	0.362161318967564	0.285279573848478	0.229004238451515];
peakgm_3 = [8.11729819991056	5.40049960040173	3.22417716378462	1.98136106193476	1.28901603826156	0.884632863696214	0.637441370881044	0.478080963273283	0.368253275038886	0.290033936815119	0.232779488914728];
peakgm_4 = [7.12493100690005	3.33112727674868	1.13097680353367	0.487299029492379	0.271904348308143	0.160105069291063	0.104740774897220	0.0762733826119062	0.0564606016992556	0.0425183944020200	0.0325740162512050];

%1g
Ion_Ioff_1 = [4031.6	1650.8	461.80	194.50	102.70	62.800	42.600	31.300	24.300	19.700	16.600];

%fbg
Ion_Ioff_2 = [24732.4982373803	6239.76923714404	1277.31355451252	464.202971114804	223.366067890335	127.905456030455	82.5617202106728	58.1355074708827	43.6896645629989	34.5068033768562	28.3246869119940];

%2g
Ion_Ioff_3 = [10774.6239653963	1385156.39744136	14749453.1443616	3425539.49222802	1231410.94387278	543764.610586909	281821.486014868	172974.447497017	112815.505743345	78601.8072208462	57648.5707729032];

%3g
Ion_Ioff_4 = [1146987.90949530	2197254.06336912	472266.166284892	163110.445671136	72264.5039969750	37353.5155755859	21471.3925156684	13350.1416078799	8822.14771907881	6122.33872733711	4423.43764589452]; 



Ion_I0_1 = [4623.6	1586.2	387.50	152.60	77.200	45.800	30.400	21.800	16.700	13.400	11.100];
Ion_I0_3 = [24440.8522445848	6194.06845345635	1265.94205651496	459.319934930347	220.510055614253	125.872888041107	80.9233509031371	56.7087296205479	42.3866006464409	33.2810259201666	27.1498578189788];
Ion_I0_4 = [11197.6686004983	5400.24873386032	1251.65407639923	459.288611752124	215.011664220271	117.183906430820	70.9898695408488	46.5319810565752	32.4339848929157	23.7527180399030	18.1157234772050];
Ion_I0_2 = [12451.0577870351	3135.16235434541	641.080637961172	232.832506934462	111.984050847760	64.1028338365181	41.3661713672313	29.1210339130064	21.8805222325884	17.2786098292183	14.1808895112000]; 

aux = 1;

%if aux == 1

ss60 = [60	60	60	60	60	60	60	60	60	60	60]; %1g
meff2 = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

figure
semilogy(meff, ss_1,'Color',map(1,:),'Marker', '*');
hold
semilogy(meff, ss_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, ss_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, ss_4,'Color',map(4,:),'Marker', '*');
semilogy(meff2, ss60,'Color','k','LineStyle', '--');

xlabel('m_{eff} / m_0');
ylabel('S (mV/dec)');

axis([0 1 40 1000])

ay = gca;
ay.YTick = [1e1 1e2 1e3 1e4 1e5 1e6 1e7 1e8];


legend({'1G', 'FBG' '2G', '3G'},'Location', 'east'); 
legend('boxoff');
%print('all_ss', '-depsc');
print('Fig_11b', '-depsc');

%end

if aux ==2
figure
semilogy(meff, Ion_Ioff_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, Ion_Ioff_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, Ion_Ioff_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, Ion_Ioff_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('I_{on}/I_{off}');

axis([0 1 1E1 3E7])

ay = gca;
ay.YTick = [1e1 1e2 1e3 1e4 1e5 1e6 1e7 1e8];

legend({'1G', 'FBG' '2G', '3G'});
legend('boxoff');
%print('all_ion_ioff', '-depsc');
end

%if aux == 3
figure
semilogy(meff, Ion_I0_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, Ion_I0_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, Ion_I0_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, Ion_I0_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('I_{on}/I_{off}');

legend({'1G', 'FBG' '2G', '3G'});
legend('boxoff');
%print('all_ion_i0', '-depsc');
print('Fig_11a', '-depsc');
%end

%if aux == 4
figure
semilogy(meff, peakgm_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, peakgm_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, peakgm_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, peakgm_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{\rm eff}');
ylabel('Peak gm (\muS)');

legend({'1G', 'FBG' '2G', '3G'});
legend('boxoff');
%print('Fig_11c', '-depsc');
%print('all_ion_i0', '-depsc');
%end