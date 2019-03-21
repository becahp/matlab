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
%variacao spacer
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d16_gate_v2
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d16_gate_v3


%%
%%%Read data and store it in a struct
op2 = [];		

aux = 3
%%%%%%%%%
 
if aux == 3
op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_d16_gate_v2/n_esq_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d16_gate_v2/n_dir_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_d16_gate_v3/n_esq_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d16_gate_v3/n_dir_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
end


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


op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);

if aux == 3
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
end


figure
%h(1) = semilogy(dois(:,1),dois(:,2));

h(1) = semilogy(op2(1).V_g,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-2 2 0.1E-16 0.0001])

hold;
h(2) = semilogy(op2(2).V_g,op2(2).I_s );
h(3) = semilogy(op2(3).V_g,op2(3).I_s );

if aux ==3 || aux == 4
h(4) = semilogy(op2(4).V_g,op2(4).I_s );
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );
end


hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);

if aux == 3
h(1).Color = 'k';
h(2).Color = 'k';
h(3).Color = map(1,:);
h(4).Color = map(1,:);
h(5).Color = map(2,:);
h(6).Color = map(2,:);
end


%legend([h(1) h(3) h(4)],{'VDS = 1.0V','VDS = 1.2V', 'VDS = 1.4V'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend

if aux == 3

annotation('textbox','String','d_p',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.27 0.33 0.065 0.066],...
    'FitBoxToText','on');
	
annotation('arrow', 'Position', [0.3 0.8 0 -0.4]);


legend([h(1) h(3) h(5)],{'d_p = 100nm','d_p = 50nm','d_p = 25nm'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend
legend('boxoff')

print('new\Fig5a', '-depsc');
end