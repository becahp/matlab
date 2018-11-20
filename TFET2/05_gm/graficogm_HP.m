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

	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\05_vth\02_BG\HP



%%
%%%Read data and store it in a struct
op2 = [];		
aux = 3


if aux == 3		%miniFET
op2 =  rdcelpa('nHP_BG_vth_010_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_vth_006_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_vth_002_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_vth_000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_vth_102_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_vth_106_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_vth_110_dd_iv.elpa','*',[],op2);

end

opAux = [];
res = [];

for j=1:length(op2)

opAux = [];
opAux = op2(j);
i = 1;

[op(1).x,op(1).y] = plot_elpa_gm_v30(opAux,'n');
%[op(i).x,op(i).y] = plot_elpa_gm_v30(op2(i),'n');


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

if j == 123123124 %plot de gm
figure
h(1) = plot(op(i).x,op(i).y);
xlabel('V_{gs} (V)')
ylabel('g_m (\muS)')
hold;
h(2) = plot(op2(i).V_g,op2(i).I_d);
legend('boxoff')
hold off;
end

%%derivada de GM
diferenca = [];		
transY = [];		
transX = [];		


a = find(op(1).x >= 0.00, 1, 'last');
b = find(op(1).x <= 0.50, 1);

op(i).x = op(i).x(b:a);
op(i).y = op(i).y(b:a);
 
%[op(1).x,op(1).y] = plot_elpa_gm_v30(op2,'n');

diferenca.I_d = diff(op(i).y);
diferenca.V_g = diff(op(i).x);

%calcular transcondutancia
for k=1:length(diferenca.V_g) %%49
	transY(k) = (diferenca.I_d(k) / diferenca.V_g(k));% * 10^6;
	transX(k) = (op(i).x(k) + op(i).x(k+1))/2;
end

%uso de smooth
%transX = smooth(transX);
%transY = smooth(transY,10);


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


end %j=1:length(op2)


axis([0 0.4 -140 160]);
xlabel('V_{gs} (V)')
ylabel('d(gm)/dx')

legend({'VBG = 1.0 V','VBG = 0.6V','VBG = 0.2V','VBG = 0.0V','VBG = -0.2V','VBG = -0.6V','VBG = -1.0V'}, 'Location', 'northeast');
legend('boxoff')

% res
% 0.0200    0.0400    0.0500    0.0600    0.0700    0.1400    0.2500

%print('dgm_HP', '-depsc');