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
	
%variacao tensao de programacao
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_10V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_14V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_18V



%%
%%%Read data and store it in a struct
op2 = [];		

aux = 2
%%%%%%%%%
 


if aux == 2
op2 =  rdcelpa('n_3g_d16_program_10V/n_3g_d16_program_10V_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_3g_d16_program_14V/n_3g_d16_program_14V_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_3g_d16_program_18V/n_3g_d16_program_18V_dd_iv.elpa','*',[],op2);

end



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
h(4) = semilogy(op2(5).V_g,op2(5).I_s );
end

hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);


if aux == 2
h(1).Color = map(1,:);
h(2).Color = 'k';
h(3).Color = 'k';

h(4).Color = map(2,:);
%h(5).Color = map(4,:);
%h(6).Color = map(5,:);
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