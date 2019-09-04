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

op0 = []; 		
op01 = [];
op02 = [];	
op03 = [];		
op04 = [];		
op05 = [];		
op06 = [];		
op07 = [];		
op08 = [];	
%op8 = [];	
%op9 = [];	

%%%%%%%%%
%%ballbte
op0 =  rdcelpa('cnt-fet_p_bb_vstefan_ball_iv.elpa','*',[],op0);
%op0 =  rdcelpa('bb/reconfig_p_2bb_ball_iv.elpa','*',[],op0);

%%duas bandas com mug/beta diferentes
op =  rdcelpa('cnt-fet_p_bb_v2_ball_iv.elpa','*',[],op);
op =  rdcelpa('cnt-fet_p_dd_v2_dd_iv.elpa','*',[],op);
%op =  rdcelpa('duasb/reconfig_n_coosv20_v15_padrao_dd_iv.elpa','*',[],op);
%op =  rdcelpa('duasb/reconfig_p_coosv20_v15_padrao_dd_iv.elpa','*',[],op);

%op7 =  rdcelpa('p_dir_vsat_model_var3_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('p_esq_vsat_model_var3_dd_iv.elpa','*',[],op7);

%primeiro = csvread('primeiro.csv');
%segundo = csvread('segundo.csv');
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

%bandas de energia
%plot_elpa_b(op4,{{'fx','x'}});
%plot_elpa_b(op04,{{'fx','x'}});
%plot_elpa_b(op06,{{'cb1','vb1','x'}});
%plot_elpa_b(op3,{{'cb1','vb1','x'}});
%plot_elpa_b(op4,{{'cb1','vb1','x'}});

op0(1).Isum = abs(op0(1).Isum);
%op0(2).Isum = abs(op0(2).Isum);
%op0(3).Isum = abs(op0(3).Isum);
%op0(4).Isum = abs(op0(4).Isum);
semilog_elpa(op0,{{'Isum','G'}});

op(1).Isum = abs(op(1).Isum);
op(2).Isum = abs(op(2).Isum);
%op(3).Isum = abs(op(3).Isum);
%op(4).Isum = abs(op(4).Isum);
%op(5).Isum = abs(op(5).Isum);
%op(6).Isum = abs(op(6).Isum);
%plot_elpa(op,{{'Isum','G'}});
semilog_elpa(op,{{'Isum','G'}});

%op1(1).Isum = abs(op1(1).Isum);
%op1(2).Isum = abs(op1(2).Isum);
%op1(3).Isum = abs(op1(3).Isum);
%op1(4).Isum = abs(op1(4).Isum);
%semilog_elpa(op1,{{'Isum','G'}});
%
%op2(1).Isum = abs(op2(1).Isum);
%op2(2).Isum = abs(op2(2).Isum);
%op2(3).Isum = abs(op2(3).Isum);
%op2(4).Isum = abs(op2(4).Isum);
%op2(5).Isum = abs(op2(5).Isum);
%op2(6).Isum = abs(op2(6).Isum);
%op2(7).Isum = abs(op2(7).Isum);
%plot_elpa(op2,{{'Isum','G'}});
%semilog_elpa(op2,{{'Isum','G'}});


%%beta
%op5(1).Isum = abs(op5(1).Isum);
%op5(2).Isum = abs(op5(2).Isum);
%op5(3).Isum = abs(op5(3).Isum);
%op5(4).Isum = abs(op5(4).Isum);
%op5(5).Isum = abs(op5(5).Isum);
%op5(6).Isum = abs(op5(6).Isum);
%op5(7).Isum = abs(op5(7).Isum);
%plot_elpa(op5,{{'Isum','G'}});
%semilog_elpa(op5,{{'Isum','G'}});

%op05(1).Isum = abs(op05(1).Isum);
%op05(2).Isum = abs(op05(2).Isum);
%plot_elpa(op05,{{'Isum','G'}});
%semilog_elpa(op05,{{'Isum','G'}})



%op6(1).Isum = abs(op6(1).Isum);
%op6(2).Isum = abs(op6(2).Isum);
%plot_elpa(op6,{{'Isum','G'}});
%semilog_elpa(op6,{{'Isum','G'}})

%op06(1).Isum = abs(op06(1).Isum);
%op06(2).Isum = abs(op06(2).Isum);
%plot_elpa(op06,{{'Isum','G'}});
%semilog_elpa(op06,{{'Isum','G'}})


%op7(1).Isum = abs(op7(1).Isum);
%op7(2).Isum = abs(op7(2).Isum);
%plot_elpa(op7,{{'Isum','G'}});
%semilog_elpa(op7,{{'Isum','G'}});

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


