clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close 08_overlap figures, and then repeat the first example.
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
set(0,'DefaultAxesUnits','normalized');
set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
set(0,'DefaultAxesPosition',[0.15 0.15 0.7 0.7]); 
 
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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\09_3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\10_vgs
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\13_3g_vds

%%
%%%Read data and store it in a struct
		
op7 = [];			

aux = 1;
%%%%%%%


%%(ii) 3G: |Vpg/s|=|V_{\rm ds}|=1.2, 1.4, 1.6V

if aux == 1
op7 =  rdcelpa('09_3g/n_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('09_3g/n_dir_3g_100_1V_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('10_vgs/n_esq_3g_100_12V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('10_vgs/n_dir_3g_100_12V_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('10_vgs/n_esq_3g_100_14V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('10_vgs/n_dir_3g_100_14V_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('10_vgs/n_esq_3g_100_16V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('10_vgs/n_dir_3g_100_16V_dd_iv.elpa','*',[],op7);
end

if aux == 2
op7 =  rdcelpa('13_3g_vds/n_esq_3g_100_12V_10V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('13_3g_vds/n_dir_3g_100_12V_10V_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('10_vgs/n_esq_3g_100_12V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('10_vgs/n_dir_3g_100_12V_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('13_3g_vds/n_esq_3g_100_12V_14V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('13_3g_vds/n_dir_3g_100_12V_14V_dd_iv.elpa','*',[],op7);
end



%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);

op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);

op7(5).Isum = abs(op7(5).Isum);
op7(6).Isum = abs(op7(6).Isum);


if aux == 1
op7(7).Isum = abs(op7(7).Isum);
op7(8).Isum = abs(op7(8).Isum);
end

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op7(1).G,op7(1).Isum );

%set(h,'linewidth',2)
axis([-1.5 1.5 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

hold
h(2) = semilogy(op7(2).G,op7(2).Isum );
h(3) = semilogy(op7(3).G,op7(3).Isum );
h(4) = semilogy(op7(4).G,op7(4).Isum );
h(5) = semilogy(op7(5).G,op7(5).Isum );
h(6) = semilogy(op7(6).G,op7(6).Isum );

if aux == 1
h(7) = semilogy(op7(7).G,op7(7).Isum );
h(8) = semilogy(op7(8).G,op7(8).Isum );
end

hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(1,:);
h(3).Color  = map(2,:);
h(4).Color  = map(2,:);

h(5).Color  = map(3,:);
h(6).Color  = map(3,:);


if aux == 1
h(7).Color  = map(4,:);
h(8).Color  = map(4,:);
end

if aux == 2
legend([h(1) h(3) h(5)],...
    {'V_{\rm ds} = 1.0V', 'V_{\rm ds} = 1.2V','V_{\rm ds} = 1.4V'},'Location', 'best'); 
	
	
%print('4estruturas', '-depsc')
end

if aux == 1
legend([h(1) h(3) h(5) h(7)],...
    {'V_{\rm pgs/d} = 1.0V', 'V_{\rm pgs/d} = 1.2V','V_{\rm pgs/d} = 1.4V','V_{\rm pgs/d} = 1.6V'},'Location', 'best'); 
%print('4estruturas', '-depsc')
end

legend('boxoff')