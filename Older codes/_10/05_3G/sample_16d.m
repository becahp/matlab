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
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\10_3g


%%
%%%Read data and store it in a struct
op2 = [];	
%op7 = [];	
	
aux = 1
%%%%%%%%%

op2 =  rdcelpa('n_dir_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_fbg_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_fbg_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_2g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_2g_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_3g_12V_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_1g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_fbg_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_fbg_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_2g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_2g_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('p_dir_3g_v1_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('p_esq_3g_v1_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_3g_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_3g_12V_dd_iv.elpa','*',[],op2);


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
op2(9).I_s = abs(op2(9).I_s);
op2(10).I_s = abs(op2(10).I_s);
op2(11).I_s = abs(op2(11).I_s);
op2(12).I_s = abs(op2(12).I_s);
op2(13).I_s = abs(op2(13).I_s);
op2(14).I_s = abs(op2(14).I_s);
op2(15).I_s = abs(op2(15).I_s);
op2(16).I_s = abs(op2(16).I_s);


%%%*****************************************************************************Figura 4 ambas
figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-2 2 0.1E-15 0.0001])
axis([-2 2 1E-12 2e-5])

ay = gca;
ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s);
h(3) = semilogy(op2(3).V_g,op2(3).I_s);
h(4) = semilogy(op2(4).V_g,op2(4).I_s);
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );
h(7) = semilogy(op2(7).V_g,op2(7).I_s);
h(8) = semilogy(op2(8).V_g,op2(8).I_s);

h(9)  = semilogy(op2(9).V_g,op2(9).I_s );
h(10) = semilogy(op2(10).V_g,op2(10).I_s );
h(11) = semilogy(op2(11).V_g,op2(11).I_s );
h(12) = semilogy(op2(12).V_g,op2(12).I_s );
h(13) = semilogy(op2(13).V_g,op2(13).I_s );
h(14) = semilogy(op2(14).V_g,op2(14).I_s );
h(15) = semilogy(op2(15).V_g,op2(15).I_s );
h(16) = semilogy(op2(16).V_g,op2(16).I_s );

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(4,:);
h(8).Color = map(4,:);

h(9).Color = map(1,:);
h(10).Color = map(1,:);
h(11).Color = map(2,:);
h(12).Color = map(2,:);
h(13).Color = map(3,:);
h(14).Color = map(3,:);
h(15).Color = map(4,:);
h(16).Color = map(4,:);

h(9).LineStyle = '--';
h(10).LineStyle = '--';
h(11).LineStyle = '--';
h(12).LineStyle = '--';
h(13).LineStyle = '--';
h(14).LineStyle = '--';
h(15).LineStyle = '--';
h(16).LineStyle = '--';

%legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend

legend('boxoff')

%print('Fig7a_NOVOS', '-depsc');
%print('Fig7a_NOVOS', '-djpeg');

save = 1;
if save == 1
%%*********************************************************%%
op = [];
op2 = [];
op2 =  rdcelpa('n_esq_3g_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_dir_3g_12V_dd_iv.elpa','*',[],op2);

i = 1;
op2(i).V_g = wrev(op2(i).V_g);
op2(i).I_s = wrev(op2(i).I_s);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7_d4';
save_elpa(['Data/',elp.title,'.elpa'],elp)

%%*********************************************************%%
op = [];
op2 = [];
op2 =  rdcelpa('p_esq_3g_12V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_12V_dd_iv.elpa','*',[],op2);

i = 1;
op2(i).V_g = wrev(op2(i).V_g);
op2(i).I_s = wrev(op2(i).I_s);

op = meu_mergev30(op2);
op.I_s = abs(op.I_s);

elp.mat=[op.V_g',op.I_s'];
elp.var_names={'V_g','I_s'};
elp.title='Fig7_d8';
save_elpa(['Data/',elp.title,'.elpa'],elp)

%%*********************************************************%%
end