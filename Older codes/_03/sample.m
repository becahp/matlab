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

%%%%%%%%%
%%FBG-FET
op01 =  rdcelpa('01/n_esq_fbg_dd_iv.elpa','*',[],op01);
op01 =  rdcelpa('01/n_dir_fbg_dd_iv.elpa','*',[],op01);
op01 = rdcelpa('00_fbg/n_dir_fbg_meff_003_dd_iv.elpa','*',[],op01);
op01 = rdcelpa('00_fbg/n_esq_fbg_meff_003_dd_iv.elpa','*',[],op01);

op1 = rdcelpa('00_fbg/n_esq_fbg_meff_00_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_00_dd_iv.elpa','*',[],op1);

op1 = rdcelpa('00_fbg/n_esq_fbg_meff_01_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_01_dd_iv.elpa','*',[],op1);

op1 = rdcelpa('00_fbg/n_esq_fbg_meff_02_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_02_dd_iv.elpa','*',[],op1);

op1 = rdcelpa('00_fbg/n_esq_fbg_meff_03_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_03_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_04_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_04_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_05_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_05_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_06_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_06_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_07_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_07_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_08_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_08_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_09_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_09_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_esq_fbg_meff_10_dd_iv.elpa','*',[],op1);
op1 = rdcelpa('00_fbg/n_dir_fbg_meff_10_dd_iv.elpa','*',[],op1);


%%1G-FET
op02 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op02);
op02 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op02);
op02 = rdcelpa('01_1g/n_dir_1g_meff_003_dd_iv.elpa','*',[],op02);
op02 = rdcelpa('01_1g/n_esq_1g_meff_003_dd_iv.elpa','*',[],op02);

op2 = rdcelpa('01_1g/n_dir_1g_meff_00_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_dir_1g_meff_10_dd_iv.elpa','*',[],op2);

op2 = rdcelpa('01_1g/n_esq_1g_meff_00_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('01_1g/n_esq_1g_meff_10_dd_iv.elpa','*',[],op2);



%%2G-FET
op03 =  rdcelpa('03/n_esq_2g_dd_iv.elpa','*',[],op03);
op03 =  rdcelpa('03/n_dir_2g_dd_iv.elpa','*',[],op03);
op03 = rdcelpa('02_2g/n_dir_2g_meff_003_dd_iv.elpa','*',[],op03);
op03 = rdcelpa('02_2g/n_esq_2g_meff_003_dd_iv.elpa','*',[],op03);



%%3G-FET
op04 =  rdcelpa('04/n_esq_3g_dd_iv.elpa','*',[],op04);
op04 =  rdcelpa('04/n_dir_3g_dd_iv.elpa','*',[],op04);
op04 = rdcelpa('03_3g/n_dir_3g_meff_003_dd_iv.elpa','*',[],op04);
op04 = rdcelpa('03_3g/n_esq_3g_meff_003_dd_iv.elpa','*',[],op04);


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


op1(1).Isum = abs(op1(1).Isum);
op1(2).Isum = abs(op1(2).Isum);
op1(3).Isum = abs(op1(3).Isum);
op1(4).Isum = abs(op1(4).Isum);
op1(5).Isum = abs(op1(5).Isum);
op1(6).Isum = abs(op1(6).Isum);
op1(7).Isum = abs(op1(7).Isum);
op1(8).Isum = abs(op1(8).Isum);
op1(9).Isum = abs(op1(9).Isum);
op1(10).Isum = abs(op1(10).Isum);
op1(11).Isum = abs(op1(11).Isum);
op1(12).Isum = abs(op1(12).Isum);
op1(13).Isum = abs(op1(13).Isum);
op1(14).Isum = abs(op1(14).Isum);
op1(15).Isum = abs(op1(15).Isum);
op1(16).Isum = abs(op1(16).Isum);
op1(17).Isum = abs(op1(17).Isum);
op1(18).Isum = abs(op1(18).Isum);
op1(19).Isum = abs(op1(19).Isum);
op1(20).Isum = abs(op1(20).Isum);
op1(21).Isum = abs(op1(21).Isum);
op1(22).Isum = abs(op1(22).Isum);

%semilog_elpa(op1,{{'Isum','G'}});

figure
h(1) = semilogy(op1(1).G,op1(1).Isum );

%axis([-1.5 1.5 0.1E-10 0.0001])
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

hold
h(2) = semilogy(op1(2).G,op1(2).Isum );
h(3) = semilogy(op1(3).G,op1(3).Isum );
h(4) = semilogy(op1(4).G,op1(4).Isum );
h(5) = semilogy(op1(5).G,op1(5).Isum );
h(6) = semilogy(op1(6).G,op1(6).Isum );
h(7) = semilogy(op1(7).G,op1(7).Isum );
h(8) = semilogy(op1(8).G,op1(8).Isum );
h(9) = semilogy(op1(9).G,op1(9).Isum );
h(10) = semilogy(op1(10).G,op1(10).Isum );
h(11) = semilogy(op1(11).G,op1(11).Isum );
h(12) = semilogy(op1(12).G,op1(12).Isum );
h(13) = semilogy(op1(13).G,op1(13).Isum );
h(14) = semilogy(op1(14).G,op1(14).Isum );
h(15) = semilogy(op1(15).G,op1(15).Isum );
h(16) = semilogy(op1(16).G,op1(16).Isum );
h(17) = semilogy(op1(17).G,op1(17).Isum );
h(18) = semilogy(op1(18).G,op1(18).Isum );
h(19) = semilogy(op1(19).G,op1(19).Isum );
h(20) = semilogy(op1(20).G,op1(20).Isum );
h(21) = semilogy(op1(21).G,op1(21).Isum );
h(22) = semilogy(op1(22).G,op1(22).Isum );

%map(1,:);

h(1).Color  = 'r';
h(2).Color  = 'r';
h(3).Color  = [1    0.6  0 ]; %orange
h(4).Color  = [1    0.6  0 ]; %orange
h(5).Color  = 'y';
h(6).Color  = 'y';
h(7).Color  = 'g';
h(8).Color  = 'g';
h(9).Color  = 'c';
h(10).Color = 'c';
h(11).Color = 'b';
h(12).Color = 'b';
h(13).Color = [0.5  0    0.9 ]; %purple
h(14).Color = [0.5  0    0.9 ]; %purple
h(15).Color = 'm';
h(16).Color = 'm';
h(17).Color = 'k'; %'g';
h(18).Color = 'k'; %'g';
h(19).Color = map(3,:);
h(20).Color = map(3,:);
h(21).Color = map(4,:);
h(22).Color = map(4,:);
	
