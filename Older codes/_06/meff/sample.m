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

%meff 1.6
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\fbg

%1.6
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\03_all_bbt1_16
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\03_3g_d16

map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];

%%
%%%Read data and store it in a struct

op7 = [];		

%%%%%%%%%
%%1g-FET

% op01 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op01);
% op01 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op01);
% op01 = rdcelpa('n_dir_1g_meff_004_dd_iv.elpa','*',[],op01);
% op01 = rdcelpa('n_esq_1g_meff_004_dd_iv.elpa','*',[],op01);

% op7 = rdcelpa('n_esq_1g_meff_00_dd_iv.elpa','*',[],op7);
% op7 = rdcelpa('n_dir_1g_meff_00_dd_iv.elpa','*',[],op7);


op7 =  rdcelpa('03_all_bbt1_16/n_esq_1g_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_all_bbt1_16/n_dir_1g_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_esq_meff_004_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('03_all_bbt1_16/n_esq_fbg_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_all_bbt1_16/n_dir_fbg_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_dir_fbg_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('fbg/n_esq_fbg_meff_004_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('03_all_bbt1_16/n_esq_2g_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_all_bbt1_16/n_dir_2g_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('2g/n_dir_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('2g/n_esq_meff_004_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('03_3g_d16/n_esq_3g_12V_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_3g_d16/n_dir_3g_12V_d16_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_dir_3g_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('3g/n_esq_3g_meff_004_dd_iv.elpa','*',[],op7);








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
op7(7).Isum = abs(op7(7).Isum);
op7(8).Isum = abs(op7(8).Isum);
op7(9).Isum = abs(op7(9).Isum);
op7(10).Isum = abs(op7(10).Isum);
op7(11).Isum = abs(op7(11).Isum);
op7(12).Isum = abs(op7(12).Isum);
op7(13).Isum = abs(op7(13).Isum);
op7(14).Isum = abs(op7(14).Isum);
op7(15).Isum = abs(op7(15).Isum);
op7(16).Isum = abs(op7(16).Isum);
% op7(17).Isum = abs(op7(17).Isum);
% op7(18).Isum = abs(op7(18).Isum);
% op7(19).Isum = abs(op7(19).Isum);
% op7(20).Isum = abs(op7(20).Isum);
% op7(21).Isum = abs(op7(21).Isum);
% op7(22).Isum = abs(op7(22).Isum);

%semilog_elpa(op7,{{'Isum','G'}});

figure
h(1) = semilogy(op7(1).G,op7(1).Isum );

axis([-2 2 0.1E-11 0.0001])
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

ay = gca;
ay.YTick = [1e-12 1e-10 1e-8 1e-6 1e-4];

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
h(13) = semilogy(op7(13).G,op7(13).Isum );
h(14) = semilogy(op7(14).G,op7(14).Isum );
h(15) = semilogy(op7(15).G,op7(15).Isum );
h(16) = semilogy(op7(16).G,op7(16).Isum );
% h(17) = semilogy(op7(17).G,op7(17).Isum );
% h(18) = semilogy(op7(18).G,op7(18).Isum );
% h(19) = semilogy(op7(19).G,op7(19).Isum );
% h(20) = semilogy(op7(20).G,op7(20).Isum );
% h(21) = semilogy(op7(21).G,op7(21).Isum );
% h(22) = semilogy(op7(22).G,op7(22).Isum );

%map(1,:);

% h(1).Color  = 'r';
% h(2).Color  = 'r';
% h(3).Color  = [1    0.6  0 ]; %orange
% h(4).Color  = [1    0.6  0 ]; %orange
% h(5).Color  = 'y';
% h(6).Color  = 'y';
% h(7).Color  = 'g';
% h(8).Color  = 'g';
% h(9).Color  = 'c';
% h(10).Color = 'c';
% h(11).Color = 'b';
% h(12).Color = 'b';
% h(13).Color = [0.5  0    0.9 ]; %purple
% h(14).Color = [0.5  0    0.9 ]; %purple
% h(15).Color = 'm';
% h(16).Color = 'm';
% h(17).Color = 'k'; %'g';
% h(18).Color = 'k'; %'g';
% h(19).Color = map(2,:);
% h(20).Color = map(2,:);
% h(21).Color = map(4,:);
% h(22).Color = map(4,:);


h(1).Color  = map(1,:);
h(2).Color  = map(1,:);
h(3).Color  = map(1,:);
h(4).Color  = map(1,:);

h(5).Color  = map(2,:);
h(6).Color  = map(2,:);
h(7).Color  = map(2,:);
h(8).Color  = map(2,:);

h(9).Color  = map(3,:);
h(10).Color = map(3,:);
h(11).Color = map(3,:);
h(12).Color = map(3,:);

h(13).Color = map(4,:);
h(14).Color = map(4,:);
h(15).Color = map(4,:);
h(16).Color = map(4,:);

%h(1).LineStyle  = '--';
%h(2).LineStyle  = '--';
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
h(15).LineStyle  = '--';
h(16).LineStyle  = '--';


legend([h(1) h(5) h(9) h(13)],...
    {'FBG','1G','2G','3G'},'Location', 'best'); 
%print('4estruturas', '-depsc')
