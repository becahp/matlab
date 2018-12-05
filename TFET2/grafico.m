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
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];
	

x = [8.16E-11 	8.12E-09 	9.68E-11 	7.10E-08 	3.43E-11 	7.47E-08]; %x (atraso) 		3 * Ron * CL
%	[miniFET	tfet		HP/-1		LP/1 		HP/0		LP/0	]
y1 =[1.44E-08 	9.60E-15 	1.42E-08 	1.51E-15 	2.38E-08 	1.05E-14]; %y1 (potência Os) 	Ps = Ioff * Vdd 
y2 =[2.96E-16 	6.24E-17 	9.42E-17 	9.42E-17 	9.42E-17 	9.42E-17]; %y2 (potência EL)	EL = CL * Vsup^2



figure
[AX,H1,H2] = plotyy(x,y1,x,y2,'loglog');

set(get(AX(1),'Xlabel'),'String','3 * Ron * CL')
set(get(AX(1),'Ylabel'),'String','Ps = Ioff * Vdd ')
set(get(AX(2),'Ylabel'),'String','EL = CL * Vsup^2')

set(H1,'LineStyle','none')
set(H2,'LineStyle','none')

set(H1,'Marker','+')
set(H2,'Marker','*')


print('meugrafico', '-depsc');