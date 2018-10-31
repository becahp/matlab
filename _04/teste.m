map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];
	

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\00_all
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\08_1V_d24

%%
%%%Read data and store it in a struct		
op7 = [];		


%%%%%%%%%
%%FBG-FET
% op7 =  rdcelpa('08_1V_d24/n_esq_fbg_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/n_dir_fbg_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_esq_fbg_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_dir_fbg_1V_d24_dd_iv.elpa','*',[],op7);
% 
% op7 =  rdcelpa('08_1V_d24/n_esq_1g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/n_dir_1g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_esq_1g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_dir_1g_1V_d24_dd_iv.elpa','*',[],op7);

% op7 =  rdcelpa('08_1V_d24/n_esq_2g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/n_dir_2g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_esq_2g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_dir_2g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/n_esq_3g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/n_dir_3g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_esq_3g_1V_d24_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('08_1V_d24/p_dir_3g_1V_d24_dd_iv.elpa','*',[],op7);


% op7 =  rdcelpa('00_all/n_esq_fbg_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/n_dir_fbg_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_fbg_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_fbg_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/n_esq_1g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/n_dir_1g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_1g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_1g_bbt1_dd_iv.elpa','*',[],op7);

% op7 =  rdcelpa('00_all/n_esq_2g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/n_dir_2g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_2g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_2g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/n_esq_3g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/n_dir_3g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_esq_3g_bbt1_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('00_all/p_dir_3g_bbt1_dd_iv.elpa','*',[],op7);


op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);

op7(5).Isum = abs(op7(5).Isum);
op7(6).Isum = abs(op7(6).Isum);
op7(7).Isum = abs(op7(7).Isum);
op7(8).Isum = abs(op7(8).Isum);

figure
h(1) = semilogy(op7(1).G,op7(1).Isum );

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
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

hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(1,:);
h(4).Color = map(1,:);

h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(3,:);
h(8).Color = map(3,:);

legend([h(1) h(5)],...
    {'FBG dia=2.4nm','1g'},'Location', 'best'); 	
