function [op8] = meu_merge(op)

%op8 = [];		%
file_id = 1:size(op,2);

aux = 1; 	%variavel de indice do vetor op8

for i=1:length(file_id) %roda quantos arquivos entraram

	if (i == 1)
		for j=1:length(op(i).I_s) %roda o tamanho total de correntes
			
			op8.I_s(aux) = op(i).I_s(j);
			op8.V_g(aux) = op(i).V_g(j);
		
			aux = aux +1;
		end %fim do for de op(i).V_g(j)
	end	
	
	if (i == 2)
		for j=1:length(op(i).I_s) %roda o tamanho total de correntes
			
			if (op(i).V_g(j) == 0)
				continue;
			end
		
			op8.I_s(aux) = op(i).I_s(j);
			op8.V_g(aux) = op(i).V_g(j);
		
			aux = aux +1;
		end %fim do for de op(i).V_g(j)
	end
end %fim do for de op(i)


