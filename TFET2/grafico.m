clear all
close all

%x (atraso) 		3 * Ron * CL
x = [8.16E-11 8.12E-09 9.68E-11 7.10E-08 3.43E-11 7.47E-08]

%y1 (potência Os) 	Ps = Ioff * Vdd 
y1 = [1.44E-08 9.60E-15 1.42E-08 1.51E-15 2.38E-08 1.05E-14]

%y2 (potência EL)	EL = CL * Vsup^2
y2 = [2.96E-16 6.24E-17 9.42E-17 9.42E-17 9.42E-17 9.42E-17]


figure
[AX,H1,H2] = plotyy(x,y1,x,y2,'plot');

set(get(AX(1),'Xlabel'),'String','3 * Ron * CL')
set(get(AX(1),'Ylabel'),'String','Ps = Ioff * Vdd ')
set(get(AX(2),'Ylabel'),'String','EL = CL * Vsup^2')

set(H1,'LineStyle','none')
set(H2,'LineStyle','none')

set(H1,'Marker','+')
set(H2,'Marker','*')


print('meugrafico', '-depsc');