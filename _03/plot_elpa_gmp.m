function [peak]=plot_elpa_gmp(op)


diferenca = [];		
transY = [];		
transX = [];		

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


diferenca.Isum = diff(op8.Isum);
diferenca.G = diff(op8.G);

%calcular transcondutancia
for k=1:length(diferenca.G) %%49
	transY(k) = abs(diferenca.Isum(k) / diferenca.G(k)) * 10^6;
	transX(k) = (op8.G(k) + op8.G(k+1))/2;
end

%transY
%b = sort(transY, 'descend')
%peak = b(1)

peak = max(transY);

% figure
% plot(transX, transY,'b');
% axis([-1.5 1.5 0 2.5*10]);
% hold on

% h=xlabel('V_{gs}(V)');
% set(h,'Interpreter','tex')
% 
% h=ylabel('g_m (\mu S)');
% set(h,'Interpreter','tex')
% 
% h=legend('g_m (\mu S)');
% set(h,'Interpreter','tex', 'Location','best')  

%ax = gca;
%ax.YTickLabel = {'0','2','4','6','8','10','12','14'};