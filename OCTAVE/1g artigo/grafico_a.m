addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02 %1g

%clear all
%close all
%clc

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
 

op7 = [];

%op7 =  rdcelpa('s/p_esq_3g_fet_semmod_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('s/p_dir_3g_fet_semmod_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('s/n_esq_3g_fet_semmod_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('s/n_dir_3g_fet_semmod_dd_iv.elpa','*',[],op7);

[op7] =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op7);
[op7] =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op7);
[op7] =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
[op7] =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);
%semilog_elpa(op7,{{'Isum','G'}});


figure
%h(19) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op7(1).G,op7(1).Isum );
%set(h,'linewidth',2)
hold
h(2) = semilogy(op7(2).G,op7(2).Isum );
h(3) = semilogy(op7(3).G,op7(3).Isum );
h(4) = semilogy(op7(4).G,op7(4).Isum );      

%axis([-1.5 1.5 0.1E-11 0.0001])

%%artigo
axis([-1.5 1.5 6E-9 0.00001])
%axis([-2 2 1E-10 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

%yticks

%hold off;

% h(1).Color = 'r';
% h(2).Color = 'r';
% h(3).Color = 'b';
% h(4).Color = 'b';

%%artigo
h(1).Color = [0 0.5 0];
h(2).Color = [0 0.5 0]';
h(3).Color = [0 0 1];
h(4).Color = [0 0 1];

h(1).LineStyle = '--';
h(2).LineStyle = '--';

%%artigo
 legend([h(3) h(1)],...
     {'n-type','p-type'},...
 	'Location', 'best');

%print('2g_transfer_n_p', '-depsc')

%%60mV/dec curve
I0 = 8.64549235600000e-09;
%Id = I0 * exp(Vgs/0.026);
Id = I0 * exp(op7(2).G ./0.026);

h(5) = semilogy(op7(2).G,Id );      
h(5).Color = 'k';
h(5).LineStyle = '--';

annotation('textbox','String','SS = 60mV/dec','Interpreter','tex',...
    'FontSize', 14, 'LineStyle', 'none', 'Position', [0.35 0.72 0.149 0.07037]...
    ,'FitBoxToText','on');

