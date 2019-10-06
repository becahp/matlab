%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\06%1g saida
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\15

clear all
close all
clc

%%
%%%Read data and store it in a struct
	
op6 = [];		


op6 =  rdcelpa('15/n_1g_vgs_05_dd_iv.elpa','*',[],op6);%10/
%op6 =  rdcelpa('06/n_1g_vgs_01_ion_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/p_1g_vgs_05_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/n_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/n_1g_vgs_15_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/n_1g_vgs_2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/p_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/p_1g_vgs_15_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('15/p_1g_vgs_2_dd_iv.elpa','*',[],op6);

op6(1).Isum = op6(1).Isum * 1e6;
op6(2).Isum = op6(2).Isum * 1e6;
op6(3).Isum = op6(3).Isum * 1e6;
op6(4).Isum = op6(4).Isum * 1e6;
op6(5).Isum = op6(5).Isum * 1e6;
op6(6).Isum = op6(6).Isum * 1e6;
op6(7).Isum = op6(7).Isum * 1e6;
op6(8).Isum = op6(8).Isum * 1e6;


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


%plot_elpa_vds(op5,{{'Isum','D'}});

plot_elpa_vds(op6,{{'Isum','D'}});

%%
%%%Save selected data for further postprocessing (e.g. visualization with 
%%%another program 

%elp.title='';
%elp.var_names={'G','Isum','Isum','Isum'};
%elp.mat=[op(1).G,op(1).Isum,op(2).Isum,op(3).Isum];
%save_elpa('test_current.elpa',elp);

%elp.title='';
%elp.var_names={'D','Isum'};
%elp.mat=[op3(1).G1,op3(1).Isum];
%save_elpa('test_current.elpa',elp);


