function plot_elpa_gm(op)

%clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close all figures, and then repeat the first example.
close all;
 
% Default settings: Default + Object type + Property
 
% Object type: Line
set(0,'DefaultLineLineWidth',2);
set(0,'DefaultLineMarkerSize',8);
 
% Object type: Axes
set(0,'DefaultAxesFontName','Arial');
set(0,'DefaultAxesFontSize',20);
set(0,'DefaultAxesLineWidth',1.5);
set(0,'DefaultAxesTickLength',[0.02 0.02]);
% set(0,'DefaultAxesUnits','inches');
% set(0,'DefaultAxesOuterPosition', [0 0 7 7]);
% set(0,'DefaultAxesPosition',[1 1 5 4]); 
set(0,'DefaultAxesUnits','normalized');
set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
set(0,'DefaultAxesPosition',[0.15 0.15 0.7 0.7]); 
 
% Object type: Text
set(0,'DefaultTextFontName','Arial');
set(0,'DefaultTextFontSize',20);
set(0,'DefaultTextInterpreter','remove')
% set(0,'DefaultTextFontName','remove');
% set(0,'DefaultTextFontSize','remove');
% set(0,'DefaultTextInterpreter','remove');
 

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

figure
plot(transX, transY,'b');
%axis([-2 2 0 12]);
%hold on

aux = 0;

if aux ~= 0
%transY
%max(transY) 
indexmax = find(max(transY) == transY);
xmax = transX(indexmax);
ymax = transY(indexmax);

txt = texlabel('gm,max2 = 11');
txt1 = texlabel('mu');
%txt = texlabel('gm,max2 = 11 mu S')

%txt = texlabel('lambda12^(3/2)/pi - pi*delta^(2/3)');
%text(3,90,txt)

strmax = [txt,txt1, 'S'];
text(xmax-0.04,ymax,strmax,'HorizontalAlignment','right');

%max 1 = 10.7434 %47
%max 2 = 6.8842 %36

xmax = transX(36);
ymax = transY(36);

txt = texlabel('gm,max1 = 6.8');
%txt1 = texlabel('mu')
strmax = [txt,txt1, 'S'];
text(xmax,ymax+0.3,strmax,'HorizontalAlignment','right');
end



%hold off;

h=xlabel('V_{gs}(V)');
set(h,'Interpreter','tex')

h=ylabel('g_m (\mu S)');
set(h,'Interpreter','tex')

% h=legend('g_m (\mu S)');
% set(h,'Interpreter','tex', 'Location','best')  

%ax = gca;
%ax.YTickLabel = {'0','2','4','6','8','10','12','14'};