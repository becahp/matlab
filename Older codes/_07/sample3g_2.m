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
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d16_10V_10V
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\09_3g
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\03_all_bbt1_16

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d16_gate_v1
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\03_3g_d16
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\07_all_16_overlap

%%
%%%Read data and store it in a struct
op2 = [];		


%%%%%%%%%

% %	4 p_dir_3g_d24_10V_10V : comparação com diametro 2.4	
% op2 =  rdcelpa('p_dir_3g_d24_10V_10V/p_esq_3g_d24_10V_10V_dd_iv.elpa','*',[],op2);
% op2 =  rdcelpa('p_dir_3g_d24_10V_10V/p_dir_3g_d24_10V_10V_dd_iv.elpa','*',[],op2);

% %	5 p_dir_3g_d16_10V_10V : comparação com diametro 1.6
% op2 =  rdcelpa('p_dir_3g_d16_10V_10V/p_esq_3g_d16_10V_10V_dd_iv.elpa','*',[],op2);
% op2 =  rdcelpa('p_dir_3g_d16_10V_10V/p_dir_3g_d16_10V_10V_dd_iv.elpa','*',[],op2);



% %3G 2.4nm
% op2 =  rdcelpa('09_3g/p_esq_3g_100_1V_dd_iv.elpa','*',[],op2);
% op2 =  rdcelpa('09_3g/p_dir_3g_100_1V_dd_iv.elpa','*',[],op2);

% %3G 1.6nm
% op2 =  rdcelpa('03_all_bbt1_16/p_esq_3g_bbt1_d16_dd_iv.elpa','*',[],op2);
% op2 =  rdcelpa('03_all_bbt1_16/p_dir_3g_bbt1_d16_dd_iv.elpa','*',[],op2);


%	6 p_dir_3g_d16_gate_v1 : variação de gate (versão padrão)
op2 =  rdcelpa('p_dir_3g_d16_gate_v1/p_esq_3g_d16_gate_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_d16_gate_v1/p_dir_3g_d16_gate_v1_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('03_3g_d16/p_esq_3g_12V_d16_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_3g_d16/p_dir_3g_12V_d16_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('07_all_16_overlap/p_esq_3g_d16_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('07_all_16_overlap/p_dir_3g_d16_dd_iv.elpa','*',[],op2);



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
%op2(3).I_s = abs(op2(3).I_s);
%op2(4).I_s = abs(op2(4).I_s);

%antigo
op2(3).Isum = abs(op2(3).Isum);
op2(4).Isum = abs(op2(4).Isum);
op2(5).Isum = abs(op2(5).Isum);
op2(6).Isum = abs(op2(6).Isum);


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

h(3) = semilogy(op2(3).G,op2(3).Isum );
h(4) = semilogy(op2(4).G,op2(4).Isum );
h(5) = semilogy(op2(5).G,op2(5).Isum );
h(6) = semilogy(op2(6).G,op2(6).Isum );

hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);

h(5).Color = map(3,:);
h(6).Color = map(3,:);
%h(7).Color = map(4,:);
%h(8).Color = map(4,:);


%legend([h(1) h(3) h(5) h(7)],{'Dia = 2.4nm','Dia = 1.6nm', 'Dia = 2.4nm antigo','Dia = 1.6nm antigo'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')

legend([h(1) h(3) h(5)],{'3G v030','3G v020a', '3G v020a sem overlap'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')

