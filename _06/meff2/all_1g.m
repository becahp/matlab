%function [ss,Ion_Ioff,Ion_I0]=all

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\1g

clear all
close all
clc

%%
%%%Read data and store it in a struct
op = []; 		
op7 = [];	

%%%%%%%%%
%%1g-FET
%op7 =  rdcelpa('02/n_esq_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('02/n_dir_dd_iv.elpa','*',[],op7);


%% 
i = 1;
op7 = [];
op7 = rdcelpa('1g/n_esq_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_004_dd_iv.elpa','*',[],op7);

%peak_gm(i) = plot_elpa_gmp(op7);
ss(i) = subslope31(op7,2,5,1); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;



%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_01_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_01_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,6,1); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_02_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_02_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,8,2); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_03_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_03_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,8,2); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_04_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_04_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,8,2); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_05_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_05_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,9,3); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_06_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_06_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,9,4); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_07_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_07_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,8,4); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_08_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_08_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,10,4); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_09_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_09_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,10,4); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;

%%
i = i + 1;

op7 = [];
op7 = rdcelpa('1g/n_esq_meff_10_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('1g/n_dir_meff_10_dd_iv.elpa','*',[],op7);

ss(i) = subslope31(op7,2,10,4); %1g

[x,y] = plot_elpa_gm(op7,'n');
peak_gm(i) = max(y); 

Ioff = op7(1).Isum(13);	%Ioff
Ion = op7(2).Isum(13);	%Ion
I0 = op7(1).Isum(1);	%Ioff_0

Ion_Ioff(i) = Ion/Ioff;
Ion_I0(i) = Ion/I0;


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

% meff = [4.914666977601574E-002, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

% figure
% plot(meff, ss); %acrescentar marker points

% figure
% plot(meff, Ion_Ioff); %acrescentar marker points

% figure
% plot(meff, Ion_I0); %acrescentar marker points

%%%%% Grafico gmpeak (TODO)
%[op(i).x,op(i).y] = plot_elpa_gm(op7,'n');
% figure
% % h(1) = semilogy(tres(:,1),tres(:,2));
% h(1) = semilogy(op(1).x,op(1).y);

% % set(h,'linewidth',2)
% % axis([-1.5 1.5 0.1E-10 0.0001])
% % axis([-1.5 1.5 0.1E-5 0.0001])

% xlabel('V_{gs} (V)')
% ylabel('g_m (\muS)')
% % axis([-0.5 2 0 1.2*10]);
% hold

% h(2) = semilogy(op(2).x,op(2).y);
% h(3) = semilogy(op(3).x,op(3).y);
% h(4) = semilogy(op(4).x,op(4).y);
% h(5) = semilogy(op(5).x,op(5).y);
% h(6) = semilogy(op(6).x,op(6).y);
% h(7) = semilogy(op(7).x,op(7).y);
% h(8) = semilogy(op(8).x,op(8).y);
% h(9) = semilogy(op(9).x,op(9).y);
% h(10) = semilogy(op(10).x,op(10).y);
% h(11) = semilogy(op(11).x,op(11).y);

% hold off;

% legend('0.05', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1.0')

