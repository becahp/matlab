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
	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\08_1V_d11
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\08_1V_d16
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\08_1V_d24


%%
%%%Read data and store it in a struct		
op7 = [];		



op7 =  rdcelpa('08_1V_d24/n_esq_1g_1V_d24_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d24/n_dir_1g_1V_d24_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d24/p_esq_1g_1V_d24_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d24/p_dir_1g_1V_d24_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('08_1V_d16/n_esq_1g_1V_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d16/n_dir_1g_1V_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d16/p_esq_1g_1V_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d16/p_dir_1g_1V_d16_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('08_1V_d11/n_esq_1g_1V_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d11/n_dir_1g_1V_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d11/p_esq_1g_1V_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('08_1V_d11/p_dir_1g_1V_d11_dd_iv.elpa','*',[],op7);



%%
%%%
%%%%

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);

op7(5).Isum = abs(op7(5).Isum);
op7(6).Isum = abs(op7(6).Isum);
op7(7).Isum = abs(op7(7).Isum);
op7(8).Isum = abs(op7(8).Isum);

op7(9).Isum = abs(op7(9).Isum);
op7(10).Isum = abs(op7(10).Isum);
op7(11).Isum = abs(op7(11).Isum);
op7(12).Isum = abs(op7(12).Isum);

% op7(13).Isum = abs(op7(13).Isum);
% op7(14).Isum = abs(op7(14).Isum);
% op7(15).Isum = abs(op7(15).Isum);
% op7(16).Isum = abs(op7(16).Isum);


figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op7(1).G,op7(1).Isum );

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-9 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

hold
h(2) = semilogy(op7(2).G,op7(2).Isum );
h(3) = semilogy(op7(3).G,op7(3).Isum );
h(4) = semilogy(op7(4).G,op7(4).Isum );
h(5) = semilogy(op7(5).G,op7(5).Isum );
h(6) = semilogy(op7(6).G,op7(6).Isum );
h(7) = semilogy(op7(7).G,op7(7).Isum );
h(8) = semilogy(op7(8).G,op7(8).Isum );
h(9) = semilogy(op7(9).G,op7(9).Isum );
h(10) = semilogy(op7(10).G,op7(10).Isum );
h(11) = semilogy(op7(11).G,op7(11).Isum );
h(12) = semilogy(op7(12).G,op7(12).Isum );
% h(13) = semilogy(op7(13).G,op7(13).Isum );
% h(14) = semilogy(op7(14).G,op7(14).Isum );
% h(15) = semilogy(op7(15).G,op7(15).Isum );
% h(16) = semilogy(op7(16).G,op7(16).Isum );


hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(1,:);
h(4).Color = map(1,:);

h(5).Color = map(2,:);
h(6).Color = map(2,:);
h(7).Color = map(2,:);
h(8).Color = map(2,:);

h(9).Color = map(3,:);
h(10).Color = map(3,:);
h(11).Color = map(3,:);
h(12).Color = map(3,:);

% h(13).Color = map(4,:);
% h(14).Color = map(4,:);
% h(15).Color = map(4,:);
% h(16).Color = map(4,:);


% h(1).LineStyle  = '--';
% h(2).LineStyle  = '--';
h(3).LineStyle  = '--';
h(4).LineStyle  = '--';

%h(5).LineStyle  = '--';
%h(6).LineStyle  = '--';
h(7).LineStyle  = '--';
h(8).LineStyle  = '--';

%h(9).LineStyle  = '--';
%h(10).LineStyle = '--';
h(11).LineStyle  = '--';
h(12).LineStyle = '--';

%h(13).LineStyle  = '--';
%h(14).LineStyle  = '--';
% h(15).LineStyle  = '--';
% h(16).LineStyle  = '--';

% legend([h(1) h(5) h(9) h(13)],...
    % {'FBG','1G','2G','3G'},'Location', 'best'); 

	
legend([h(1) h(5) h(9)],...
    {'Dia=2.4nm','Dia=1.6nm','Dia=1.1nm'},'Location', 'southwest'); 	
