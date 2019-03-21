clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close all figures, and then repeat the first example.
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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g


%%
op6 = [];		

aux = 1;

if aux == 1

op6 =  rdcelpa('1g/n_1g_vgs_05_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/n_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/n_1g_vgs_15_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/n_1g_vgs_2_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/p_1g_vgs_05_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/p_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/p_1g_vgs_15_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('1g/p_1g_vgs_2_dd_iv.elpa','*',[],op6);

end



%% vpg = 1.2




op6(1).Isum = op6(1).Isum * 1e6;
op6(2).Isum = op6(2).Isum * 1e6;
op6(3).Isum = op6(3).Isum * 1e6;
op6(4).Isum = op6(4).Isum * 1e6;
op6(5).Isum = op6(5).Isum * 1e6;
op6(6).Isum = op6(6).Isum * 1e6;
op6(7).Isum = op6(7).Isum * 1e6;
op6(8).Isum = op6(8).Isum * 1e6;



figure
%h(19) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op6(1).D,op6(1).Isum );
%set(h,'linewidth',2)
hold
h(2) = plot(op6(2).D,op6(2).Isum );
h(3) = plot(op6(3).D,op6(3).Isum );
h(4) = plot(op6(4).D,op6(4).Isum );      
h(5) = plot(op6(5).D,op6(5).Isum );      
h(6) = plot(op6(6).D,op6(6).Isum );      
h(7) = plot(op6(7).D,op6(7).Isum );      
h(8) = plot(op6(8).D,op6(8).Isum );      



%axis([-2 2 -15 15]) %bbt 0
axis([-2 2 -15 15]) %bbt 1
xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')
grid on

hold off;

h(1).Color =  map(1,:);
h(2).Color =  map(1,:);
h(3).Color =  map(1,:);
h(4).Color =  map(1,:);

h(5).Color =  map(2,:);
h(6).Color =  map(2,:);
h(7).Color =  map(2,:);
h(8).Color =  map(2,:);


%  legend([h(1) h(3)],...
%      {'p-type','n-type'},...
%  	'Location', 'best');

%print('2g_transfer_n_p', '-depsc')
