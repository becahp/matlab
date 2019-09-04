addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\12
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\09

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

op2 =  rdcelpa('09/p_esq_fet_dreno_382_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('09/p_dir_fet_dreno_382_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_esq_fet_dreno_384_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_dir_fet_dreno_384_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_esq_fet_dreno_386_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_dir_fet_dreno_386_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_esq_fet_dreno_388_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_dir_fet_dreno_388_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_esq_fet_dreno_390_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_dir_fet_dreno_390_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_esq_fet_dreno_392_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('12/p_dir_fet_dreno_392_bbt1_dd_iv.elpa','*',[],op2);



dois = csvread('segundacurva2.csv');
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


op2(1).Isum = abs(op2(1).Isum);
op2(2).Isum = abs(op2(2).Isum);
op2(3).Isum = abs(op2(3).Isum);
op2(4).Isum = abs(op2(4).Isum);
op2(5).Isum = abs(op2(5).Isum);
op2(6).Isum = abs(op2(6).Isum);
op2(7).Isum = abs(op2(7).Isum);
op2(8).Isum = abs(op2(8).Isum);
op2(9).Isum = abs(op2(9).Isum);
op2(10).Isum = abs(op2(10).Isum);
op2(11).Isum = abs(op2(11).Isum);
op2(12).Isum = abs(op2(12).Isum);
%semilog_elpa(op2,{{'Isum','G'}});

op2(1).G = op2(1).G - 0.25;
op2(2).G = op2(2).G - 0.25;
op2(3).G = op2(3).G - 0.25;
op2(4).G = op2(4).G - 0.25;
op2(5).G = op2(5).G - 0.25;
op2(6).G = op2(6).G - 0.25;
op2(7).G = op2(7).G - 0.25;
op2(8).G = op2(8).G - 0.25;
op2(9).G = op2(9).G - 0.25;
op2(10).G = op2(10).G - 0.25;
op2(11).G = op2(11).G - 0.25;
op2(12).G = op2(12).G - 0.25;



figure
h(1) = semilogy(dois(:,1),dois(:,2));
set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-1.5 1 0.1E-11 0.0001])

hold;
h(2) = semilogy(op2(1).G,op2(1).Isum );
h(3) = semilogy(op2(2).G,op2(2).Isum );
h(4) = semilogy(op2(3).G,op2(3).Isum );
h(5) = semilogy(op2(4).G,op2(4).Isum );
h(6) = semilogy(op2(5).G,op2(5).Isum );
h(7) = semilogy(op2(6).G,op2(6).Isum );
h(8) = semilogy(op2(7).G,op2(7).Isum );
h(9) = semilogy(op2(8).G,op2(8).Isum );
h(10) = semilogy(op2(9).G,op2(9).Isum );
h(11) = semilogy(op2(10).G,op2(10).Isum );
h(12) = semilogy(op2(11).G,op2(11).Isum );
h(13) = semilogy(op2(12).G,op2(12).Isum );


%h(2).Color = 'r';
%h(3).Color = 'r';
%h(4).Color = 'k';
%h(5).Color = 'k';
%h(6).Color = 'c';
%h(7).Color = 'c';
%h(8).Color = 'y';
%h(9).Color = 'y';


h(2).Color = 'r';
h(3).Color = 'r';
h(4).Color = [1    0.6  0 ]; %orange
h(5).Color = [1    0.6  0 ]; %orange
h(6).Color = 'y';
h(7).Color = 'y';
h(8).Color = 'g';
h(9).Color = 'g';
h(10).Color = 'c';
h(11).Color = 'c';
h(12).Color = 'b';
h(13).Color = 'b';
%h(13).Color = [0.5  0    0.9 ];
%h(14).Color = [0.5  0    0.9 ];
%h(15).Color = 'm';
%h(16).Color = 'm';


%legend([h(1) h(2) h(4) h(6) h(8) h(10) h(12)],{'Segunda curva do artigo','Gate = 382nm, bbt = 1','Gate = 384nm, bbt = 1','Gate = 386nm, bbt = 1','Gate = 388nm, bbt = 1','Gate = 390nm, bbt = 1','Gate = 392nm, bbt = 1'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend([h(1) h(2) h(4) h(6) h(8) h(10) h(12)],{'Segunda curva','Gate = 382nm','Gate = 384nm','Gate = 386nm','Gate = 388nm','Gate = 390nm','Gate = 392nm'}, 'Location', 'best');  % Only the blue and green lines appear in the legend


%legend({'Artigo','Simulado'},'Location','south')



%figure
%h = semilogy(tres(:,1),tres(:,2));
%set(h,'linewidth',2)
%hold;
%mugbeta
%semilogy(op5(3).G,op5(3).Isum );
%semilogy(op5(4).G,op5(4).Isum );
%%vd15
%semilogy(op2(3).G,op2(3).Isum );
%semilogy(op2(4).G,op2(4).Isum );

%semilogy(op7(1).G,op7(1).Isum );
%semilogy(op7(2).G,op7(2).Isum );
%semilogy(op2(1).G,op2(4).Isum );
%semilogy(op2(1).G,op2(5).Isum );

%semilogy(op1(1).G,op1(1).Isum );
%semilogy(op1(2).G,op1(2).Isum );


%%
%%%Save selected data for further postprocessing (e.g. visualization with 
%%%another program 

%elp.title='';
%elp.var_names={'G','Isum','Isum','Isum'};
%elp.mat=[op(1).G,op(1).Isum,op(2).Isum,op(3).Isum];
%save_elpa('test_current.elpa',elp);

%elp.title='';
%elp.var_names={'D','Isum'};
%elp.mat=[op3(1).G1,op3(1).Isum];
%save_elpa('test_current.elpa',elp);


