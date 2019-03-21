%%%Pós processamento para salvar elpas
op = [];
op2 = [];
op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
pause

op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig5a_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig5a'


op = [];
op2 = [];
op2 =  rdcelpa('n_esq_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig5a_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig5a'


op = [];
op2 = [];
op2 =  rdcelpa('n_esq_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig5a_d3';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig5a'




