addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\00_todas

op2 = [];	

op2 =  rdcelpa('new_1g_dd_iv.elpa','*',[],op2);
%op2 = restringeOp(op2); 
[op(1).x,op(1).y] = plot_elpa_gm_v30(op2,'n');
%op(1).y = smooth(op(1).y);

op2 = [];	

op2 =  rdcelpa('new_fbg_dd_iv.elpa','*',[],op2);
%op2 = restringeOp(op2); 

[op(2).x,op(2).y] = plot_elpa_gm_v30(op2,'n');

op2 = [];	

op2 =  rdcelpa('new_2g_dd_iv.elpa','*',[],op2);
%op2 = restringeOp(op2); 

[op(3).x,op(3).y] = plot_elpa_gm_v30(op2,'n');

%*************************************************************
%cd ..
for i=1:3
	elp.mat=[op(i).x',op(i).y'];
	elp.var_names={'V_g','g_m'};
	
	str = strcat('Fig7b_d', num2str(i));
	elp.title=str;
	
	save_elpa(['Data/',elp.title,'.elpa'],elp)
end

%cd 'Fig7b'


