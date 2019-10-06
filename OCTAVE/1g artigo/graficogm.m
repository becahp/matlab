addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02

clear all
close all
clc

op7 = [];

op7 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op7);

plot_elpa_gm(op7);
%print('gm_1g', '-depsc');
