%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\06%1g saida
clear;

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\15

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\05_saida\1g

 
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

map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];

op6 = [];		


% op6 =  rdcelpa('15/n_1g_vgs_05_dd_iv.elpa','*',[],op6);%10/
% op6 =  rdcelpa('15/n_1g_vgs_1_dd_iv.elpa','*',[],op6);
% op6 =  rdcelpa('15/n_1g_vgs_15_dd_iv.elpa','*',[],op6);
% op6 =  rdcelpa('15/n_1g_vgs_2_dd_iv.elpa','*',[],op6);

% op6 =  rdcelpa('15/p_1g_vgs_05_dd_iv.elpa','*',[],op6);
% op6 =  rdcelpa('15/p_1g_vgs_1_dd_iv.elpa','*',[],op6);
% op6 =  rdcelpa('15/p_1g_vgs_15_dd_iv.elpa','*',[],op6);
% op6 =  rdcelpa('15/p_1g_vgs_2_dd_iv.elpa','*',[],op6);

%%bbt1
op6 =  rdcelpa('n_1g_vgs_05_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('n_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('n_1g_vgs_15_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('n_1g_vgs_2_dd_iv.elpa','*',[],op6);

op6 =  rdcelpa('p_1g_vgs_05_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('p_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('p_1g_vgs_15_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('p_1g_vgs_2_dd_iv.elpa','*',[],op6);

op6(1).Isum = op6(1).Isum * 1e6;
op6(2).Isum = op6(2).Isum * 1e6;
op6(3).Isum = op6(3).Isum * 1e6;
op6(4).Isum = op6(4).Isum * 1e6;
op6(5).Isum = op6(5).Isum * 1e6;
op6(6).Isum = op6(6).Isum * 1e6;
op6(7).Isum = op6(7).Isum * 1e6;
op6(8).Isum = op6(8).Isum * 1e6;


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


%plot_elpa_vds(op5,{{'Isum','D'}});

%plot_elpa_vds(op6,{{'Isum','D'}});

%%
%%%Save selected data for further postprocessing (e.g. visualization with 
%%%another program 

%elp.title='';
%elp.var_names={'G','Isum','Isum','Isum'};
%elp.mat=[op(1).G,op(1).Isum,op(2).Isum,op(3).Isum];
%save_elpa('test_current.elpa',elp);

%elp.title='';
%elp.var_names={'D','Isum'};
%elp.mat=[op3(1).G1,op3(1).Isum];
%save_elpa('test_current.elpa',elp);


figure
h(1) = plot(op6(1).D, op6(1).Isum);

%axis([-2 2 -15 15]) %bbt 0
axis([-2 2 -30 30]) %bbt 1
xhandle = xlabel('Drain voltage (V)');
yhandle = ylabel('I_{ds} (\muA)');

%set(xhandle,'Fontname','Timesnewroman')
%set(yhandle,'Fontname','Timesnewroman')

grid on
hold on

h(2) = plot(op6(2).D, op6(2).Isum);
h(3) = plot(op6(3).D, op6(3).Isum);
h(4) = plot(op6(4).D, op6(4).Isum);
h(5) = plot(op6(5).D, op6(5).Isum);
h(6) = plot(op6(6).D, op6(6).Isum);
h(7) = plot(op6(7).D, op6(7).Isum);
h(8) = plot(op6(8).D, op6(8).Isum);

h(1).Color =  map(1,:);
h(2).Color =  map(1,:);
h(3).Color =  map(1,:);
h(4).Color =  map(1,:);

h(5).Color =  map(2,:);
h(6).Color =  map(2,:);
h(7).Color =  map(2,:);
h(8).Color =  map(2,:);


% h(5).LineStyle = '--';
% h(6).LineStyle = '--';
% h(7).LineStyle = '--';
% h(8).LineStyle = '--';

% annotation('textbox','String','V_{GS} = -0.5','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.16 0.45 0.156 0.07037] ,'FitBoxToText','on');

% annotation('textbox','String','V_{GS} = -1.0','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.16 0.36 0.156 0.07037] ,'FitBoxToText','on');

% annotation('textbox','String','V_{GS} = -1.5','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.16 0.28 0.156 0.07037] ,'FitBoxToText','on');

% annotation('textbox','String','V_{GS} = -2.0','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.16 0.17 0.156 0.07037] ,'FitBoxToText','on');


% annotation('textbox','String','V_{GS} = 0.5','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.71 0.47 0.169 0.07037] ,'FitBoxToText','on');

% annotation('textbox','String','V_{GS} = 1.0','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.71 0.55 0.169 0.07037] ,'FitBoxToText','on');

% annotation('textbox','String','V_{GS} = 1.5','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.71 0.64 0.169 0.07037] ,'FitBoxToText','on');

% annotation('textbox','String','V_{GS} = 2.0','Interpreter','tex','FontSize', 14, 'LineStyle', 'none', 'Position', [0.71 0.75 0.169 0.07037] ,'FitBoxToText','on');

figure
h(1) = plot(op6(1).D, op6(1).Isum);

%axis([-2 2 -15 15]) %bbt 0
%axis([-2 2 -30 30]) %bbt 1
%xhandle = xlabel('Drain voltage (V)');
%yhandle = ylabel('I_{ds} (\muA)');
hold;

h(2) = semilogy(op6(3).D, op6(3).Isum);

figure
ax = plotyy(op6(1).D, op6(1).Isum, op6(1).D, op6(1).Isum, @plot, @semilogy);
xlabel ("X");
ylabel (ax(1), "Axis 1");
ylabel (ax(2), "Axis 2");
