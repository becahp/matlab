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



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\LP

%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 2
%%%%%%%%%

op2 =  rdcelpa('LP/nLP_BG_010_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_008_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_006_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_004_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_002_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('LP/nLP_BG_000_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('LP/nLP_BG_102_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_104_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_106_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_108_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_110_dd_iv.elpa','*',[],op2);


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s); %0V
op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);
op2(9).I_s = abs(op2(9).I_s);
op2(10).I_s = abs(op2(10).I_s);
op2(11).I_s = abs(op2(11).I_s);
%op2(12).I_s = abs(op2(12).I_s);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure %positivo
h(1) = semilogy(op2(1).V_g,op2(1).I_s );

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

axis([0 1 1E-17 1e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s);
h(3) = semilogy(op2(3).V_g,op2(3).I_s);
h(4) = semilogy(op2(4).V_g,op2(4).I_s);
h(5) = semilogy(op2(5).V_g,op2(5).I_s);
h(6) = semilogy(op2(6).V_g,op2(6).I_s); %0V

hold off;

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);
h(5).Color = map(5,:);

h(6).Color = map(6,:); %0V

legend({'VBG = +1.0V','VBG = +0.8V','VBG = +0.6V','VBG = +0.4V','VBG = +0.2V','VBG = 0.0V'}, 'Location', 'best');
legend('boxoff')

%print('var_BG_LP1', '-depsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
h(6) = semilogy(op2(6).V_g,op2(6).I_s); %0V

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([0 1 1E-17 1e-5])


hold;
h(7) = semilogy(op2(7).V_g,op2(7).I_s);
h(8) = semilogy(op2(8).V_g,op2(8).I_s);
h(9) = semilogy(op2(9).V_g,op2(9).I_s);
h(10) = semilogy(op2(10).V_g,op2(10).I_s);
h(11) = semilogy(op2(11).V_g,op2(11).I_s);
%h(12) = semilogy(op2(12).V_g,op2(12).I_s);



h(6).Color = map(6,:); %0V
h(7).Color = map(5,:);
h(8).Color = map(4,:);
h(9).Color = map(3,:);
h(10).Color = map(2,:);
h(11).Color = map(1,:);
%h(12).Color = map(6,:);

%h(7).LineStyle = '--';
%h(8).LineStyle = '--';
%h(9).LineStyle = '--';
%h(10).LineStyle = '--';
%h(11).LineStyle = '--';
%h(12).LineStyle = '--';

legend({'VBG = 0.0V','VBG = -0.2V','VBG = -0.4V','VBG = -0.6V','VBG = -0.8V','VBG = -1.0V'}, 'Location', 'best');

%legend({'VBG = |1.0|V','VBG = |0.8|V','VBG = |0.6|V','VBG = |0.4|V','VBG = |0.2|V','VBG = 0.0V'}, 'Location', 'best');
legend('boxoff')


%print('var_BG_LP2', '-depsc');