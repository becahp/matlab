clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close 00_all figures, and then repeat the first example.
close all;
 
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

	%novos 3g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\09_3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\10_3g %1V

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\01_3g_dia %2V

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\16



%%
%%%Read data and store it in a struct
		
op7 = [];			
op2 = [];			

%%%%%%%

%Vpgds = 2V
op7 =  rdcelpa('01_3g_dia/n_esq_3g_100_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01_3g_dia/n_dir_3g_100_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_esq_3g_100_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_dir_3g_100_d16_dd_iv.elpa','*',[],op7);

%Vpgds = 1V
op7 =  rdcelpa('10_3g/n_esq_3g_100_1V_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('10_3g/n_dir_3g_100_1V_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('10_3g/p_esq_3g_100_1V_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('10_3g/p_dir_3g_100_1V_d16_dd_iv.elpa','*',[],op7);

%Vpgds = 1.2V
op2 =  rdcelpa('16/n_dir_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('16/n_esq_3g_dd_iv.elpa','*',[],op2);


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);

op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);

figure
h(1) = semilogy(op7(1).G(op7(1).n_iter>0) ,op7(1).Isum(op7(1).n_iter>0) );

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-12 0.0001]) %%usado no 1V
axis([-1.5 1.5 0.1E-13 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

ay = gca;
ay.YTick = [1e-14 1e-12 1e-10 1e-8 1e-6 1e-4];
%yticks = {0 100 200 300 400 500};
%set(ay,'YTickLabel',yticks); % set tick labels to updated values

hold
h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );

h(3) = semilogy(op2(1).V_g(op2(1).n_iter>0),op2(1).I_s(op2(1).n_iter>0));
h(4) = semilogy(op2(2).V_g(op2(2).n_iter>0),op2(2).I_s(op2(2).n_iter>0));

h(5) = semilogy(op7(3).G(op7(3).n_iter>0) ,op7(3).Isum(op7(3).n_iter>0) );
h(6) = semilogy(op7(4).G(op7(4).n_iter>0) ,op7(4).Isum(op7(4).n_iter>0) );


hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(1,:);
h(3).Color  = 'k';%map(2,:);
h(4).Color  = 'k';%map(2,:);

h(5).Color  = map(2,:);
h(6).Color  = map(2,:);
%h(7).Color  = map(4,:);
%h(8).Color  = map(4,:);

% h(9).Color  = map(3,:);
% h(10).Color = map(3,:);
% h(11).Color = map(3,:);
% h(12).Color = map(3,:);
% 
% h(13).Color = map(4,:);
% h(14).Color = map(4,:);
% h(15).Color = map(4,:);
% h(16).Color = map(4,:);


legend([h(1) h(3) h(5)],...
    {'V_{\rm pgs} = V_{\rm pgd} = 2V','V_{\rm pgs} = V_{\rm pgd} = 1.2V', 'V_{\rm pgs} = V_{\rm pgd} = 1V'},'Location', 'best'); 

legend('boxoff')
