%function [ss,Ion_Ioff,Ion_I0]=all_3g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\3g

clear all
close all
clc

%%
%%%Read data and store it in a struct
op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_3g_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_3g_dd_iv.elpa','*',[],op7);

%%
i = 1;

op7 = [];
op7 = rdcelpa('3g/n_esq_3g_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_004_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,0); %3g

% aux = 3;
% aux2 = 0;

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
op7 = rdcelpa('3g/n_esq_3g_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_01_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-1); %3g

% aux = 3;
% aux2 = -1;

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
op7 = rdcelpa('3g/n_esq_3g_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_02_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-1); %3g

% aux = 3;
% aux2 = -1;

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

op7 = rdcelpa('3g/n_esq_3g_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_03_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-1); %3g
% aux = 3;
% aux2 = -1;

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

op7 = rdcelpa('3g/n_esq_3g_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_04_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,4,-2); %3g
% aux = 4;
% aux2 = -2;

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
op7 = rdcelpa('3g/n_esq_3g_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_05_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-2); %3g

% aux = 3;
% aux2 = -2;

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
op7 = rdcelpa('3g/n_esq_3g_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_06_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-2); %3g

% aux = 3;
% aux2 = -2;

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
op7 = rdcelpa('3g/n_esq_3g_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_07_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-2); %3g

% aux = 3;
% aux2 = -2;

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
op7 = rdcelpa('3g/n_esq_3g_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_08_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-2); %3g

% aux = 3;
% aux2 = -2;


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
op7 = rdcelpa('3g/n_esq_3g_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_09_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-2); %3g

% aux = 3;
% aux2 = -2;


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
op7 = rdcelpa('3g/n_esq_3g_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_10_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,4,3,-2); %3g

% aux = 3;
% aux2 = -2;

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

