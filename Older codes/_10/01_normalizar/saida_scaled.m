clear;
%close all; 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close all figures, and then repeat the first example.

%close all;
 
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
%%set(0,'DefaultAxesUnits','normalized');
%%set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
%%set(0,'DefaultAxesPosition',[0.15 0.15 0.7 0.7]); 
 
% Object type: Text
set(0,'DefaultTextFontName','Arial');
set(0,'DefaultTextFontSize',20);
set(0,'DefaultTextInterpreter','remove')
% set(0,'DefaultTextFontName','remove');
% set(0,'DefaultTextFontSize','remove');
% set(0,'DefaultTextInterpreter','remove');
	   
map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\02_saida\fbg

%%
%%%Read data and store it in a struct
op2 = [];	
aux = 4
%%%%%%%%

if aux == 1
op2 =  rdcelpa('n_1g_10_dd_iv.elpa','*',[],op2);
end
if aux == 2
op2 =  rdcelpa('n_fbg_10_dd_iv.elpa','*',[],op2);
end
if aux == 3
op2 =  rdcelpa('n_2g_10_dd_iv.elpa','*',[],op2);
end
if aux == 4
op2 =  rdcelpa('n_1g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_10_dd_iv.elpa','*',[],op2);
end

end



%%%%%%%%%%%%%%


%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');

%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.I_d, op1.G);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

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
	
	Inorm
	
	op2(i).aux = op2(i).I_d ./ Inorm;
	%auxI(i) = op2(i).I_d ./ Inorm;
	
	%eixo x deve ser VDS/Vsup. 
	op2(i).V_d = op2(i).V_d ./ op2(i).V_g;
end


auxI = op2(1).I_d ./ Inorm;

if aux == 4
	figure
	for i=1:length(op2)
		h(i) = plot(op2(i).V_d,op2(i).aux );
		
		if i == 1 
		hold on;
		end
	end	
	
	xlabel('V_{ds} (V)')
	ylabel('I_{d}/I_{\rm max} ')
	axis([0 2 0 1.05])
	
	h(1).Color =  map(1,:);
	h(2).Color =  map(2,:);
	h(3).Color =  map(3,:);
	
	
	legend({'1G', 'FBG', '2G'}, 'Location', 'best');
	print('norm_all_scaled', '-depsc');

else
figure
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold
h(2) = plot(op2(1).V_d,auxI );
end



if aux == 1
h(1).Color =  map(1,:);
h(2).Color =  map(1,:);
h(2).LineStyle =  '--';
legend({'1G', 'normalized'}, 'Location', 'best');
print('norm_1G_scaled', '-depsc');
end
if aux == 2
h(1).Color =  map(2,:);
h(2).Color =  map(2,:);
h(2).LineStyle =  '--';
legend({'FBG', 'normalized'}, 'Location', 'best');
print('norm_FBG_scaled', '-depsc');
end
if aux == 3
h(1).Color =  map(3,:);
h(2).Color =  map(3,:);
h(2).LineStyle =  '--';
legend({'2G', 'normalized'}, 'Location', 'best');
print('norm_2G_scaled', '-depsc');
end
