function [ss,Ion_Ioff,Ion_I0]=all_2g

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\02_2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\02_2g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\03_3g

clear all
close all
clc

%%
%%%Read data and store it in a struct
op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_2g_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_2g_dd_iv.elpa','*',[],op7);

i = 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_003_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_003_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%aux1 = Ioff;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_01_dd_iv.elpa','*',[],op7);

%op7(1).G(10) = op7(1).G(9);
op7(1).Isum(10) = op7(1).Isum(9);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(9);	%Ioff zoado
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_02_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_03_dd_iv.elpa','*',[],op7);

op7(1).Isum(23) = op7(1).Isum(22);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];

op7 = rdcelpa('02_2g/n_esq_2g_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_04_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_05_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_06_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_07_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_08_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_09_dd_iv.elpa','*',[],op7);

ss(i) = subslope3(op7,3); %2g
Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('02_2g/n_esq_2g_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('02_2g/n_dir_2g_meff_10_dd_iv.elpa','*',[],op7);
ss(i) = subslope3(op7,3); %2g
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

% meff = [3.276444651734383E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% figure
% plot(meff, ss); %acrescentar marker points

% figure
% plot(meff, Ion_Ioff); %acrescentar marker points

% figure
% plot(meff, Ion_I0); %acrescentar marker points
