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

	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\06_Ron

%%
%%%Read data and store it in a struct
op2 = [];		
aux = 3

if aux == 0
op2 =  rdcelpa('nFET_saida_dd_iv.elpa','*',[],op2);
end

if aux == 1
op2 =  rdcelpa('nFET_saida_dd_iv.elpa','*',[],op2);

end

if aux == 2
op2 =  rdcelpa('nHP_vds05_s_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_vds05_s_dd_iv.elpa','*',[],op2);
end

if aux == 3
op2 =  rdcelpa('nHP_vds05_BG0_s_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_vds05_BG0_s_dd_iv.elpa','*',[],op2);
end



%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RES ON 
for i=1:length(op2)
%res(i) = calc_res4(i, op2);
res(i) = calc_res_show(i, op2);
end %i=1:length(op2) 


indice = [];
r_on = [];

for i=1:length(op2)
clear indice;
indice = find(op2(i).V_d>0.0 & op2(i).V_d<0.1);
p(1,:) = polyfit(op2(i).V_d(indice),op2(i).I_d(indice), 1);
r_on(i) = 1/p(1,1); 
end %i=1:length(op2) 


