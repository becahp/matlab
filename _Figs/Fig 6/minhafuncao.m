function [G, S, D]=minhafuncao(fl)

str = 'aaaaaaaaaaaaaaaaaa';
a = 4; %%espaço para "G = "
n = 17; %tamanho do número em chars

for k = 1:length(fl)
	if fl(k) == 'G'
		for i=1:n
			str(i) = fl((k+a)+i);
		end
		G = sscanf(str,'%f');
	end

	if fl(k) == 'S'
		for i=1:n
			str(i) = fl((k+a)+i);
		end
		S = sscanf(str,'%f');
	end
	
	if fl(k) == 'D'
		for i=1:n
			str(i) = fl((k+a)+i);
		end
		D = sscanf(str,'%f');
	end
end