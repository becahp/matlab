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


% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d24_10V_10V

%%
%%%Read data and store it in a struct
op2 = [];		

%%%%%%%%%

op2 =  rdcelpa('n_dir_3g_16.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_3g_16.elpa','*',[],op2);



%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
%op2(3).I_s = abs(op2(3).I_s);
%op2(4).I_s = abs(op2(4).I_s);


figure
%h(1) = semilogy(dois(:,1),dois(:,2));

h(1) = semilogy(op2(1).V_g,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-2 2 0.1E-9 0.0001])

hold;
h(2) = semilogy(op2(2).V_g,op2(2).I_s );
%h(3) = semilogy(op2(3).V_g,op2(3).I_s );
%h(4) = semilogy(op2(4).V_g,op2(4).I_s );

hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);

h(1).Color = map(1,:);
h(2).Color = map(1,:);
%h(3).Color = map(2,:);
%h(4).Color = map(2,:);


legend([h(1) h(2)],{'3G esq','3G dir'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')

