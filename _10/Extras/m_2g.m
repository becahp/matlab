clear;
 
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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\01_2g\2g_vds2

%plotar parte n da curva de saída (VGS = 1V) , normalizar a curva para o máximo valor de corrente

%%
op6 = [];		


op6 =  rdcelpa('n_esq_2g_vds2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('n_dir_2g_vds2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('p_esq_2g_vds2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('p_dir_2g_vds2_dd_iv.elpa','*',[],op6);


op6(1).Isum = abs(op6(1).Isum);
op6(2).Isum = abs(op6(2).Isum);
op6(3).Isum = abs(op6(3).Isum);
op6(4).Isum = abs(op6(4).Isum);


figure
%h(19) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op6(1).G,op6(1).Isum );
%set(h,'linewidth',2)
hold
h(2) = semilogy(op6(2).G,op6(2).Isum );
h(3) = semilogy(op6(3).G,op6(3).Isum );
h(4) = semilogy(op6(4).G,op6(4).Isum ); 


h(1).Color =  map(3,:);
h(2).Color =  map(3,:);
h(3).Color =  map(3,:);
h(4).Color =  map(3,:);
h(3).LineStyle =  '--';
h(4).LineStyle =  '--';


legend({'2G'}, 'Location', 'best');
%print('norm_2G', '-depsc');


op6 = [];		
op = [];

op6 =  rdcelpa('n_esq_2g_vds2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('n_dir_2g_vds2_dd_iv.elpa','*',[],op6);
op = meu_merge(op6);
op.Isum = abs(op.Isum);

elp.mat=[op.G',op.Isum'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7_d3';
save_elpa(['Data/',elp.title,'.elpa'],elp)

op6 = [];		
op = [];
op6 =  rdcelpa('p_esq_2g_vds2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('p_dir_2g_vds2_dd_iv.elpa','*',[],op6);
op = meu_merge(op6);
op.Isum = abs(op.Isum);

elp.mat=[op.G',op.Isum'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7_d7';
save_elpa(['Data/',elp.title,'.elpa'],elp)
