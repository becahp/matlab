%%%Pós processamento para salvar elpas
op = [];
op2 = [];
op2 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_1g_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

op = [];
op2 = [];
op2 =  rdcelpa('n_esq_fbg_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_fbg_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

op = [];
op2 = [];
op2 =  rdcelpa('n_esq_2g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_dd_iv.elpa','*',[],op2);

for i=1:length(op2)

	op2(i).V_g = wrev(op2(i).V_g);
	op2(i).I_s = wrev(op2(i).I_s);
	
end

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d3';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

op = [];
op2 = [];
op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

i = 1;
op2(i).V_g = wrev(op2(i).V_g);
op2(i).I_s = wrev(op2(i).I_s);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d4';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

%%%Pós processamento para salvar elpas
op = [];
op2 = [];
op2 =  rdcelpa('p_esq_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_1g_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d5';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

op = [];
op2 = [];
op2 =  rdcelpa('p_esq_fbg_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fbg_dd_iv.elpa','*',[],op2);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d6';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

op = [];
op2 = [];
op2 =  rdcelpa('p_esq_2g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_2g_dd_iv.elpa','*',[],op2);

for i=1:length(op2)

	op2(i).V_g = wrev(op2(i).V_g);
	op2(i).I_s = wrev(op2(i).I_s);
	
end

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d7';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%

op = [];
op2 = [];
op2 =  rdcelpa('p_esq_3g_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_v1_dd_iv.elpa','*',[],op2);

i = 1;
op2(i).V_g = wrev(op2(i).V_g);
op2(i).I_s = wrev(op2(i).I_s);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

cd ..
elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7a_d8';
save_elpa(['Data/',elp.title,'.elpa'],elp)
cd 'Fig7a'
%%*********************************************************%%