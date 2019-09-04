clear;
 
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


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\08_nGate


%%
%%%Read data and store it in a struct
op2 = [];		

aux = 1

%%%%%%%%%
if aux == 1
op2 =  rdcelpa('08_nGate/p_esq_fet_dreno_bbt1_d18_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('08_nGate/p_dir_fet_dreno_bbt1_d18_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('08_nGate/p_esq_fet_dreno_bbt1_d18_01_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('08_nGate/p_dir_fet_dreno_bbt1_d18_01_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 =  rdcelpa('08_nGate/p_esq_fet_dreno_bbt1_d18_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('08_nGate/p_dir_fet_dreno_bbt1_d18_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('08_nGate/p_esq_fet_dreno_bbt0_d18_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('08_nGate/p_dir_fet_dreno_bbt0_d18_dd_iv.elpa','*',[],op2);
end


dois = csvread('segundacurva2.csv');
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

op2(1).G = op2(1).G - 0.25;
op2(2).G = op2(2).G - 0.25;
op2(3).G = op2(3).G - 0.25;
op2(4).G = op2(4).G - 0.25;


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

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

% h(2).Color = map(3,:);
% h(3).Color = map(3,:);
% h(4).Color = map(4,:);
% h(5).Color = map(4,:);
% h(6).Color = map(5,:);
% h(7).Color = map(5,:);
% h(8).Color = 'y';
% h(9).Color = 'y';

h(2).Color = map(2,:);
h(3).Color = map(2,:);
h(4).Color = map(3,:);
h(5).Color = map(3,:);
% h(6).Color = map(4,:);
% h(7).Color = map(4,:);
% h(8).Color = map(5,:);
% h(9).Color = map(5,:);

if aux == 1
legend([h(1) h(2) h(4)],{'Experimental','Diameter = 1.8nm','Diameter = 1.8nm, m_{eff} = 0.1'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')
end

if aux == 2
legend([h(1) h(2) h(4)],{'Experimental','Diameter = 1.8nm','Diameter = 1.8nm, bbt = 0'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')
end

%legend([h(1) h(2) h(4)],{'Segunda curva do artigo','Gate = 382nm, bbt = 1','Gate = 390nm, bbt = 1'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend({'Artigo','Simulado'},'Location','south')


