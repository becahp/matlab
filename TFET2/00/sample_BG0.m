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
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\02_BG=0		%vbg = 0V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\09_new_vds	%vbg = 0V

%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 2
%%%%%%%%%

op2 =  rdcelpa('nHP_vds05_BG0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_vds05_BG0_dd_iv.elpa','*',[],op2);

%antiga
op2 =  rdcelpa('nHP_BG_000_25_new_vds_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_BG_000_25_new_vds_dd_iv.elpa','*',[],op2); %falta um
op2 =  rdcelpa('nLP_BG_000_25_new_vds_2_dd_iv.elpa','*',[],op2);



%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_d = abs(op2(1).I_d);
op2(2).I_d = abs(op2(2).I_d);
op2(3).I_d = abs(op2(3).I_d);
op2(4).I_d = abs(op2(4).I_d);
op2(5).I_d = abs(op2(5).I_d);


figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d );

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

%axis([0 0.8 1E-21 1e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_d);
h(3) = semilogy(op2(3).V_g,op2(3).I_d);
h(4) = semilogy(op2(4).V_g,op2(4).I_d);
h(5) = semilogy(op2(5).V_g,op2(5).I_d);

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(1,:);
h(4).Color = map(2,:);
h(5).Color = map(2,:);

%h(1).LineStyle = '--';
%h(2).LineStyle = '--';
h(3).LineStyle = '--';
h(4).LineStyle = '--';
h(5).LineStyle = '--';

%legend([h(1) h(3)],{'nHP','nLP','nHP n','nLP n'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend


legend({'nHP','nLP'}, 'Location', 'best');
legend('boxoff')

%print('miniFET', '-depsc');