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


peak_gm_1 = [3.86478366	2.68981853	1.79457706	1.105977603	0.688419343	0.452028599	0.3129387	0.225674898	0.168263608	0.128900231	0.100982694];
peak_gm_2 = [6.582491648	4.325385795	2.177708947	1.179067065	0.70638545	0.45805295	0.315035691	0.226533477	0.168631207	0.129055201	0.101040279];
peak_gm_3 = [8.128625626	5.201289983	2.348398291	1.24783523	0.745422637	0.482729636	0.331852598	0.238027557	0.177667754	0.136009641	0.10651512];
peak_gm_4 = [7.086419129	3.355854077	1.130115526	0.508053557	0.274643103	0.165664114	0.107785232	0.07811188	0.057993989	0.045415537	0.03787989];


figure
semilogy(meff, peak_gm_1,'Color',map(1,:), 'Marker', '*');
hold
semilogy(meff, peak_gm_2,'Color',map(2,:),'Marker', '*');
semilogy(meff, peak_gm_3,'Color',map(3,:),'Marker', '*');
semilogy(meff, peak_gm_4,'Color',map(4,:),'Marker', '*');

xlabel('m_{eff} / m_0');
ylabel('gm_{peak} (\muS)');

legend({'1G', 'FBG' '2G', '3G'},'Location', 'best'); 
legend('boxoff');
%print('gm_peak', '-depsc');