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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16 %tensao 1.2V
%variacao dreno
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_dreno_10V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_dreno_12V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_dreno_14V


%%
%%%Read data and store it in a struct
op2 = [];		

aux = 1
%%%%%%%%%
 
if aux == 1
op2 =  rdcelpa('n_3g_d16_dreno_10V/n_3g_d16_dreno_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_3g_d16_dreno_12V/n_3g_d16_dreno_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_3g_d16_dreno_14V/n_3g_d16_dreno_14V_dd_iv.elpa','*',[],op2);
end

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);


figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-2 2 0.1E-16 0.0001])

hold;
h(2) = semilogy(op2(2).V_g,op2(2).I_s );
h(3) = semilogy(op2(3).V_g,op2(3).I_s );

hold off;

if aux == 1
h(1).Color = 'k';
h(2).Color = map(1,:);
h(3).Color = map(2,:);
end

if aux == 1

annotation('textbox','String','V_D',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.27 0.35 0.065 0.066],...
    'FitBoxToText','on');
	
annotation('arrow', 'Position', [0.3 0.42 0 0.3]);

legend({'V_d = 1.0V','V_d = 1.2V', 'V_d = 1.4V'},'Location', 'southeast');
legend('boxoff')

print('new\Fig5d', '-depsc');
end
