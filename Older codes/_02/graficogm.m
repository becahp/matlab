clear;
close all;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close all figures, and then repeat the first example.
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
	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\09_3g %novo 3g

op7 = [];

%%FBG
op7 =  rdcelpa('01/n_esq_fbg_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01/n_dir_fbg_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('01/p_esq_fbg_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('01/p_dir_fbg_dd_iv.elpa','*',[],op7);

[op(1).x,op(1).y] = plot_elpa_gm(op7,'n');
% print('gm_fbg', '-depsc');

op7 = [];

op7 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op7);

[op(2).x,op(2).y] = plot_elpa_gm(op7,'n');
% print('gm_1g', '-depsc');

op7 = [];

op7 =  rdcelpa('03/n_esq_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/n_dir_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/p_esq_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/p_dir_2g_dd_iv.elpa','*',[],op7);

[op(3).x,op(3).y] = plot_elpa_gm(op7,'n');
% print('gm_2g', '-depsc');


op7 = [];

% op7 =  rdcelpa('04/n_esq_3g_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('04/n_dir_3g_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('04/p_esq_3g_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('04/p_dir_3g_dd_iv.elpa','*',[],op7);


op7 =  rdcelpa('09_3g/n_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('09_3g/n_dir_3g_100_1V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('09_3g/p_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('09_3g/p_dir_3g_100_1V_dd_iv.elpa','*',[],op7);



[op(4).x,op(4).y] =plot_elpa_gm(op7,'n');
% print('gm_3g', '-depsc');

%% 

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op(1).x,op(1).y);

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('g_m (\muS)')
axis([-0.5 2 0 1.2*10]);

hold
h(2) = plot(op(2).x,op(2).y);
h(3) = plot(op(3).x,op(3).y);
h(4) = plot(op(4).x,op(4).y);

hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(2,:);
h(3).Color  = map(3,:);
h(4).Color  = map(4,:);

legend({'FBG','1G','2G','3G'},'Location', 'best'); 
%print('4estruturas', '-depsc')



% op7 = [];

% op7 =  rdcelpa('09_3g/n_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('09_3g/n_dir_3g_100_1V_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('09_3g/p_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('09_3g/p_dir_3g_100_1V_dd_iv.elpa','*',[],op7);

% [transx, transy] =plot_elpa_gm(op7,'n');

% figure
% h(1) = plot(transx,transy);

% xlabel('V_{gs} (V)')
% ylabel('g_m (\muS)')
% %axis([-0.5 2 0 2.5*10]);

% h(1).Color  = map(1,:);