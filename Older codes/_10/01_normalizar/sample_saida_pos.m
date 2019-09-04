clear;
close all; 
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



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\04_escaladas\02_saida\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\04_escaladas\02_saida\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\04_escaladas\02_saida\fbg

%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 3
%%%%%%%%
for aux=1:3
op2 = [];
if aux == 1 
op2 =  rdcelpa('n_1g_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_1g_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_1g_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_1g_16_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_1g_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_1g_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_1g_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_1g_16_dd_iv.elpa','*',[],op2);
end

if aux == 2 
op2 =  rdcelpa('n_fbg_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_16_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_fbg_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fbg_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fbg_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fbg_16_dd_iv.elpa','*',[],op2);
end

if aux == 3
op2 =  rdcelpa('n_2g_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_16_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_2g_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_16_dd_iv.elpa','*',[],op2);
end


%%%%%%%%%%%%%%


%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');

%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.Isum, op1.G);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


%op2(1).I_d = op2(1).I_d * 1e6;
%op2(2).I_d = op2(2).I_d * 1e6;
%op2(3).I_d = op2(3).I_d * 1e6;
%op2(4).I_d = op2(4).I_d * 1e6;
%op2(5).I_d = op2(5).I_d * 1e6;
%op2(6).I_d = op2(6).I_d * 1e6;
%op2(7).I_d = op2(7).I_d * 1e6;
%op2(8).I_d = op2(8).I_d * 1e6;

for i=1:8
op2(i).I_d = op2(i).I_d * 1e6;

elp.mat=[op2(i).V_d,op2(i).I_d];
elp.var_names={'V_d','I_d'};

if aux == 1 %8a
		str = strcat('Fig8a_d', num2str(i));
	else if aux == 2 %8c
		str = strcat('Fig8b_d', num2str(i));
	else if aux == 3 %8c
		str = strcat('Fig8c_d', num2str(i));
	end
	
	end
end

elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)

end %for i
end %for aux

pule = 0;
if pule == 1
op2 = [];
op2 =  rdcelpa('n_2g_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_16_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_2g_04_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_08_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_12_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_16_dd_iv.elpa','*',[],op2);



for i=1:8
op2(i).I_d = op2(i).I_d * 1e6;

elp.mat=[op2(i).V_d,op2(i).I_d];
elp.var_names={'V_d','I_d'};
str = strcat('Fig8c_d', num2str(i));

elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)

end % 
end