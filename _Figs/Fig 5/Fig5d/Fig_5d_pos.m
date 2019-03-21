%%%Pós processamento para salvar elpas
%op = [];
op2 = [];
op2 =  rdcelpa('n_3g_d16_dreno_10V_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_dir_3g_d24_dd_iv.elpa','*',[],op2);

%op = meu_mergev30(op2);
op2(1).I_s = abs(op2(1).I_s);


cd ..
elp.mat=[op2.V_g,op2.I_s];
elp.var_names={'V_g','I_s'};
elp.title='Fig5d_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig5d'


%op = [];
op2 = [];
op2 =  rdcelpa('n_3g_d16_dreno_12V_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_dir_3g_d24_dd_iv.elpa','*',[],op2);

%op = meu_mergev30(op2);
op2(1).I_s = abs(op2(1).I_s);


cd ..
elp.mat=[op2.V_g,op2.I_s];
elp.var_names={'V_g','I_s'};
elp.title='Fig5d_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig5d'


op2 = [];
op2 =  rdcelpa('n_3g_d16_dreno_14V_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_dir_3g_d24_dd_iv.elpa','*',[],op2);

%op = meu_mergev30(op2);
op2(1).I_s = abs(op2(1).I_s);


cd ..
elp.mat=[op2.V_g,op2.I_s];
elp.var_names={'V_g','I_s'};
elp.title='Fig5d_d3';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig5d'





