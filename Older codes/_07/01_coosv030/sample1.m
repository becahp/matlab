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


%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\3g\3g_d24_10V_10V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\00\n_3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\00\p_3g

%%
%%%Read data and store it in a struct
op2 = [];		


%%%%%%%%%

%op2 =  rdcelpa('3g_d24_10V_10V_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_3g\n_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_3g\p_3g_dd_iv.elpa','*',[],op2);



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


%op2(1).I_s = abs(op2(1).I_s);
%op2(2).I_s = abs(op2(2).I_s);


figure
%h(1) = semilogy(op2(1).V_d,op2(1).I_s );
h(1) = plot(op2(1).V_d,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{d} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 1 0.1E-11 0.0001])

hold;
h(2) = plot(op2(2).V_d,op2(2).I_s );

%h(2) = semilogy(op2(1).V_g,op2(1).I_s );
%h(3) = semilogy(op2(2).V_g,op2(2).I_s );
%hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);

%h(2).Color = map(2,:);
%h(3).Color = map(2,:);

%legend({'3G'});
%legend([h(1) h(2)],{'Experimental','v030'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')


