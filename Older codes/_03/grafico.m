addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\00_fbg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\01_1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\02_2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_03_meff\03_3g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04


clear all
close all
clc

map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];

%[0 0 1] (azul), [0 0.5 0] (verde), [1 0 0], [0 0.75 0.75], [0.75 0 0.75]	

%%
%%%Read data and store it in a struct
op = []; 		
op1 = [];		
op2 = [];		
op3 = [];		
op4 = [];	
op01 = [];		
op02 = [];		
op03 = [];		
op04 = [];			

%%%verificar que os graficos de massa efetiva = 0.03 batiam com os resultados usando massa padrão
%%FBG-FET
op01 = rdcelpa('01/n_dir_fbg_dd_iv.elpa','*',[],op01);
op01 = rdcelpa('01/n_esq_fbg_dd_iv.elpa','*',[],op01);
op01 = rdcelpa('00_fbg/n_dir_fbg_meff_003_dd_iv.elpa','*',[],op01);
op01 = rdcelpa('00_fbg/n_esq_fbg_meff_003_dd_iv.elpa','*',[],op01);

%%1G-FET
op02 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op02);
op02 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op02);
op02 = rdcelpa('01_1g/n_dir_1g_meff_003_dd_iv.elpa','*',[],op02);
op02 = rdcelpa('01_1g/n_esq_1g_meff_003_dd_iv.elpa','*',[],op02);

%%2G-FET
op03 =  rdcelpa('03/n_dir_2g_dd_iv.elpa','*',[],op03);
op03 =  rdcelpa('03/n_esq_2g_dd_iv.elpa','*',[],op03);
op03 = rdcelpa('02_2g/n_dir_2g_meff_003_dd_iv.elpa','*',[],op03);
op03 = rdcelpa('02_2g/n_esq_2g_meff_003_dd_iv.elpa','*',[],op03);

%%3G-FET
op04 =  rdcelpa('04/n_dir_3g_dd_iv.elpa','*',[],op04);
op04 =  rdcelpa('04/n_esq_3g_dd_iv.elpa','*',[],op04);
op04 = rdcelpa('03_3g/n_dir_3g_meff_003_dd_iv.elpa','*',[],op04);
op04 = rdcelpa('03_3g/n_esq_3g_meff_003_dd_iv.elpa','*',[],op04);

%%
%%%
%%%%

op01(1).Isum = abs(op01(1).Isum);
op01(2).Isum = abs(op01(2).Isum);
op01(3).Isum = abs(op01(3).Isum);
op01(4).Isum = abs(op01(4).Isum);
%semilog_elpa(op01,{{'Isum','G'}});

op02(1).Isum = abs(op02(1).Isum);
op02(2).Isum = abs(op02(2).Isum);
op02(3).Isum = abs(op02(3).Isum);
op02(4).Isum = abs(op02(4).Isum);
%semilog_elpa(op02,{{'Isum','G'}});

op03(1).Isum = abs(op03(1).Isum);
op03(2).Isum = abs(op03(2).Isum);
op03(3).Isum = abs(op03(3).Isum);
op03(4).Isum = abs(op03(4).Isum);
%semilog_elpa(op03,{{'Isum','G'}});

op04(1).Isum = abs(op04(1).Isum);
op04(2).Isum = abs(op04(2).Isum);
op04(3).Isum = abs(op04(3).Isum);
op04(4).Isum = abs(op04(4).Isum);
%semilog_elpa(op04,{{'Isum','G'}});



%%FBG
figure
h(1) = semilogy(op01(1).G,op01(1).Isum );

hold
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%legend('FBG-FET', 'Location', 'Best');

h(2) = semilogy(op01(2).G,op01(2).Isum );
h(3) = semilogy(op01(3).G,op01(3).Isum );
h(4) = semilogy(op01(4).G,op01(4).Isum );
%hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(1,:);
h(3).Color  = map(2,:);
h(4).Color  = map(2,:);

%plot(x,y, 'Color', myCustomColorMap(colorIndex, :));