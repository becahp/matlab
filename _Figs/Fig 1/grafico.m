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
set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
set(0,'DefaultAxesPosition',[0.15 0.2 0.7 0.7]); 
 
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
	
% -------------------------------------------------------------------------------------------------------------------------
x = [8.16E-11 	8.12E-09 	9.68E-11 	7.10E-08 	3.43E-11 	7.47E-08]; %x (atraso) 		3 * Ron * CL
%	[miniFET	tfet		HP/-1		LP/1 		HP/0		LP/0	]
y1 =[1.44E-08 	9.60E-15 	1.42E-08 	1.51E-15 	2.38E-08 	1.05E-14]; %y1 (potência Os) 	Ps = Ioff * Vdd 
y2 =[2.96E-16 	6.24E-17 	9.42E-17 	9.42E-17 	9.42E-17 	9.42E-17]; %y2 (potência EL)	EL = CL * Vsup^2

%	nanoFET		TFET		mmFET-HP  	mmFET-LP

%símbolo nanoFET
%símbolo TFET
%simbolo de mmFET:manter o mesmo



% -------------------------------------------------------------------------------------------------------------------------
xnano = [8.16E-11];
xtfet = [8.12E-09];
xmmfet = [9.68E-11 	7.10E-08 	3.43E-11 	7.47E-08];
xmmfet1 = [9.68E-11 	7.10E-08];
xmmfet0 = [3.43E-11 	7.47E-08];

ynano1 = [1.44E-08];
ynano2 = [2.96E-16];

ytfet1 = [9.60E-15];
ytfet2 = [6.24E-17];

%ymmfet11 = [1.42E-08 	1.51E-15];
%ymmfet11 = [9.42E-17 	9.42E-17];

%ymmfet0 = [2.38E-08 	1.05E-14];
%ymmfet0 = [9.42E-17 	9.42E-17];

ymmfet1 = [1.42E-08 	1.51E-15 	2.38E-08 	1.05E-14];
ymmfet2 = [9.42E-17 	9.42E-17 	9.42E-17 	9.42E-17];


% -------------------------------------------------------------------------------------------------------------------------
% dividir x por 10
% multiplicar y por 10

xnano = xnano/10;
xtfet = xtfet/10;
xmmfet = xmmfet./10;

ynano1 = 10*ynano1;
ytfet1 = 10*ytfet1;
ynano2 = 10*ynano2;
ytfet2 = 10*ytfet2;
ymmfet1= 10 .* ymmfet1;
ymmfet2= 10 .* ymmfet2;

elp.mat=[xnano',ynano1'];
elp.var_names={'x','y'};
elp.title='Fig1_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[xtfet',ytfet1'];
elp.var_names={'x','y'};
elp.title='Fig1_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[xnano',ynano2'];
elp.var_names={'x','y'};
elp.title='Fig2_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[xtfet',ytfet2'];
elp.var_names={'x','y'};
elp.title='Fig2_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)

%elp.mat=[xmmfet',ymmfet1'];
%elp.var_names={'x','y'};
%elp.title='Fig1_d3';
%save_elpa(['Data/',elp.title,'.elpa'],elp)
%
%elp.mat=[xmmfet',ymmfet2'];
%elp.var_names={'x','y'};
%elp.title='Fig2_d3';
%save_elpa(['Data/',elp.title,'.elpa'],elp)

for i=1:4
str = num2str(i);

elp.mat=[xmmfet(i),ymmfet1(i)];
elp.var_names={'x','y'};
s = strcat('Fig1_',str);
elp.title=s;
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[xmmfet(i),ymmfet2(i)];
elp.var_names={'x','y'};
s = strcat('Fig2_',str);
elp.title=s;
save_elpa(['Data/',elp.title,'.elpa'],elp)

end

%h(1) = loglog(xnano,ynano1,'s');
%h(2) = loglog(xtfet,ytfet1, '+');
%h(3) = loglog(xmmfet,ymmfet1, 'd');
%h(4) = loglog(xnano,ynano2,'s');
%h(5) = loglog(xtfet,ytfet2, '+');
%h(6) = loglog(xmmfet,ymmfet2, 'd');

% -------------------------------------------------------------------------------------------------------------------------


pule = 0;
if pule == 1
figure
[AX,H1,H2] = plotyy(x,y1,x,y2,'loglog');

set(get(AX(1),'Xlabel'),'String','3 * Ron * CL')
set(get(AX(1),'Ylabel'),'String','Ps = Ioff * Vdd ')
set(get(AX(2),'Ylabel'),'String','EL = CL * Vsup^2')

set(H1,'LineStyle','none')
set(H2,'LineStyle','none')

set(H1,'Marker','+')
set(H2,'Marker','*')

end


pule = 1;
if pule == 1
figure
yyaxis left
%h(1) = loglog(x,y1,'s');
h(1) = loglog(xnano,ynano1,'s');
hold; 
h(2) = loglog(xtfet,ytfet1, '+');
h(3) = loglog(xmmfet,ymmfet1, 'd');
hold off;
ylabel('P_{\rm s} (W/um)')
ylim([1e-15 1e-5]) %ylim([1e-16 1e-6])

yyaxis right
h(4) = loglog(xnano,ynano2,'s');
hold; 
h(5) = loglog(xtfet,ytfet2, '+');
h(6) = loglog(xmmfet,ymmfet2, 'd');
ylabel('E_{\rm L} (J/um)')
ylim([1e-16 5e-15]) %ylim([1e-17 5e-16])

xlabel('\tau (s)')
xlim([1e-12 1e-8])
ax = gca;
ax.XTick = [1e-12 1e-11 1e-10 1e-9 1e-8];


legend([h(1), h(2), h(3)],{'nanoFET','tFET','mmFET'}, 'Location', 'southwest');
legend('boxoff');
end

%h(1).Color = map(1,:);
%h(2).Color = map(2,:);
%h(3).Color = map(3,:);
%h(4).Color = map(4,:);


%print('meugrafico', '-depsc');
