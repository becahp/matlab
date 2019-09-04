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
	   
map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\01_dia
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\02_dia

%%
%%%Read data and store it in a struct
op2 = [];		


%%%%%%%%%

op2 =  rdcelpa('01_dia/p_esq_artigo_v2_bbt1_d24_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02_dia/p_dir_artigo_bbt1_d24_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_dia/p_esq_artigo_v2_bbt1_d22_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02_dia/p_dir_artigo_bbt1_d22_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_dia/p_esq_artigo_v2_bbt1_d20_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02_dia/p_dir_artigo_bbt1_d20_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_dia/p_esq_artigo_v2_bbt1_d18_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02_dia/p_dir_artigo_bbt1_d18_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_esq_artigo_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_artigo_v2_dd_iv.elpa','*',[],op2);



dois = csvread('terceiro.csv');
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


op2(1).Isum = abs(op2(1).Isum);
op2(2).Isum = abs(op2(2).Isum);
op2(3).Isum = abs(op2(3).Isum);
op2(4).Isum = abs(op2(4).Isum);
op2(5).Isum = abs(op2(5).Isum);
op2(6).Isum = abs(op2(6).Isum);
op2(7).Isum = abs(op2(7).Isum);
op2(8).Isum = abs(op2(8).Isum);

op2(9).Isum = abs(op2(9).Isum);
op2(10).Isum = abs(op2(10).Isum);

op2(10).Isum(23) = NaN; %end -1 

% op2(1).G = op2(1).G - 0.25;
% op2(2).G = op2(2).G - 0.25;
% op2(3).G = op2(3).G - 0.25;
% op2(4).G = op2(4).G - 0.25;
% op2(5).G = op2(5).G - 0.25;
% op2(6).G = op2(6).G - 0.25;
% op2(7).G = op2(7).G - 0.25;
% op2(8).G = op2(8).G - 0.25;


figure
h(1) = semilogy(dois(:,1),dois(:,2));
%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-1.5 1 0.1E-11 0.0001])

hold;
h(2) = semilogy(op2(1).G,op2(1).Isum );
h(3) = semilogy(op2(2).G,op2(2).Isum );
h(4) = semilogy(op2(3).G,op2(3).Isum );
h(5) = semilogy(op2(4).G,op2(4).Isum );
h(6) = semilogy(op2(5).G,op2(5).Isum );
h(7) = semilogy(op2(6).G,op2(6).Isum );
h(8) = semilogy(op2(7).G,op2(7).Isum );
h(9) = semilogy(op2(8).G,op2(8).Isum );

h(10) = semilogy(op2(9).G,op2(9).Isum );
h(11) = semilogy(op2(10).G,op2(10).Isum );

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(2,:);
h(4).Color = map(3,:);
h(5).Color = map(3,:);
h(6).Color = map(4,:);
h(7).Color = map(4,:);
h(8).Color = map(5,:);
h(9).Color = map(5,:);

h(10).Color = map(6,:);
h(11).Color = map(6,:);

%h(4).LineStyle = '--';
%h(5).LineStyle = '--';

%legend([h(1) h(2) h(4) h(6) h(8)],{'Primeira curva do artigo','Dia = 2.4nm','Dia = 2.2nm','Dia = 2.0nm','Dia = 1.8nm'}, 'Location', 'best');  % Only the blue and green lines appear in the legend

legend([h(1) h(2) h(4) h(6) h(8) h(10)],{'Experimental','Diameter = 2.4nm','Diameter = 2.2nm','Diameter = 2.0nm','Diameter = 1.8nm', 'Diameter = 2.4nm, bbt = 0'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')

%legend([h(1) h(2) h(4) h(6) h(8)],{'Segunda curva do artigo','Gate = 390nm, dia = 2.4nm','Gate = 390nm, dia = 2.2nm','Gate = 390nm, dia = 2.0nm','Gate = 390nm, dia = 1.8nm'}, 'Location', 'best');  % Only the blue and green lines appear in the legend

%legend([h(1) h(2) h(4)],{'Segunda curva do artigo','Gate = 382nm, bbt = 1','Gate = 390nm, bbt = 1'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend({'Artigo','Simulado'},'Location','south')
