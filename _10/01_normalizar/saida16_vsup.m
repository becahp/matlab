clear;
 
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
op6 =  rdcelpa('1g/n_1g_vgs_2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('fbg/n_fbg_vgs_2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('2g/n_2g_2V_vgs_2_dd_iv.elpa','*',[],op6);
%op6 =  rdcelpa('n_3g_06V_dd_iv.elpa','*',[],op6);

op2 =  rdcelpa('n_3g_12V_dd_iv.elpa','*',[],op2);

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
op6(i).Isum
	op6(i).aux = op6(i).Isum ./ Inorm;
	
	%eixo x deve ser VDS/Vsup. 
	op6(i).D = op6(i).D ./ 2;
end
auxI = op6(1).Isum ./ Inorm;

Inorm = op2(1).I_d(12);

i = 1;
op2(i).I_d
op2(i).aux = op2(i).I_d ./ Inorm;
op2(i).V_d = op2(i).V_d ./ 1.2;

if aux == 5
	figure
	for i=1:3
		h(i) = plot(op6(i).D,op6(i).aux );
		
		if i == 1 
		hold on;
		end
	end	
	i = 1
	h(4) = plot(op2(i).V_d,op2(i).aux );
	
	xlabel('V_{ds}/V_{sup} (V)')
	ylabel('I_{d}/I_{\rm on} ')
	axis([0 1 0 1.05])
	
	h(1).Color =  map(1,:);
	h(2).Color =  map(2,:);
	h(3).Color =  map(3,:);
	h(4).Color =  map(4,:);
	
	legend({'1G', 'FBG', '2G', '3G'}, 'Location', 'best');
	%print('norm_all', '-depsc');

else
figure
h(1) = plot(op6(1).D,op6(1).Isum );
hold
h(2) = plot(op6(1).D,auxI );
end


for i=1:3
elp.mat=[op6(i).D,op6(i).aux];
elp.var_names={'D','Isum'};
str = strcat('Fig8vsup_d', num2str(i));
elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)
end

i = 1;
elp.mat=[op2(i).V_d,op2(i).aux];
elp.var_names={'V_d','I_s'};
elp.title='Fig8vsup_d4';
save_elpa(['Data/',elp.title,'.elpa'],elp)
