%function [ss,Ion_Ioff,Ion_I0]=all_fbg

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\fbg

clear all
close all
clc

%%
%%%Read data and store it in a struct
op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_fbg_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_fbg_dd_iv.elpa','*',[],op7);

i = 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_004_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 5, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_01_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 6, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_02_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 7, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];

op7 = rdcelpa('fbg/n_esq_fbg_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_03_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 8, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];

op7 = rdcelpa('fbg/n_esq_fbg_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_04_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 9, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_05_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 9, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_06_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 10, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_07_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 11, 1); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_08_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 12, 2); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_09_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 12, 2); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_10_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,1, 12, 2); %fbg
[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%

%peak_gm(1)
%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

% meff = [0.04, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% figure
% plot(meff, ss); %acrescentar marker points

% figure
% plot(meff, Ion_Ioff); %acrescentar marker points

% figure
% plot(meff, Ion_I0); %acrescentar marker points

