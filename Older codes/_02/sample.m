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
op5 = [];		
op6 = [];		
op7 = [];		
op8 = [];		

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


%%All of them
op7 =  rdcelpa('01/n_esq_fbg_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01/n_dir_fbg_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01/p_esq_fbg_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01/p_dir_fbg_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('03/n_esq_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/n_dir_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/p_esq_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/p_dir_2g_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('04/n_esq_3g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('04/n_dir_3g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('04/p_esq_3g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('04/p_dir_3g_dd_iv.elpa','*',[],op7);

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

op1(1).Isum = abs(op1(1).Isum);
op1(2).Isum = abs(op1(2).Isum);
op1(3).Isum = abs(op1(3).Isum);
op1(4).Isum = abs(op1(4).Isum);
semilog_elpa(op1,{{'Isum','G'}});

op2(1).Isum = abs(op2(1).Isum);
op2(2).Isum = abs(op2(2).Isum);
op2(3).Isum = abs(op2(3).Isum);
op2(4).Isum = abs(op2(4).Isum);
semilog_elpa(op2,{{'Isum','G'}});

op3(1).Isum = abs(op3(1).Isum);
op3(2).Isum = abs(op3(2).Isum);
op3(3).Isum = abs(op3(3).Isum);
op3(4).Isum = abs(op3(4).Isum);
semilog_elpa(op3,{{'Isum','G'}});

op4(1).Isum = abs(op4(1).Isum);
op4(2).Isum = abs(op4(2).Isum);
op4(3).Isum = abs(op4(3).Isum);
op4(4).Isum = abs(op4(4).Isum);
semilog_elpa(op4,{{'Isum','G'}});

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

hold off;

h(1).Color  = 'r'; %'r';
h(2).Color  = 'r'; %'r';
h(3).Color  = 'r'; %[1    0.6  0 ]; %orange
h(4).Color  = 'r'; %[1    0.6  0 ]; %orange
h(5).Color  = 'b'; %'y';
h(6).Color  = 'b'; %'y';
h(7).Color  = 'b'; %'g';
h(8).Color  = 'b'; %'g';
h(9).Color  = 'c'; %'c';
h(10).Color = 'c'; %'c';
h(11).Color = 'c'; %'b';
h(12).Color = 'c'; %'b';
h(13).Color = 'k'; %[0.5  0    0.9 ]; %purple
h(14).Color = 'k'; %[0.5  0    0.9 ]; %purple
h(15).Color = 'k'; %'m';
h(16).Color = 'k'; %'m';

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
print('4estruturas', '-depsc')

% figure
% h(1) = semilogy(tres(:,1),tres(:,2));
% set(h,'linewidth',2)
% xlabel('V_{gs} (V)')
% ylabel('I_{ds} (A)')
% hold;

%h(2) = semilogy(op2(1).G,op2(1).Isum );
%h(3) = semilogy(op2(2).G,op2(2).Isum );
%h(4) = semilogy(op2(3).G,op2(3).Isum );
%h(5) = semilogy(op2(4).G,op2(4).Isum );
%h(6) = semilogy(op1(1).G,op1(1).Isum );
%h(7) = semilogy(op1(2).G,op1(2).Isum );
%h(8) = semilogy(op1(3).G,op1(3).Isum );
%h(9) = semilogy(op1(4).G,op1(4).Isum );

%h(2).Color = 'r';
%h(3).Color = 'r';
%h(4).Color = 'k';
%h(5).Color = 'k';
%h(6).Color = 'c';
%h(7).Color = 'c';
%h(8).Color = 'y';
%h(9).Color = 'y';


%legend([h(1) h(3) h(5)],{'Artigo','Simulado com bbt = 0', 'Simulado com bbt = 1'});  % Only the blue and green lines appear in the legend
%legend({'Artigo','Simulado'},'Location','south')

