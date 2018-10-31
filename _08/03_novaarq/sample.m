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



%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\00_dia16

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\00_todas

%%
%%%Read data and store it in a struct
op2 = [];	
i = 1;
%aux = 1
%%%%%%%%%

%if aux == 1 %	1 p_dir_artigo_d18_b102	: versão para novo coos
op2 =  rdcelpa('new_1g_dd_iv.elpa','*',[],op2);
%[a.x1,a.y1] = plot_elpa_gm_v30(op2(i),'n');
op2 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('new_fbg_dd_iv.elpa','*',[],op2);
%[a.x2,a.y2] = plot_elpa_gm_v30(op2(i+1),'n');
op2 =  rdcelpa('n_esq_fbg_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('new_2g_dd_iv.elpa','*',[],op2);
%[a.x3,a.y3] = plot_elpa_gm_v30(op2(i+2),'n');
op2 =  rdcelpa('n_esq_2g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);
%[a.x4,a.y4] = plot_elpa_gm_v30(op2(i+3),'n');

op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);



%%%%%%%%%%%%%%


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
op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);


figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s ); 
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 1 0.1E-11 0.0001])
hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s); 
h(3) = semilogy(op2(3).V_g,op2(3).I_s); 
h(4) = semilogy(op2(4).V_g,op2(4).I_s); 
h(5) = semilogy(op2(5).V_g,op2(5).I_s); 
h(6) = semilogy(op2(6).V_g,op2(6).I_s); 
h(7) = semilogy(op2(7).V_g,op2(7).I_s); 
h(8) = semilogy(op2(8).V_g,op2(8).I_s); 


hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(4,:);
h(8).Color = map(4,:);

legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend

legend('boxoff');

% figure
% h(1) = plot(a.x1,a.y1);
% ylabel('g_{m} (\muS)')
% xlabel('V_{gs} (V)')
% axis([0 1.5 0 10])

% hold
% h(2) = plot(a.x2,a.y2);
% h(3) = plot(a.x3,a.y3);
% h(4) = plot(a.x4,a.y4);

% h(1).Color = map(1,:);
% h(2).Color = map(2,:);
% h(3).Color = map(3,:);
% h(4).Color = map(4,:);

% legend({'1G','FBG','2G','3G'}, 'Location', 'best');
% legend('boxoff');
