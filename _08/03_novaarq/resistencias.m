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
    0.75, 0, 0.75];


%R out - usa VG = 1V
%R on - usa VG = 2V

%%%%%%%%% AMBAS RES
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\fbg

%%
%%%Read data and store it in a struct

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RES OUT 
op2 = [];		
sel = 3
r_out = struct('fit',[10, 20, 30],'finita',[10, 20, 30]);

op2 =  rdcelpa('n_1g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_10_dd_iv.elpa','*',[],op2);


for i=1:length(op2)
	maximo(i) = find(op2(i).V_d>=1.0,1);
	if (maximo(i) == 0) || (maximo(i) == 1)
		op2(i).V_d = wrev(op2(i).V_d);
		op2(i).I_d = wrev(op2(i).I_d);
	end

%res_out(aux, i) = calc_res3(aux, op2, aux);
%finita(aux, i) = calc_finita(aux, op2, aux);

%%%%%%%%%%%%%%Cálculo da resistencia com fit
if sel == 1 %FIT USADO para saturação
indice_out = find(op2(i).V_d>=1.5 & op2(i).V_d<=2.0);
end

if sel == 2
indice_out = find(op2(i).V_d>=0.9& op2(i).V_d<=1.9);
end

if sel == 3 %FIT USADO
indice_out = find(op2(i).V_d>=0.9 & op2(i).V_d<=1.1);
end

if sel == 4
indice_out = find(op2(i).V_d>=1.8 & op2(i).V_d<=2);
end

p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);
r_out.fit(i) = 1/p_out(1);

a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));
r_out.finita(i) = b/a;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RES ON 
op2 = [];		
%sel = 3
%r_out = struct('fit',[10, 20, 30],'finita',[10, 20, 30]);

op2 =  rdcelpa('n_1g_20_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_20_dd_iv.elpa','*',[],op2);

segmentos = 3;
indice = struct('a',{},'b',{},'c',{});

%i = 3
for i=1:length(op2)

indice(1).a = find(op2(i).V_d>0.0 & op2(i).V_d<0.2);
indice(1).b = find(op2(i).V_d>0.2 & op2(i).V_d<0.4);
indice(1).c = find(op2(i).V_d>0.4 & op2(i).V_d<0.6);

%p(i) slope; p(2) constant
p(1,:) = polyfit(op2(i).V_d(indice(1).a),op2(i).I_d(indice(1).a), 1);
p(2,:) = polyfit(op2(i).V_d(indice(1).b),op2(i).I_d(indice(1).b), 1);
p(3,:) = polyfit(op2(i).V_d(indice(1).c),op2(i).I_d(indice(1).c), 1);


f1 = polyval(p(1,:), op2(i).V_d(indice(1).a));
f2 = polyval(p(2,:), op2(i).V_d(indice(1).b));
f3 = polyval(p(3,:), op2(i).V_d(indice(1).c));

figure
plot(op2(i).V_d, op2(i).I_d);
xlim([0 0.6])
%axis([0 0.6 0 6e-7])
hold
plot(op2(i).V_d(indice(1).a),f1,'k--');
plot(op2(i).V_d(indice(1).b),f2,'k--');
plot(op2(i).V_d(indice(1).c),f3,'k--');
hold off


soma = (p(1,1) + p(2,1) + p(3,1)) / segmentos ;
inverso = 1/soma;

r_on(i) = inverso;
end

%%%%%%%%%%%%%%%%%% para 2G
op2 = [];		
op2 =  rdcelpa('n_2g_20_dd_iv.elpa','*',[],op2);

i = 1;
indice = find(op2(i).V_d>0.0 & op2(i).V_d<0.2);
p = polyfit(op2(i).V_d(indice),op2(i).I_d(indice), 1);

r_on(3) = 1/p(1);