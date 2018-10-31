function [Vg,Is] = unir_op(op)

file_id = 1:size(op,2);

aux = 1; 	%variavel de indice do vetor op8
op8 = [];

for i=1:length(file_id) %roda quantos arquivos entraram

	if (i == 1)
		%jaux = length(op(i).I_d) + 1;
	
		
		for j=1:length(op(i).I_d) %roda o tamanho total de correntes
		
			op8.I_d(aux) = op(i).I_d(j);
			op8.V_d(aux) = op(i).V_d(j);
			
			aux = aux +1;
		end
	end	
	
	if (i > 1)
		for j=1:length(op(i).I_d) %roda o tamanho total de correntes
			
			if (op(i).V_d(j) == op8.V_d(aux - 1)) %se for igual ao último (do outro op) pula
					continue;
			end
			
			op8.I_d(aux) = op(i).I_d(j);
			op8.V_d(aux) = op(i).V_d(j);
		
			aux = aux +1;
		end %fim do for de op(i).V_d(j)
	end
end %fim do for de op(i)

Vg = op8.V_d;
Is = op8.I_d;


%elp.mat=[op2(1).V_d, op2(1).I_d];
%elp.var_names={'V_d','I_d'};
%elp.title='n_1g_meff_004_dd_iv';
%save_elpa(['save_elpa/',elp.title,'.elpa'],elp)