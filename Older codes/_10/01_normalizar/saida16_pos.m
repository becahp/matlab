addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\07_saida_3g

%plotar parte n da curva de saída (VGS = 1V) , normalizar a curva para o máximo valor de corrente

%%
op6 = [];		
op2 = [];		

aux = 5;

if aux == 1
op6 =  rdcelpa('1g/n_1g_vgs_1_dd_iv.elpa','*',[],op6);
end
if aux == 2
op6 =  rdcelpa('fbg/n_fbg_vgs_1_dd_iv.elpa','*',[],op6);
end
if aux == 3
op6 =  rdcelpa('2g/n_2g_2V_vgs_1_dd_iv.elpa','*',[],op6);
end
if aux == 4
op6 =  rdcelpa('3g/n_3g_vds_vg_08_v1_dd_iv.elpa','*',[],op6);
%op6 =  rdcelpa('3g/n_3g_vds_vg_10_dd_iv.elpa','*',[],op6);
end
if aux == 5
op6 =  rdcelpa('1g/n_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('fbg/n_fbg_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('2g/n_2g_2V_vgs_1_dd_iv.elpa','*',[],op6);
%op6 =  rdcelpa('3g/n_3g_vds_vg_08_v1_dd_iv.elpa','*',[],op6);
op2 =  rdcelpa('n_3g_06V_dd_iv.elpa','*',[],op2);

end

%op6(1).Isum = op6(1).Isum * 1e6;
%op6(2).Isum = op6(2).Isum * 1e6;
%op6(3).Isum = op6(3).Isum * 1e6;
%op6(4).Isum = op6(4).Isum * 1e6;

if aux == 5
op6(1).Isum = op6(1).Isum * 1e6;
op6(2).Isum = op6(2).Isum * 1e6;
op6(3).Isum = op6(3).Isum * 1e6;
%op6(4).Isum = op6(4).Isum * 1e6;
op2(1).I_d = op2(1).I_d * 1e6;
else
op6(1).Isum = op6(1).Isum * 1e6;
end

for i=1:3
	if op6(i).D(1) == 2
		Inorm = op6(i).Isum(1);
	else if op6(i).D(end) == 2
		Inorm = op6(i).Isum(end);
		end
	end
	
	op6(i).aux = op6(i).Isum ./ Inorm;
	
	%eixo x deve ser VDS/Vsup. 
	op6(i).D = op6(i).D ./ 2;
end

Inorm = op2(1).I_d(12);
i = 1;
op2(i).aux = op2(i).I_d ./ Inorm;
op2(i).V_d = op2(i).V_d ./ 1.2;


for i=1:3
elp.mat=[op6(i).D,op6(i).aux];
elp.var_names={'D','Isum'};
str = strcat('Fig8constant_ion_d', num2str(i));
elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[op6(i).D,op6(i).Isum];	%salvar I_d sem normalizar
str = strcat('Fig8constant_d', num2str(i));
elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)
end

i = 1;
elp.mat=[op2(i).V_d,op2(i).aux];
elp.var_names={'V_d','I_s'};
elp.title='Fig8constant_ion_d4';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[op2(i).V_d,op2(i).I_d]; %salvar I_d sem normalizar
elp.title='Fig8constant_d4';
save_elpa(['Data/',elp.title,'.elpa'],elp)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Scaled
clear all
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\fbg

op2 = [];	
aux = 4

if aux == 4
op2 =  rdcelpa('n_1g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_10_dd_iv.elpa','*',[],op2);
end

if aux == 4
op2(1).I_d = op2(1).I_d * 1e6;
op2(2).I_d = op2(2).I_d * 1e6;
op2(3).I_d = op2(3).I_d * 1e6;
else
op2(1).I_d = op2(1).I_d * 1e6;
end

for i=1:length(op2)
	if op2(i).V_d(1) == 2
		Inorm = op2(i).I_d(1);
	else if op2(i).V_d(end) == 2
		Inorm = op2(i).I_d(end);
		end
	end
	
	op2(i).aux = op2(i).I_d ./ Inorm;
	%auxI(i) = op2(i).I_d ./ Inorm;
	%eixo x deve ser VDS/Vsup. 
	op2(i).V_d = op2(i).V_d ./ 2;
end

for i=1:3
elp.mat=[op2(i).V_d,op2(i).aux];
%elp.mat=[op2(i).V_d,op2(i).I_d]; %salvar I_d sem normalizar
elp.var_names={'V_d','I_s'};
str = strcat('Fig8scaled_d', num2str(i));
elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)
end
