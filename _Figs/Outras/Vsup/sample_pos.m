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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\08_vsup16\00_trans

%%
%%%Read data and store it in a struct

op2 = [];	
op2 = rdcelpa('n_1g_vsup16_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(1).x,op(1).y] = plot_elpa_gm_v30(op2,'n');


op2 = [];	
op2 =  rdcelpa('n_fbg_vsup16_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(2).x,op(2).y] = plot_elpa_gm_v30(op2,'n');

op2 = [];	
op2 = rdcelpa('n_2g_vsup16_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(3).x,op(3).y] = plot_elpa_gm_v30(op2,'n');

op2 = [];
op2 = rdcelpa('n_1g_vsup16_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_vsup16_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('n_2g_vsup16_dd_iv.elpa','*',[],op2);



for i=1:3
op2(i).I_d = op2(i).I_d;

elp.mat=[op2(i).V_g,op2(i).I_d];
elp.var_names={'V_g','I_d'};
str = strcat('FigVsup_d', num2str(i));

elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)


elp.mat=[op(i).x',op(i).y'];
elp.var_names={'V_g','g_m'};

str = strcat('FigVsupgm_d', num2str(i));
elp.title=str;

save_elpa(['Data/',elp.title,'.elpa'],elp)

end % 