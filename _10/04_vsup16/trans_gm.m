%function [ss,Ion_Ioff,Ion_I0]=all

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_10_revisao\08_vsup16\00_trans

clear all
close all
clc

map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];

%%
%%%Read data and store it in a struct
op2 = [];	
op2 =  rdcelpa('n_1g_vsup16_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(1).x,op(1).y] = plot_elpa_gm_v30(op2,'n');


op2 = [];	
op2 =  rdcelpa('n_fbg_vsup16_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(2).x,op(2).y] = plot_elpa_gm_v30(op2,'n');

op2 = [];	
op2 =  rdcelpa('n_2g_vsup16_dd_iv.elpa','*',[],op2);
op2 = restringeOp(op2); 
[op(3).x,op(3).y] = plot_elpa_gm_v30(op2,'n');


figure
h(1) = plot(op(1).x,op(1).y);

xlabel('V_{gs} (V)')
ylabel('g_m (\muS)')
%axis([0 1.5 0 10]);

hold
h(2) = plot(op(2).x,op(2).y);
h(3) = plot(op(3).x,op(3).y);

hold off;

h(1).Color  = map(1,:);
h(2).Color  = map(2,:);
h(3).Color  = map(3,:);

legend({'1G','FBG','2G'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')

i = 1;
gm(i) = op(i).y(find(op(i).x>=0.8 & op(i).x<=0.84)); %1G
i = i + 1;
gm(i) = op(i).y(find(op(i).x>=0.8 & op(i).x<=0.84)); %FBG
i = i + 1;
gm(i) = op(i).y(find(op(i).x>=0.8 & op(i).x<=0.84)); %2G

%gm
%1G					FBG					2G
%2.97284837722964	4.65277633448958	5.25294185893970