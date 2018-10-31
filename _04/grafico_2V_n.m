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

% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\00_all

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\03_all_bbt1_16
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\05_all_bbt1_11

%novos 3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\09_3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\01_3g_dia

%novos d = 1.1
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\05_dia11

%%
%%%Read data and store it in a struct
		
op7 = [];			

%%%%%%%
aux = 3

if aux == 1
op7 =  rdcelpa('00_all/n_esq_1g_bbt1_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('00_all/n_dir_1g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_1g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_1g_bbt1_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('00_all/n_esq_fbg_bbt1_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('00_all/n_dir_fbg_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_fbg_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_fbg_bbt1_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('00_all/n_esq_2g_bbt1_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('00_all/n_dir_2g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_2g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_2g_bbt1_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('09_3g/n_esq_3g_100_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('09_3g/n_dir_3g_100_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('09_3g/p_esq_3g_100_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('09_3g/p_dir_3g_100_dd_iv.elpa','*',[],op7);

end

%%1G-FET
if aux == 2

op7 =  rdcelpa('05_all_bbt1_11/n_esq_1g_bbt1_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_all_bbt1_11/n_dir_1g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_esq_1g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_dir_1g_bbt1_d11_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('05_all_bbt1_11/n_esq_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_all_bbt1_11/n_dir_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_esq_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_dir_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);

op7(3).Isum(8) = NaN;
op7(3).Isum(9) = NaN;
op7(3).Isum(10) = NaN;

op7 =  rdcelpa('05_all_bbt1_11/n_esq_2g_bbt1_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_all_bbt1_11/n_dir_2g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_esq_2g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_dir_2g_bbt1_d11_dd_iv.elpa','*',[],op7);

op7(5).Isum(4) = NaN;
op7(5).Isum(5) = NaN;
op7(5).Isum(6) = NaN;

op7 =  rdcelpa('01_3g_dia/n_esq_3g_100_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01_3g_dia/n_dir_3g_100_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_esq_3g_100_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_dir_3g_100_d11_dd_iv.elpa','*',[],op7);

op7(7).Isum(4) = NaN;
op7(7).Isum(5) = NaN;

end

%%2G-FET
if aux == 3

op7 =  rdcelpa('03_all_bbt1_16/n_esq_1g_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_all_bbt1_16/n_dir_1g_bbt1_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('03_all_bbt1_16/p_esq_1g_bbt1_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('03_all_bbt1_16/p_dir_1g_bbt1_d16_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('03_all_bbt1_16/n_esq_fbg_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_all_bbt1_16/n_dir_fbg_bbt1_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('03_all_bbt1_16/p_esq_fbg_bbt1_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('03_all_bbt1_16/p_dir_fbg_bbt1_d16_dd_iv.elpa','*',[],op7);


op7 =  rdcelpa('03_all_bbt1_16/n_esq_2g_bbt1_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03_all_bbt1_16/n_dir_2g_bbt1_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('03_all_bbt1_16/p_esq_2g_bbt1_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('03_all_bbt1_16/p_dir_2g_bbt1_d16_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('01_3g_dia/n_esq_3g_100_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01_3g_dia/n_dir_3g_100_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_esq_3g_100_d16_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_dir_3g_100_d16_dd_iv.elpa','*',[],op7);

end



%%1G-FET
if aux == 4

op7 =  rdcelpa('05_all_bbt1_11/n_esq_1g_bbt1_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_all_bbt1_11/n_dir_1g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_esq_1g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_dir_1g_bbt1_d11_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('05_dia11/n_esq_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_all_bbt1_11/n_dir_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_esq_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_dir_fbg_bbt1_d11_dd_iv.elpa','*',[],op7);

%op7(3).Isum(8) = NaN;
%op7(3).Isum(9) = NaN;
%op7(3).Isum(10) = NaN;

op7 =  rdcelpa('05_dia11/n_esq_2g_bbt1_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_all_bbt1_11/n_dir_2g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_esq_2g_bbt1_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('05_all_bbt1_11/p_dir_2g_bbt1_d11_dd_iv.elpa','*',[],op7);

%op7(5).Isum(4) = NaN;
%op7(5).Isum(5) = NaN;
%op7(5).Isum(6) = NaN;

op7 =  rdcelpa('05_dia11/n_esq_3g_100_2V_d11_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('05_dia11/n_dir_3g_100_2V_d11_dd_iv.elpa','*',[],op7);

% op7 =  rdcelpa('01_3g_dia/p_esq_3g_100_d11_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('01_3g_dia/p_dir_3g_100_d11_dd_iv.elpa','*',[],op7);
%op7(7).Isum(4) = NaN;
%op7(7).Isum(5) = NaN;
end

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

% op7(9).Isum = abs(op7(9).Isum);
% op7(10).Isum = abs(op7(10).Isum);
% op7(11).Isum = abs(op7(11).Isum);
% op7(12).Isum = abs(op7(12).Isum);
% 
% op7(13).Isum = abs(op7(13).Isum);
% op7(14).Isum = abs(op7(14).Isum);
% op7(15).Isum = abs(op7(15).Isum);
% op7(16).Isum = abs(op7(16).Isum);

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
%h(1) = semilogy(op7(1).G,op7(1).Isum );
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
% h(2) = semilogy(op7(2).G,op7(2).Isum );
% h(3) = semilogy(op7(3).G,op7(3).Isum );
% h(4) = semilogy(op7(4).G,op7(4).Isum );
% h(5) = semilogy(op7(5).G,op7(5).Isum );
% h(6) = semilogy(op7(6).G,op7(6).Isum );
% h(7) = semilogy(op7(7).G,op7(7).Isum );
% h(8) = semilogy(op7(8).G,op7(8).Isum );

h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );
h(3) = semilogy(op7(3).G(op7(3).n_iter>0) ,op7(3).Isum(op7(3).n_iter>0) );
h(4) = semilogy(op7(4).G(op7(4).n_iter>0) ,op7(4).Isum(op7(4).n_iter>0) );
h(5) = semilogy(op7(5).G(op7(5).n_iter>0) ,op7(5).Isum(op7(5).n_iter>0) );
h(6) = semilogy(op7(6).G(op7(6).n_iter>0) ,op7(6).Isum(op7(6).n_iter>0) );
h(7) = semilogy(op7(7).G(op7(7).n_iter>0) ,op7(7).Isum(op7(7).n_iter>0) );
h(8) = semilogy(op7(8).G(op7(8).n_iter>0) ,op7(8).Isum(op7(8).n_iter>0) );

% h(9) = semilogy(op7(9).G,op7(9).Isum );
% h(10) = semilogy(op7(10).G,op7(10).Isum );
% h(11) = semilogy(op7(11).G,op7(11).Isum );
% h(12) = semilogy(op7(12).G,op7(12).Isum );
% h(13) = semilogy(op7(13).G,op7(13).Isum );
% h(14) = semilogy(op7(14).G,op7(14).Isum );
% h(15) = semilogy(op7(15).G,op7(15).Isum );
% h(16) = semilogy(op7(16).G,op7(16).Isum );

hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(1,:);
h(3).Color  = map(2,:);
h(4).Color  = map(2,:);

h(5).Color  = map(3,:);
h(6).Color  = map(3,:);
h(7).Color  = map(4,:);
h(8).Color  = map(4,:);

% h(9).Color  = map(3,:);
% h(10).Color = map(3,:);
% h(11).Color = map(3,:);
% h(12).Color = map(3,:);
% 
% h(13).Color = map(4,:);
% h(14).Color = map(4,:);
% h(15).Color = map(4,:);
% h(16).Color = map(4,:);


legend([h(1) h(3) h(5) h(7)],...
    {'1G','FBG','2G','3G'},'Location', 'best'); 
%%print('4estruturas', '-depsc')

% if aux == 1	
% legend([h(1) h(3) h(5) h(7)],...
    % {'1G dia=2.4nm','FBG dia=2.4nm','2G dia=2.4nm','3G dia=2.4nm'},'Location', 'best'); 	
% end

% if aux == 2
% legend([h(1) h(3) h(5) h(7)],...
    % {'1G dia=1.1nm','FBG dia=1.1nm','2G dia=1.1nm','3G dia=1.1nm'},'Location', 'best'); 	
% end

% if aux == 3
% legend([h(1) h(3) h(5) h(7)],...
    % {'1G dia=1.6nm','FBG dia=1.6nm','2G dia=1.6nm','3G dia=1.6nm'},'Location', 'best'); 	
% end
