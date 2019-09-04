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
aux = 1
%%%%%%%%

if aux == 1 
op2 =  rdcelpa('n_1g_05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_1g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_1g_15_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_1g_20_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_1g_05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_1g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_1g_15_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_1g_20_dd_iv.elpa','*',[],op2);
end

if aux == 2 
op2 =  rdcelpa('n_fbg_05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_15_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_fbg_20_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_fbg_05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fbg_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fbg_15_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fbg_20_dd_iv.elpa','*',[],op2);
end

if aux == 3
op2 =  rdcelpa('n_2g_05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_15_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_2g_20_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_2g_05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_15_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_2g_20_dd_iv.elpa','*',[],op2);
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


op2(1).I_d = op2(1).I_d * 1e6;
op2(2).I_d = op2(2).I_d * 1e6;
op2(3).I_d = op2(3).I_d * 1e6;
op2(4).I_d = op2(4).I_d * 1e6;
op2(5).I_d = op2(5).I_d * 1e6;
op2(6).I_d = op2(6).I_d * 1e6;
op2(7).I_d = op2(7).I_d * 1e6;
op2(8).I_d = op2(8).I_d * 1e6;


figure
h(1) = plot(op2(1).V_d,op2(1).I_d );
%axis([-1.2 1.2 -4 4])
xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')
grid on
hold;
h(2) = plot(op2(2).V_d,op2(2).I_d );
h(3) = plot(op2(3).V_d,op2(3).I_d );
h(4) = plot(op2(4).V_d,op2(4).I_d );
h(5) = plot(op2(5).V_d,op2(5).I_d );      
h(6) = plot(op2(6).V_d,op2(6).I_d );      
h(7) = plot(op2(7).V_d,op2(7).I_d );      
h(8) = plot(op2(8).V_d,op2(8).I_d );

hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(1,:);
h(4).Color = map(1,:);
h(5).Color =  map(2,:);
h(6).Color =  map(2,:);
h(7).Color =  map(2,:);
h(8).Color =  map(2,:);
