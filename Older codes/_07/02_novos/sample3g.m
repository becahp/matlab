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

%variacao dreno
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_dreno_10V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_dreno_12V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_dreno_14V
%variacao tensao de programacao
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_10V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16 %tensao 1.2V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_14V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_16V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_18V
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_20V
%variacao spacer
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d16_gate_v2
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d16_gate_v3
%variacao diametro
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d24
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d11
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d11_v1
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d11_v2
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_dir_3g_d11_v3
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_esq_3g_d11



%%
%%%Read data and store it in a struct
op2 = [];		

aux = 2
%%%%%%%%%
 
if aux == 1
op2 =  rdcelpa('n_3g_d16_dreno_10V/n_3g_d16_dreno_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_3g_d16_dreno_12V/n_3g_d16_dreno_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_3g_d16_dreno_14V/n_3g_d16_dreno_14V_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 =  rdcelpa('n_3g_d16_program_10V/n_3g_d16_program_10V_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_3g_d16_program_14V/n_3g_d16_program_14V_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_3g_d16_program_16V/n_3g_d16_program_16V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_3g_d16_program_18V/n_3g_d16_program_18V_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('n_3g_d16_program_20V/n_3g_d16_program_20V_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_3g_d16_program_20V_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_dir_3g_d16_program_20V_dd_iv.elpa','*',[],op2);


end

if aux == 3
op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_d16_gate_v2/n_esq_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d16_gate_v2/n_dir_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_d16_gate_v3/n_esq_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d16_gate_v3/n_dir_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
end


if aux == 4
op2 =  rdcelpa('n_dir_3g_d24/n_esq_3g_d24_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_d24/n_dir_3g_d24_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_esq_3g_d11/n_esq_3g_d11_dd_iv.elpa','*',[],op2); %correto
%op2 =  rdcelpa('n_dir_3g_d11/n_dir_3g_d11_dd_iv.elpa','*',[],op2); %de 0 ate 0.25

%op2 =  rdcelpa('n_esq_3g_d11_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('old_n_dir_3g_d11_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('n_dir_3g_d11_v4/n_dir_3g_d11_v4_dd_iv.elpa','*',[],op2); %0 a 0.35

op2 =  rdcelpa('n_dir_3g_d11_v1/n_dir_3g_d11_v1_dd_iv.elpa','*',[],op2); %0.35 a 0.8
op2 =  rdcelpa('n_dir_3g_d11_v2/n_dir_3g_d11_v2_dd_iv.elpa','*',[],op2); %0.55 a 1
op2 =  rdcelpa('n_dir_3g_d11_v3/n_dir_3g_d11_v3_dd_iv.elpa','*',[],op2); %1 a 2

op2 =  rdcelpa('n_dir_3g_d11_v4_dd_iv.elpa','*',[],op2);
op2(9).I_s(77) = NaN;
op2(9).I_s(76) = NaN;
op2(9).I_s(78) = NaN;
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

if aux == 2
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
end

if aux == 3
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
end

if aux == 4
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);

op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);
op2(9).I_s = abs(op2(9).I_s);
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

if aux == 2
%h(4) = semilogy(op2(6).V_g,op2(6).I_s );
h(4) = semilogy(op2(5).V_g,op2(5).I_s );
end

if aux ==3 || aux == 4
h(4) = semilogy(op2(4).V_g,op2(4).I_s );
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );
end

if aux == 4
h(7) = semilogy(op2(7).V_g,op2(7).I_s );
h(8) = semilogy(op2(8).V_g,op2(8).I_s );
h(9) = semilogy(op2(9).V_g,op2(9).I_s );
end


hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);
if aux == 1
h(1).Color = 'k';
h(2).Color = map(1,:);
h(3).Color = map(2,:);
end

if aux == 2
h(1).Color = map(1,:);
h(2).Color = 'k';
h(3).Color = 'k';

h(4).Color = map(2,:);
%h(5).Color = map(4,:);
%h(6).Color = map(5,:);
end

if aux == 3
h(1).Color = 'k';
h(2).Color = 'k';
h(3).Color = map(1,:);
h(4).Color = map(1,:);
h(5).Color = map(2,:);
h(6).Color = map(2,:);
end

if aux == 4
h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = 'k';
h(4).Color = 'k';
h(5).Color = map(2,:);
h(6).Color = map(2,:);
h(7).Color = map(2,:);
h(8).Color = map(2,:);
h(9).Color = map(2,:);
end

%legend([h(1) h(3) h(4)],{'VDS = 1.0V','VDS = 1.2V', 'VDS = 1.4V'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend
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

if aux == 2
%legend([h(1) h(2) h(4) h(5) h(6)],{'V_{\rm pgd,pgs} = 1.0V','V_{\rm pgd,pgs} = 1.2V','V_{\rm pgd,pgs} = 1.4V','V_{\rm pgd,pgs} = 1.6V','V_{\rm pgd,pgs} = 1.8V'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend

annotation('textbox','String','V_{pgs}',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.38 0.70 0.065 0.066],...
    'FitBoxToText','on');

%azul para preto
annotation('arrow', 'Position', [0.43 0.575 0 -0.09]);

annotation('arrow', 'Position', [0.4 0.43 0 0.24]);


%CreateCurvedArrow3(0.3e-10*[1 0 0], 0.3e-10*[0 1 0]);


legend([h(1) h(2) h(4)],{'V_{\rm pgs} = V_{\rm pgd} = 1.0V','V_{\rm pgs} = V_{\rm pgd} = 1.2V','V_{\rm pgs} = V_{\rm pgd} = 1.8V'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend
legend('boxoff')

print('new\Fig5c', '-depsc');
end

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

if aux == 4

annotation('textbox','String','E_{gap}',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.31 0.33 0.065 0.066],...
    'FitBoxToText','on');
	
annotation('arrow', 'Position', [0.3 0.76 0 -0.59]);

legend([h(1) h(3) h(5)],{'E_{\rm gap} = 0.36eV','E_{\rm gap} = 0.54eV','E_{\rm gap} = 0.78eV'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend
legend('boxoff')

print('new\Fig5b', '-depsc');
end
