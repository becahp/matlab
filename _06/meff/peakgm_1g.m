function [peak_gm]=peakgm_1g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\01_1g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\02_2g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\03_3g

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04

clear all
close all
clc

%%
%%%Read data and store it in a struct
op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);

i = 1;

% op7 = [];
% op7 = rdcelpa('01_1g/n_esq_1g_meff_00_dd_iv.elpa','*',[],op7);
% op7 = rdcelpa('01_1g/n_dir_1g_meff_00_dd_iv.elpa','*',[],op7);
% peak_gm(i) = plot_elpa_gmp(op7);
% i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_dir_1g_meff_003_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_esq_1g_meff_003_dd_iv.elpa','*',[],op7);
peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_01_dd_iv.elpa','*',[],op7);
peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_02_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];

op7 = rdcelpa('01_1g/n_esq_1g_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_03_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];

op7 = rdcelpa('01_1g/n_esq_1g_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_04_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_05_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_06_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_07_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_08_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_09_dd_iv.elpa','*',[],op7);

peak_gm(i) = plot_elpa_gmp(op7);
i = i + 1;

op7 = [];
op7 = rdcelpa('01_1g/n_esq_1g_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('01_1g/n_dir_1g_meff_10_dd_iv.elpa','*',[],op7);
peak_gm(i) = plot_elpa_gmp(op7);


%peak_gm(1)
%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

%meff = [0.0, 3.276444651734383E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

%plot(meff, peak_gm); %acrescentar marker points

