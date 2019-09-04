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


%%
%%%Read data and store it in a struct


		
op7 = [];			

meff = [3.276444651734383E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

%[ss,Ion_Ioff,Ion_I0]=all_1g;
%[ss,Ion_Ioff,Ion_I0]=all_2g;
%[ss,Ion_Ioff,Ion_I0]=all_3g;
[ss,Ion_Ioff,Ion_I0]=all_fbg;

figure
plot(meff, ss,'Color',map(1,:), 'Marker', '*');

xlabel('Effective mass');
ylabel('Subthreshold Slope mV/dec');

print('fbg_ss', '-depsc');

% for i =1:11
% text(meff(i),ss(i),num2str(ss(i)),'HorizontalAlignment','center')
% end

%legend({'FBG', '1G', '2G', '3G'});

figure
plot(meff, Ion_Ioff,'Color',map(1,:), 'Marker', '*');

xlabel('Effective mass');
ylabel('Ion/Ioff');

print('fbg_Ion_Ioff', '-depsc');

figure
plot(meff, Ion_I0,'Color',map(1,:), 'Marker', '*');

xlabel('Effective mass');
ylabel('Ion/I0');

print('fbg_Ion_I0', '-depsc');
