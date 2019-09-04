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


%R out - usa VG=VD=0.8V
%R on - usa VG = 1.6V, VD=0.8V

%%%%%%%%% AMBAS RES
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\08_vsup16\01_output

%%
%%%Read data and store it in a struct

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RES OUT 
op2 = [];		
sel = 1
r_out = struct('fit',[10],'finita',[10]);

op2 =  rdcelpa('n_1g_saida_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_saida_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_saida_dd_iv.elpa','*',[],op2);


for i=1:length(op2)
	%maximo(i) = find(op2(i).V_d>=1.0,1);
	%if (maximo(i) == 0) || (maximo(i) == 1)
	%	op2(i).V_d = wrev(op2(i).V_d);
	%	op2(i).I_d = wrev(op2(i).I_d);
	%end

%res_out(aux, i) = calc_res3(aux, op2, aux);
%finita(aux, i) = calc_finita(aux, op2, aux);

%%%%%%%%%%%%%%Cálculo da resistencia com fit
if sel == 1 %FIT USADO para saturação
indice_out = find(op2(i).V_d>=1.5 & op2(i).V_d<=2.0);

if i == 3	%mudança para 2G
	indice_out = find(op2(i).V_d>=1.3 & op2(i).V_d<=1.7);
end

end

if sel == 2
indice_out = find(op2(i).V_d>=0.9& op2(i).V_d<=1.9);
end

if sel == 3 %FIT USADO
indice_out = find(op2(i).V_d>=0.7 & op2(i).V_d<=0.9); %VG = 0.8

%if i == 3	%mudança para 2G
%	indice_out = find(op2(i).V_d>=0.4 & op2(i).V_d<=0.6);
%end
end

if sel == 4
indice_out = find(op2(i).V_d>=1.8 & op2(i).V_d<=2);
end

p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);
r_out.fit(i) = 1/p_out(1);

%%%%%%%%%%%%%%%
%f1 = polyval(p_out, op2(i).V_d(indice_out));
%
%figure
%plot(op2(i).V_d, op2(i).I_d);
%hold
%plot(op2(i).V_d(indice_out),f1,'k--');
%%%%%%%%%%%%%%%


a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));
r_out.finita(i) = b/a;
end %for 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RES ON 
for i=1:length(op2)
%res(i) = calc_res4(i, op2);
res(i) = calc_res_show(i, op2);
end %i=1:length(op2) 


