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

	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\05_vth\02_BG\LP



%%
%%%Read data and store it in a struct
op2 = [];		
aux = 3


if aux == 1		%vth 010
op2 =  rdcelpa('nLP_BG_vth_010_dd_iv.elpa','*',[],op2);
end

if aux == 233		%vth 006
op2 =  rdcelpa('nLP_BG_vth_006_dd_iv.elpa','*',[],op2);
end


if aux == 2		%nLP
op2 =  rdcelpa('nLP_vth_dd_iv.elpa','*',[],op2);

%smooth
% ignorar os 3 primeiros
% ignorar os 3 últimos
% aplicar smooth de 3 em 3

op2(1).I_d = smooth(op2(1).I_d);

end

if aux == 3		%miniFET
op2 =  rdcelpa('nLP_BG_vth_010_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_BG_vth_006_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_BG_vth_002_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nLP_BG_vth_000_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nLP_BG_vth_102_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_BG_vth_106_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_BG_vth_110_dd_iv.elpa','*',[],op2);

end

opAux = [];
res = [];

for j=1:length(op2)

opAux = [];
opAux = op2(j);
i = 1;

%opAux.I_d = smooth(opAux.I_d);

[op(1).x,op(1).y] = plot_elpa_gm_v30(opAux,'n');
%[op(i).x,op(i).y] = plot_elpa_gm_v30(op2(i),'n');



%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done



%figure
%h(1) = plot(op(i).x,op(i).y);
%xlabel('V_{gs} (V)')
%ylabel('g_m (\muS)')
%hold;
%
%if aux == 1 %HP
%	x = 70;
%	y = 87;
%	%axis([0 1.5 -0.5 3.5])
%	%legend({'HP'}, 'Location', 'best');
%	str = 'vth_ideal_HP';
%end
%legend('boxoff')

%i = 1;

%remover a partir de 0.5
%op(i).x = op(i).x(b:a);
%op(i).y = op(i).y(b:a);
a = find(op(1).x >= 0.10, 1, 'last');
b = find(op(1).x <= 0.20, 1);
 
%%% Escolher região de interesse
opT(i).V_g = op(1).x(b:a);
opT(i).I_d = op(1).y(b:a);




%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	

%p(i,:) = polyfit(opT(i).I_d,opT(i).V_g, 1);		%pegar valor correto
p(i,:) = polyfit(opT(i).V_g,opT(i).I_d, 1); 		%pegar imagem correta


fit = polyval(p(i,:), op(i).x);
%h(i+1) = plot(op(i).x,fit);
%%h(i+1).Color = map(i,:);
%h(i+1).Color = 'k';
%h(i+1).LineStyle = '--';


Vth = p(:,2);

%print(str, '-depsc');


%%derivada de GM
diferenca = [];		
transY = [];		
transX = [];		

%op(1).y = smooth(op(1).y,10);

a = find(op(1).x >= 0.00, 1, 'last');
b = find(op(1).x <= 0.4, 1);

op(i).x = op(i).x(b:a);
op(i).y = op(i).y(b:a);
 
%[op(1).x,op(1).y] = plot_elpa_gm_v30(op2,'n');

diferenca.I_d = diff(op(i).y);
diferenca.V_g = diff(op(i).x);

%calcular transcondutancia
for k=1:length(diferenca.V_g) %%49
	transY(k) = abs(diferenca.I_d(k) / diferenca.V_g(k));% * 10^6;
	transX(k) = (op(i).x(k) + op(i).x(k+1))/2;
end


%uso de smooth
%transX = smooth(transX);
transY = smooth(transY,10);

%aux = transY(1:40)
%auxX = transX(find)


max(transY)
%op(1).x(find(max(transY)))
res(j) = transX(find(transY == max(transY)))

if j == 1
figure
h(j)=plot(transX, transY);
hold;
end
if j ~= 1

h(j)=plot(transX, transY);

end



%axis([-1.5 1.5 0 2.5*10]);
end %j=1:length(op2)


%axis([0 0.4 -0.001 0.016]);
xlabel('V_{gs} (V)')
ylabel('d(gm)/dx')

legend({'VBG = 1.0 V','VBG = 0.6V','VBG = 0.2V','VBG = 0.0V','VBG = -0.2V','VBG = -0.6V','VBG = -1.0V'}, 'Location', 'best');
legend('boxoff')


print('dgm_LP', '-depsc');

