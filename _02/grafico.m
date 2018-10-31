%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04

clear all
close all
clc

%%
%%%Read data and store it in a struct
op = []; 		
op1 = [];		
op2 = [];		
op3 = [];		
op4 = [];		

%%%%%%%%%
%%FBG-FET
op1 =  rdcelpa('01/n_esq_fbg_dd_iv.elpa','*',[],op1);
op1 =  rdcelpa('01/n_dir_fbg_dd_iv.elpa','*',[],op1);
op1 =  rdcelpa('01/p_esq_fbg_dd_iv.elpa','*',[],op1);
op1 =  rdcelpa('01/p_dir_fbg_dd_iv.elpa','*',[],op1);

%%1G-FET
op2 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op2);

%%2G-FET
op3 =  rdcelpa('03/n_esq_2g_dd_iv.elpa','*',[],op3);
op3 =  rdcelpa('03/n_dir_2g_dd_iv.elpa','*',[],op3);
op3 =  rdcelpa('03/p_esq_2g_dd_iv.elpa','*',[],op3);
op3 =  rdcelpa('03/p_dir_2g_dd_iv.elpa','*',[],op3);


%%3G-FET
op4 =  rdcelpa('04/n_esq_3g_dd_iv.elpa','*',[],op4);
op4 =  rdcelpa('04/n_dir_3g_dd_iv.elpa','*',[],op4);
op4 =  rdcelpa('04/p_esq_3g_dd_iv.elpa','*',[],op4);
op4 =  rdcelpa('04/p_dir_3g_dd_iv.elpa','*',[],op4);

%%
%%%
%%%%

op1(1).Isum = abs(op1(1).Isum);
op1(2).Isum = abs(op1(2).Isum);
op1(3).Isum = abs(op1(3).Isum);
op1(4).Isum = abs(op1(4).Isum);
%semilog_elpa(op1,{{'Isum','G'}});

op2(1).Isum = abs(op2(1).Isum);
op2(2).Isum = abs(op2(2).Isum);
op2(3).Isum = abs(op2(3).Isum);
op2(4).Isum = abs(op2(4).Isum);
%semilog_elpa(op2,{{'Isum','G'}});

op3(1).Isum = abs(op3(1).Isum);
op3(2).Isum = abs(op3(2).Isum);
op3(3).Isum = abs(op3(3).Isum);
op3(4).Isum = abs(op3(4).Isum);
%semilog_elpa(op3,{{'Isum','G'}});

op4(1).Isum = abs(op4(1).Isum);
op4(2).Isum = abs(op4(2).Isum);
op4(3).Isum = abs(op4(3).Isum);
op4(4).Isum = abs(op4(4).Isum);
%semilog_elpa(op4,{{'Isum','G'}});


%length(op1(1,1:2))

op01(1) = meu_merge(op1(1,1:2));
op01(2) = meu_merge(op1(1,3:4));

%op01(2).G = abs(op01(2).G);
%plot(op01(1).G,op01(1).Isum, fliplr(op01(2).G),op01(2).Isum);

%|Ib - Ir / Ir|
opAux.Isum = (op01(1).Isum - fliplr(op01(2).Isum)) ./ op01(2).Isum;

figure
plot(op01(1).G,abs(opAux.Isum));
%axis([-2 2 -1.5e-13 1e-13])
xlabel('V_{gs}(V)');
ylabel('I_{blue} - flip(I_{red}) / I_{red}');
legend('FBG-FET', 'Location', 'Best');

op02(1) = meu_merge(op2(1,1:2));
op02(2) = meu_merge(op2(1,3:4));

opAux.Isum = (op02(1).Isum - fliplr(op02(2).Isum)) ./ op02(2).Isum;

figure
plot(op02(1).G,abs(opAux.Isum));
%axis([-2 2 1.5e-13 1])
xlabel('V_{gs}(V)');
ylabel('I_{blue} - flip(I_{red}) / I_{red}');
legend('1G-FET', 'Location', 'Best');


op03(1) = meu_merge(op3(1,1:2));
op03(2) = meu_merge(op3(1,3:4));

%opAux.Isum = (op03(1).Isum(26:59) - fliplr(op03(2).Isum(1:34))) ./ op03(2).Isum;

opAux.Isum = (fliplr(op03(1).Isum(26:59)) - (op03(2).Isum)) ./ op03(2).Isum;
%opAuxT.Isum = (fliplr(op03(1).Isum(1:34)) - op03(2).Isum(1:34))

figure
plot(op03(1).G(26:59),abs(opAux.Isum));
xlabel('V_{gs}(V)');
ylabel('I_{blue} - flip(I_{red}) / I_{red}');
legend('2G-FET', 'Location', 'Best');

op04(1) = meu_merge(op4(1,1:2));
op04(2) = meu_merge(op4(1,3:4));

opAux.Isum = (op04(1).Isum - fliplr(op04(2).Isum)) ./ op04(2).Isum;

figure
plot(op04(1).G,abs(opAux.Isum));
xlabel('V_{gs}(V)');
ylabel('I_{blue} - flip(I_{red}) / I_{red}');
legend('3G-FET', 'Location', 'Best');