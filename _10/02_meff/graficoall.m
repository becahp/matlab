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

%ss_1 = [149	198	276	338	394	435	470	518	552	604	657]; %1g
%ss_2 = [144	200	273	358	408	481	513	552	565	618	671]; %fbg
%ss_3 = [142	189	271	347	401	461	498	534	564	609	652]; %2g

ss_1 = [145	192	260	323	392	438	473	521	554	606	659]; %1g
ss_2 = [147	203	273	362	412	487	522	558	570	624	677]; %fbg
ss_3 = [146	190	271	347	401	461	498	534	564	609	652]; %2g
ss_4 = [61	62	66	66	70	75	80	87	93	100	108]; %3g


%peak_gm_1 = [3.86478366	2.68981853	1.79457706	1.105977603	0.688419343	0.452028599	0.3129387	0.225674898	0.168263608	0.128900231	0.100982694];
%peak_gm_2 = [6.582491648	4.325385795	2.177708947	1.179067065	0.70638545	0.45805295	0.315035691	0.226533477	0.168631207	0.129055201	0.101040279];
%peak_gm_3 = [8.128625626	5.201289983	2.348398291	1.24783523	0.745422637	0.482729636	0.331852598	0.238027557	0.177667754	0.136009641	0.10651512];

peak_gm_1 = [7.65065651850661	5.08711560574047	2.32331299433191	1.22241804844055	0.719810538072180	0.463921177914907	0.318015704842820	0.228218905635483	0.169662791803878	0.129724804488165	0.101494849842809];
peak_gm_2 = [7.03463993710161	4.61854615188673	2.24766267155514	1.20146949301249	0.712675150804238	0.460844480200289	0.318228092404938	0.227349599585480	0.169133854204961	0.129383690257088	0.101265166755451];
peak_gm_3 = [8.35385975825370	5.28637942056348	2.35936112068768	1.25007969124905	0.746090479646918	0.482980544354236	0.331964592516426	0.238083749545838	0.177699153467611	0.136028445687659	0.106527090126675];
peak_gm_4 = [7.086419129	3.355854077	1.130115526	0.508053557	0.274643103	0.165664114	0.107785232	0.07811188	0.057993989	0.045415537	0.03787989];


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
%print('sub_slope', '-depsc');

%end

%end

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