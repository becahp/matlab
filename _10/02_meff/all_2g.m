%function [ss,%Ion_Ioff,Ion_I0]=all_2g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\05_meff_escalado\00_trans\2G

clear all
close all
clc

%%
%%%Read data and store it in a struct
%op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_dd_iv.elpa','*',[],op7);

i = 1;


op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_004_dd_iv.elpa','*',[],op7);
op7 = restringeOp(op7); ss(i) = subslope_v30(op7,-1,10,2); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%aux1 = Ioff;


%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_01_dd_iv.elpa','*',[],op7);
% op2 = [];
% op2 = rdcelpa('n_2g_vsup_meff_01_v2_dd_iv.elpa','*',[],op2);

%op7(1).V_g(10) = op7(1).V_g(9);
%op7(1).I_s(10) = op7(1).I_s(9);

op7 = restringeOp(op7); ss(i) = subslope_v30(op7,-1,15,4); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 


%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_02_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i) = subslope_v30(op7,-1,17,4); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 


%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_03_dd_iv.elpa','*',[],op7);

%op7(1).I_s(23) = op7(1).I_s(22);

op7 = restringeOp(op7); ss(i) = subslope_v30(op7,-1,17,4); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];

%op7 = rdcelpa('00_trans/2G/n_esq_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_04_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i) = subslope_v30(op7,-1,20,4); %2g

%%com flag

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 


%Ioff = op7(1).I_s(17)	%Ioff  				%alterado
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_05_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i) = subslope_v30(op7,-1,20,4); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_06_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i) = subslope_v30(op7,-1,22,5); %2g

%% com flag

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 


%Ioff = op7(1).I_s(27)	%Ioff  				%alterado
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_07_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i) = subslope_v30(op7,-1,30,7); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 


%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_08_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i) = subslope_v30(op7,-1,25,7); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 


%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_09_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i) = subslope_v30(op7,-1,25,7); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('00_trans/2G/n_esq_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('00_trans/2G/n_2g_vsup_meff_10_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i) = subslope_v30(op7,-1,25,7); %2g

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
%Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)

%I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff
%Ion_I0(i) = Ion(i)/I0;

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
% plot(meff, %Ion_Ioff); %acrescentar marker points

% figure
% plot(meff, Ion_I0); %acrescentar marker points


