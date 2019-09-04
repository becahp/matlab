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


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\fbg

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04

map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];

%%
%%%Read data and store it in a struct

op1 = [];		
op01 = [];		

%%%%%%%%%
%%1g-FET

% op01 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op01);
% op01 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op01);
% op01 = rdcelpa('n_dir_1g_meff_004_dd_iv.elpa','*',[],op01);
% op01 = rdcelpa('n_esq_1g_meff_004_dd_iv.elpa','*',[],op01);

% op1 = rdcelpa('n_esq_1g_meff_00_dd_iv.elpa','*',[],op1);
% op1 = rdcelpa('n_dir_1g_meff_00_dd_iv.elpa','*',[],op1);

op1 = rdcelpa('fbg/n_dir_fbg_meff_004_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_004_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_01_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_01_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_02_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_02_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_03_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_03_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_04_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_04_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_05_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_05_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_06_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_06_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_07_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_07_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_08_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_08_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_09_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_09_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_esq_fbg_meff_10_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('fbg/n_dir_fbg_meff_10_dd_iv.elpa','*',[],op1);


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

% op01(1).Isum = abs(op01(1).Isum);
% op01(2).Isum = abs(op01(2).Isum);
% op01(3).Isum = abs(op01(3).Isum);
% op01(4).Isum = abs(op01(4).Isum);
% semilog_elpa(op01,{{'Isum','G'}});


op1(1).Isum = abs(op1(1).Isum);
op1(2).Isum = abs(op1(2).Isum);
op1(3).Isum = abs(op1(3).Isum);
op1(4).Isum = abs(op1(4).Isum);
op1(5).Isum = abs(op1(5).Isum);
op1(6).Isum = abs(op1(6).Isum);
op1(7).Isum = abs(op1(7).Isum);
op1(8).Isum = abs(op1(8).Isum);
op1(9).Isum = abs(op1(9).Isum);
op1(10).Isum = abs(op1(10).Isum);
op1(11).Isum = abs(op1(11).Isum);
op1(12).Isum = abs(op1(12).Isum);
op1(13).Isum = abs(op1(13).Isum);
op1(14).Isum = abs(op1(14).Isum);
op1(15).Isum = abs(op1(15).Isum);
op1(16).Isum = abs(op1(16).Isum);
op1(17).Isum = abs(op1(17).Isum);
op1(18).Isum = abs(op1(18).Isum);
op1(19).Isum = abs(op1(19).Isum);
op1(20).Isum = abs(op1(20).Isum);
op1(21).Isum = abs(op1(21).Isum);
op1(22).Isum = abs(op1(22).Isum);

%semilog_elpa(op1,{{'Isum','G'}});

figure
h(1) = semilogy(op1(1).G,op1(1).Isum );

axis([-0.2 2 8E-11 0.0001])
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

ay = gca;
ay.YTick = [1e-12 1e-10 1e-8 1e-6 1e-4];

hold
h(2) = semilogy(op1(2).G,op1(2).Isum );
h(3) = semilogy(op1(3).G,op1(3).Isum );
h(4) = semilogy(op1(4).G,op1(4).Isum );
h(5) = semilogy(op1(5).G,op1(5).Isum );
h(6) = semilogy(op1(6).G,op1(6).Isum );
h(7) = semilogy(op1(7).G,op1(7).Isum );
h(8) = semilogy(op1(8).G,op1(8).Isum );
h(9) = semilogy(op1(9).G,op1(9).Isum );
h(10) = semilogy(op1(10).G,op1(10).Isum );
h(11) = semilogy(op1(11).G,op1(11).Isum );
h(12) = semilogy(op1(12).G,op1(12).Isum );
h(13) = semilogy(op1(13).G,op1(13).Isum );
h(14) = semilogy(op1(14).G,op1(14).Isum );
h(15) = semilogy(op1(15).G,op1(15).Isum );
h(16) = semilogy(op1(16).G,op1(16).Isum );
h(17) = semilogy(op1(17).G,op1(17).Isum );
h(18) = semilogy(op1(18).G,op1(18).Isum );
h(19) = semilogy(op1(19).G,op1(19).Isum );
h(20) = semilogy(op1(20).G,op1(20).Isum );
h(21) = semilogy(op1(21).G,op1(21).Isum );
h(22) = semilogy(op1(22).G,op1(22).Isum );

%map(1,:);

h(1).Color  = 'r';
h(2).Color  = 'r';
h(3).Color  = [1    0.6  0 ]; %orange
h(4).Color  = [1    0.6  0 ]; %orange
h(5).Color  = 'y';
h(6).Color  = 'y';
h(7).Color  = 'g';
h(8).Color  = 'g';
h(9).Color  = 'c';
h(10).Color = 'c';
h(11).Color = 'b';
h(12).Color = 'b';
h(13).Color = [0.5  0    0.9 ]; %purple
h(14).Color = [0.5  0    0.9 ]; %purple
h(15).Color = 'm';
h(16).Color = 'm';
h(17).Color = 'k'; %'g';
h(18).Color = 'k'; %'g';
h(19).Color = map(2,:);
h(20).Color = map(2,:);
h(21).Color = map(4,:);
h(22).Color = map(4,:);


%legend([h(1) h(3) h(5) h(7) h(9) h(11) h(13) h(15) h(17) h(19) h(21)],...
%    {'0.04','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'},'Location', 'northwest'); 
%print('meff_1g', '-depsc')

%%acrescentar SS

%para meff = 0.04
op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_004_dd_iv.elpa','*',[],op7);

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op = meu_merge(op7);

%%60mV/dec curve
% I0 = 8.64549235600000e-09;
% %Id = I0 * exp(Vgs/0.026);
% Id = I0 * exp(op.G ./0.026);

% h(23) = semilogy(op.G + 0.1,Id );      
% h(23).Color = 'k';
% h(23).LineStyle = '--';

% annotation('textbox','String','SS = 60mV/dec','Interpreter','tex',...
    % 'FontSize', 20, 'LineStyle', 'none', 'Position', [0.35 0.72 0.149 0.07037]...
    % ,'FitBoxToText','on');

%saber onde é o meio da curva
%op.G(30)
zero = 30;
aux = 5; %7
aux2 = 1; %4

for i=1:aux
	%x(i) = op7(1).G(aux2+i);
    %y(i) = op7(1).Isum(aux2+i);
    
    x(i) = op.G(zero+aux2+i);
    y(i) = op.Isum(zero+aux2+i);
end
    

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%%%%%%%%%%%%%5%retorna o sub slope
ss = round((1/p(1) * 10^3),0);

%f1 = polyval(p, x);
fit = power(10,polyval(p, x));
%fit = power(10,polyval(p, x));

%figure
%semilogy(x,y,'r');
%hold on
x = x -0.1;
plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

var = round((1/p(1) * 10^3),0);

str = num2str(abs(var));
s = strcat('S=',str, ' mV/dec');

%para meff = 1.0
op7 = [];
op7 = rdcelpa('fbg/n_esq_fbg_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_10_dd_iv.elpa','*',[],op7);

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op = meu_merge(op7);

%saber onde é o meio da curva
%op.G(30)
zero = 30;
aux = 12; %7
aux2 = 2; %4

for i=1:aux
	%x(i) = op7(1).G(aux2+i);
    %y(i) = op7(1).Isum(aux2+i);
    
    x(i) = op.G(zero+aux2+i);
    y(i) = op.Isum(zero+aux2+i);
end
    

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%%%%%%%%%%%%%5%retorna o sub slope
ss = round((1/p(1) * 10^3),0);

%f1 = polyval(p, x);
fit = power(10,polyval(p, x));
%fit = power(10,polyval(p, x));

%figure
%%semilogy(x,y,'r');
%hold on
x = x + 0.1;
plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

var = round((1/p(1) * 10^3),0);

str = num2str(abs(var));
s1 = strcat('S=',str, ' mV/dec');

annotation('textbox','String',s,...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.16 0.58 0.065 0.066],...
    'FitBoxToText','on');

annotation('textbox','String',s1,...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.45 0.22 0.065 0.066],...
    'FitBoxToText','on');
	
								%[x_begin y_begin dx dy].
annotation('arrow', 'Position', [0.7 0.8 0.1 -0.3]);

annotation('textbox','String','m_{eff}',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.65 0.82 0.065 0.066],...
    'FitBoxToText','on');

hold off;

print('Fig_10b', '-depsc');