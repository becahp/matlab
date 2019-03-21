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

ss_1 = [149	198	276	338	394	435	470	518	552	604	657]; %1g
ss_2 = [144	200	273	358	408	481	513	552	565	618	671]; %fbg
ss_3 = [142	189	271	347	401	461	498	534	564	609	652]; %2g
ss_4 = [61	62	66	66	70	75	80	87	93	100	108]; %3g



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
%print('sub_slope', '-depsc');