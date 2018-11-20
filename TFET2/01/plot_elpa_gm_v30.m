function [transX,transY] = plot_elpa_gm(op,tipo)

%op8 = [];
diferenca = [];		
transY = [];		
transX = [];		

%op8 = [];		%
file_id = 1:size(op,2);

aux = 1; 	%variavel de indice do vetor op8

for i=1:length(file_id) %roda quantos arquivos entraram

	if (i == 1)
		jaux = length(op(i).I_d) + 1;
	
		for j=1:length(op(i).I_d) %roda o tamanho total de correntes
			op8.I_d(aux) = op(i).I_d(jaux - j);
			op8.V_g(aux) = op(i).V_g(jaux - j);
			
			aux = aux +1;
		end
	end	
	
	if (i == 2)
		for j=1:length(op(i).I_d) %roda o tamanho total de correntes
			
			if (op(i).V_g(j) == 0)
				continue;
			end
		
			op8.I_d(aux) = op(i).I_d(j);
			op8.V_g(aux) = op(i).V_g(j);
		
			aux = aux +1;
		end %fim do for de op(i).V_g(j)
	end
end %fim do for de op(i)


diferenca.I_d = diff(op8.I_d);
diferenca.V_g = diff(op8.V_g);

%calcular transcondutancia
for k=1:length(diferenca.V_g) %%49
	transY(k) = abs(diferenca.I_d(k) / diferenca.V_g(k)) * 10^6;
	transX(k) = (op8.V_g(k) + op8.V_g(k+1))/2;
end

 %max(transY)
 %max(transX)

% if (tipo == 'n') 
    % figure
    % plot(transX, transY,'b');
	% axis([-1.5 1.5 0 2.5*10]);
	%hold on
% else
    % figure
	% plot(transX, transY,'r');
	%%axis([-2 0 0 14*10^-6]);
% end

%hold off;

% h=xlabel('V_{gs}(V)');
% set(h,'Interpreter','tex')

% h=ylabel('g_m (\mu S)');
% set(h,'Interpreter','tex')

% h=legend('g_m (\mu S)');
% set(h,'Interpreter','tex', 'Location','best')  

%ax = gca;
%ax.YTickLabel = {'0','2','4','6','8','10','12','14'};