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



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\00_dia16

%%
%%%Read data and store it in a struct
%op2 = [];	

%%%%%%%%%

%if aux == 1 %	1 p_dir_artigo_d18_b102	: versão para novo coos
op2 = [];	
%op2 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_1g_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(1).x,op(1).y] = plot_elpa_gm_v30(op2,'n');
%op(1).y = smooth(op(1).y);

op2 = [];	
%op2 =  rdcelpa('n_esq_fbg_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_fbg_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 

[op(2).x,op(2).y] = plot_elpa_gm_v30(op2,'n');

op2 = [];	
%op2 =  rdcelpa('n_esq_2g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 

[op(3).x,op(3).y] = plot_elpa_gm_v30(op2,'n');

op2 = [];	
%op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 

[op(4).x,op(4).y] =plot_elpa_gm_v30(op2,'n');


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


figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op(1).x,op(1).y);

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('g_m (\muS)')
%axis([-0.5 2 0 1.2*10]);
axis([0 1.5 0 10]);

hold
h(2) = plot(op(2).x,op(2).y);
h(3) = plot(op(3).x,op(3).y);
h(4) = plot(op(4).x,op(4).y);

hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(2,:);
h(3).Color  = map(3,:);
h(4).Color  = map(4,:);

legend({'1G','FBG','2G','3G'},'Location', 'northwest'); 
legend('boxoff');

print('Fig7b_novos', '-depsc')

