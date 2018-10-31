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


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\01_miniFET\03_tfet_as


%%
%%%Read data and store it in a struct
op2 = [];	
aux = 3
%%%%%%%%%

if aux == 1
op2 =  rdcelpa('tFET_mini3_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v4_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 =  rdcelpa('tFET_mini3_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v5_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v6_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v2_dd_iv.elpa','*',[],op2);
end

if aux == 3
op2 =  rdcelpa('tFET_mini3_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v5_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v6_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('tFET_mini3_v7_dd_iv.elpa','*',[],op2);
end


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);

op2(1).I_d = abs(op2(1).I_d);
op2(2).I_d = abs(op2(2).I_d);
op2(3).I_d = abs(op2(3).I_d);
op2(4).I_d = abs(op2(4).I_d);



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

h(5) = semilogy(op2(1).V_g,op2(1).I_d );
h(6) = semilogy(op2(2).V_g,op2(2).I_d);
h(7) = semilogy(op2(3).V_g,op2(3).I_d);
h(8) = semilogy(op2(4).V_g,op2(4).I_d);


h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);

h(5).Color = map(1,:);
h(6).Color = map(2,:);
h(7).Color = map(3,:);
h(8).Color = map(4,:);

h(5).LineStyle = '--';
h(6).LineStyle = '--';
h(7).LineStyle = '--';
h(8).LineStyle = '--';

%legend([h(1) h(3)],{'nHP','nLP','nHP n','nLP n'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend


if aux == 1
legend({'-1e10','-1e8','-1e6','-1e4'}, 'Location', 'best');
str = 'miniFET_v3';
end

if aux == 2
legend({'-1e10','-5e9','-1e9','-1e8'}, 'Location', 'best');
str = 'miniFET_v31';
end

if aux == 3
legend({'-1e10','-5e9','-1e9','-1e9 dv=-0.2'}, 'Location', 'best');
str = 'miniFET_v32';
end

legend('boxoff')

print(str, '-depsc');