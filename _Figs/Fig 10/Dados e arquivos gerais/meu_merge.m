function [op8] = meu_merge(op)

%op8 = [];		%
file_id = 1:size(op,2);

aux = 1; 	%variavel de indice do vetor op8

for i=1:length(file_id) %roda quantos arquivos entraram

	if (i == 1)
		jaux = length(op(i).Isum) + 1;
	
		for j=1:length(op(i).Isum) %roda o tamanho total de correntes
			op8.Isum(aux) = op(i).Isum(jaux - j);
			op8.G(aux) = op(i).G(jaux - j);
			
			aux = aux +1;
		end
	end	
	
	if (i == 2)
		for j=1:length(op(i).Isum) %roda o tamanho total de correntes
			
			if (op(i).G(j) == 0)
				continue;
			end
		
			op8.Isum(aux) = op(i).Isum(j);
			op8.G(aux) = op(i).G(j);
		
			aux = aux +1;
		end %fim do for de op(i).G(j)
	end
end %fim do for de op(i)


