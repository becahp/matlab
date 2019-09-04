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

%ss_1 = [148	201	273	339	411	435	466	532	558	609	660]; %1g
%ss_2 = [143	193	276	348	409	478	527	570	575	626	676]; %fbg
%ss_3 = [142	183	276	341	389	436	490	527	574	619	661]; %2g
%ss_4 = [66	66	71	78	82	77	80	83	87	91	95]; %3g

ss_1 = [148	197	275	336	392	433	468	516	550	602	655]; %1g
ss_2 = [146	200	273	358	407	481	513	552	565	618	671]; %fbg
ss_3 = [144	189	270	347	399	460	493	536	570	615	658]; %2g
ss_4 = [61	62	66	66	70	75	80	87	93	100	108]; %3g
%ss_4 = [60	60	61	62	64	67	70	73	77	82	86]; %3g


Ion_I0_1 = [5404.67572548329	3124.19514304756	973.597284241673	409.941535990626	211.378315701143	124.303348113533	80.2384072427288	55.5634147559040	40.6544607154930	31.0923985790319	24.6560878004517]; %1G

Ion_I0_2 = [19538.4354561504	6246.11162885216	1501.15181859485	586.145274042729	289.918887018017	165.754286832224	104.772154159326	71.3621113224998	51.5127044761230	38.9523114883038	30.5905473096451]; %FBG

Ion_I0_3 = [33983.4260239504	10908.8048658001	2740.49021968749	1078.52232695558	536.456757680037	307.940281178240	195.188821597931	133.191748191507	96.2455960598396	72.8037544413216	57.1637312429766]; %2G

Ion_I0_4 = [18007.9675369028	5441.26343924060	1250.09278693963	463.716733233140	219.078872009195	120.359423422118	73.4576612876593	48.4914877664650	34.0291684636342	25.0819386229597	19.2464428274669]; %3G


Ion_1 = [-1.28582548900000e-06	-7.36198328600000e-07	-2.30124502400000e-07	-9.72948160600000e-08	-5.03334113200000e-08	-2.96763541600000e-08	-1.91966987300000e-08	-1.33165686700000e-08	-9.75781993100000e-09	-7.47221395800000e-09	-5.93196180800000e-09 ];

Ion_2 = [ -2.25172270500000e-06	-8.50851120600000e-07	-2.33962033500000e-07	-9.76327395700000e-08	-5.03649512800000e-08	-2.96678929200000e-08	-1.91835828100000e-08	-1.33044505800000e-08	-9.74741388000000e-09	-7.46335204300000e-09	-5.92436482400000e-09];
Ion_3 = [ -2.23125376900000e-06	-8.29070587400000e-07	-2.33613828600000e-07	-9.71580250300000e-08	-5.00267088200000e-08	-2.94237449200000e-08	-1.89965802900000e-08	-1.31525796900000e-08	-9.61781552500000e-09	-7.34831092800000e-09	-5.81909228500000e-09];
Ion_4 = [ -2.74922745100000e-06	-1.17658302000000e-06	-3.79730060600000e-07	-1.70858042100000e-07	-9.19015656300000e-08	-5.54036730900000e-08	-3.62002506600000e-08	-2.51313434200000e-08	-1.82999330200000e-08	-1.38520226600000e-08	-1.08278587300000e-08];

aux = 1;

if aux == 1

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
print('Sub_slope', '-depsc');

end

if aux == 3
figure
semilogy(meff, Ion_I0_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, Ion_I0_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, Ion_I0_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, Ion_I0_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('I_{on}/I_{off}');

legend({'1G', 'FBG' '2G', '3G'},'Location', 'best'); 
legend('boxoff');
%print('all_ion_i0', '-depsc');
print('Ion_Ioff', '-depsc');
%end

%if aux == 4
figure
semilogy(meff, Ion_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, Ion_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, Ion_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, Ion_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('I_{on}');

legend({'1G', 'FBG' '2G', '3G'},'Location', 'best'); 
legend('boxoff');
print('Ion', '-depsc');
%print('all_ion_i0', '-depsc');

end