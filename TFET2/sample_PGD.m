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



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\03_Drain_program_gate
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS_n
%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 2
%%%%%%%%%


op2 =  rdcelpa('nHP_PGS_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_PGS_dd_iv.elpa','*',[],op2);


op2 =  rdcelpa('01_VPGS_n/nnHP_PGS_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_VPGS_n/nnLP_PGS_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('nLP_PGS_elec_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('nLP_PGS_hole_dd_iv.elpa','*',[],op2);


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);


figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );


xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

%axis([0 0.8 1E-21 1e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s);
h(3) = semilogy(op2(3).V_g,op2(3).I_s);
h(4) = semilogy(op2(4).V_g,op2(4).I_s);


%h(1).Color = map(1,:);
%h(2).Color = map(2,:);
%h(3).Color = map(3,:);
%h(4).Color = map(4,:);

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);

%h(1).LineStyle = '--';
h(2).LineStyle = '--';
%h(3).LineStyle = '--';
h(4).LineStyle = '--';

%legend([h(1) h(3)],{'nHP','nLP','nHP n','nLP n'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend
legend({'nHP','nLP','nHP n','nLP n'}, 'Location', 'best');

%legend({'nHP','nLP'}, 'Location', 'best');
%legend({'nLP', 'nLP elec','nLP hole'}, 'Location', 'best');
%legend({'nLP V_{gd} = 0.8V', 'V_{gd} = 1.0V','V_{gd} = 1.2V','V_{gd} = 1.4V'}, 'Location', 'best');
legend('boxoff')


print('pgs_var_n', '-depsc');