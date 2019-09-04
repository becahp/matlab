%function [ss,Ion_Ioff,Ion_I0]=all_fbg

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\03_meff_transfer\FBG

clear all
close all
clc

%%
%%%Read data and store it in a struct
%op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_fbg_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_fbg_dd_iv.elpa','*',[],op7);

i = 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_004_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i)= subslope_v30(op7,-1, 7, 2); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_01_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 7, 3); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_02_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 10, 4); %fbg
[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];

%op7 = rdcelpa('fbg/n_esq_fbg_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_03_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 10, 4); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];

%op7 = rdcelpa('fbg/n_esq_fbg_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_04_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 11, 5); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_05_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 11, 5); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_06_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 12, 6); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_07_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i)= subslope_v30(op7,-1, 12, 7); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_08_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
%ss(i)= subslope_v30(op7,-1, 12, 6); %fbg

ss(i)= subslope_v30(op7,-1, 14, 8); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_09_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); 
ss(i)= subslope_v30(op7,-1, 14, 8); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

%%
i = i + 1;

op7 = [];
%op7 = rdcelpa('fbg/n_esq_fbg_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_fbg_vsup_meff_10_dd_iv.elpa','*',[],op7);

op7 = restringeOp(op7); ss(i)= subslope_v30(op7,-1, 14, 8); %fbg

[x,y] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 

%Ioff = op7(1).I_s(13);	%Ioff
Ion(i) = op7(1).I_s(find(op7.V_g >= 1, 1));	%Ion(i)
	%Ion
I0 = op7(1).I_s(1);	%Ioff_0

%Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion(i)/I0;

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

