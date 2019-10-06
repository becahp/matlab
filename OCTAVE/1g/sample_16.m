clear;
%close all; 
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



%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01\dia16

%antigo
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\07_all_16_overlap

%%
%%%Read data and store it in a struct
op2 = [];	
op7 = [];	
	
%aux = 2
%%%%%%%%%

op2 =  rdcelpa('n_dir_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op2);

op7 =  rdcelpa('old_n_esq_1g_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('old_n_dir_1g_d16_dd_iv.elpa','*',[],op7);

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
%op2(5).I_s = abs(op2(5).I_s);
%op2(6).I_s = abs(op2(6).I_s);
%op2(7).I_s = abs(op2(7).I_s);
%op2(8).I_s = abs(op2(8).I_s);

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
%op7(3).Isum = abs(op7(3).Isum);
%op7(4).Isum = abs(op7(4).Isum);
%op7(5).Isum = abs(op7(5).Isum);
%op7(6).Isum = abs(op7(6).Isum);
%op7(7).Isum = abs(op7(7).Isum);
%op7(8).Isum = abs(op7(8).Isum);

%%%*****************************************************************************Figura 3
figure
h(1) = semilogy(op2(1).V_g(op2(1).n_iter>0),op2(1).I_s(op2(1).n_iter>0)); %3G

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 1 0.1E-11 0.0001])

hold; %h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );
h(2) = semilogy(op2(2).V_g(op2(2).n_iter>0),op2(2).I_s(op2(2).n_iter>0)); %3G
%h(3) = semilogy(op2(3).V_g(op2(3).n_iter>0),op2(3).I_s(op2(3).n_iter>0)); %FBG
%h(4) = semilogy(op2(4).V_g(op2(4).n_iter>0),op2(4).I_s(op2(4).n_iter>0)); %FBG

h(3) = semilogy(op7(1).G,op7(1).Isum); % 3g antigo
h(4) = semilogy(op7(2).G,op7(2).Isum); % 3g antigo

hold off;

%h(1).Color = map(1,:);
%h(2).Color = map(1,:);
%h(3).Color = map(2,:);
%h(4).Color = map(2,:);
%h(5).Color = map(3,:);
%h(6).Color = map(3,:);
%h(7).Color = map(4,:);
%h(8).Color = map(4,:);

set(h(1),"color",map(1,:)) 
set(h(2),"color",map(1,:)) 
set(h(3),"color",map(2,:)) 
set(h(4),"color",map(2,:)) 

legend([h(1) h(3) ],{'1G','1G old'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')