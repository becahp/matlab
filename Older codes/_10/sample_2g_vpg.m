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

	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\02_2g_vpg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\00_dia16
%%
%%%Read data and store it in a struct
op2 = [];		

%sel = 4
%%%%%%%%%
 
op2 =  rdcelpa('n_dir_2g_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_14V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_16V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_18V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_2g_dd_iv.elpa','*',[],op2);

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
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
%op2(7).I_s = abs(op2(7).I_s);
%op2(8).I_s = abs(op2(8).I_s);

%(op2(1).n_iter>0)
figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-2 2 0.1E-16 0.0001])

hold;
h(2) = semilogy(op2(2).V_g,op2(2).I_s );
h(3) = semilogy(op2(3).V_g,op2(3).I_s );
h(4) = semilogy(op2(4).V_g,op2(4).I_s );
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );

%hold off;

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);
h(5).Color = map(5,:);
h(6).Color = map(6,:);


%legend([h(1) h(3) h(5)],{'E_{\rm gap} = 0.36eV','E_{\rm gap} = 0.54eV','E_{\rm gap} = 0.78eV'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend

legend({'VPG= 1.0V','VPG= 1.2V','VPG= 1.4V', 'VPG= 1.6V','VPG= 1.8V','VPG= 2.0V'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')
