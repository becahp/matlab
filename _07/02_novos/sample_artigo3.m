clear;
close all; 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close all figures, and then repeat the first example.

%close all;
 
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
	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\04_artigoStandard\p_dir_artigo_d24_b000
	
	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v0
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v1
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v2
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v3
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v4
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v5
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v6
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v7
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v8
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\p_artigo_doping_v10
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\n_artigo_doping_v8
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\n_artigo_doping_v9
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\n_artigo_doping_v10
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\n_artigo_doping_v11
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\n_artigo_doping_v12
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\10_artigodopagem\n_artigo_doping_v13

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v18
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v21
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v22

%%
%%%Read data and store it in a struct
op2 = [];		

aux = 4
%%%%%%%%%

%padrao
op2 =  rdcelpa('p_dir_artigo_d24_b000/p_esq_artigo_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_artigo_d24_b000/p_dir_artigo_d24_b000_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('p_artigo_v18/p_artigo_v18_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /

if aux == 1
op2 =  rdcelpa('p_artigo_doping_v0/p_artigo_doping_v0_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /	d_con = 1e7
op2 =  rdcelpa('p_artigo_doping_v1/p_artigo_doping_v1_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /	d_con = 1e8
end

if aux == 2
op2 =  rdcelpa('p_artigo_doping_v2/p_artigo_doping_v2_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /	d_con = 1e7
op2 =  rdcelpa('p_artigo_doping_v3/p_artigo_doping_v3_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /	d_con = 5e7
op2 =  rdcelpa('p_artigo_doping_v4/p_artigo_doping_v4_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /	d_con = 1e8
end

if aux == 3
op2 =  rdcelpa('p_artigo_doping_v5/p_artigo_doping_v5_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 5e6
op2 =  rdcelpa('p_artigo_doping_v6/p_artigo_doping_v6_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e6
op2 =  rdcelpa('p_artigo_doping_v7/p_artigo_doping_v7_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e4
end

if aux == 123
op2 =  rdcelpa('p_artigo_doping_v6/p_artigo_doping_v6_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e6
op2 =  rdcelpa('p_artigo_doping_v5/p_artigo_doping_v5_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 5e6
op2 =  rdcelpa('p_artigo_doping_v2/p_artigo_doping_v2_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /	d_con = 1e7

op2 =  rdcelpa('n_artigo_doping_v8/n_artigo_doping_v8_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e6
op2 =  rdcelpa('n_artigo_doping_v9/n_artigo_doping_v9_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 5e6
op2 =  rdcelpa('n_artigo_doping_v10/n_artigo_doping_v10_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e7
end

if aux == 4
op2 =  rdcelpa('n_artigo_doping_v10/n_artigo_doping_v10_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e7

op2 =  rdcelpa('n_artigo_doping_v11/n_artigo_doping_v11_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e7 sb = -0.1
op2 =  rdcelpa('n_artigo_doping_v12/n_artigo_doping_v12_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e7 sb = -0.2
end


%op2 =  rdcelpa('p_artigo_doping_v9_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = -1e9

op2 =  rdcelpa('p_artigo_doping_v7/p_artigo_doping_v7_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = -1e9

op2 =  rdcelpa('p_artigo_doping_v10/p_artigo_doping_v10_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = -9e9


op2 =  rdcelpa('n_artigo_doping_v12/n_artigo_doping_v12_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e7 sb = -0.2

%op2 =  rdcelpa('n_artigo_doping_v13/n_artigo_doping_v13_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	d_con = 1e10




%dois = csvread('segundacurva2.csv');
tres = csvread('terceiro.csv');

%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.Isum, op1.G);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
%op2(6).I_s = abs(op2(6).I_s);
%op2(7).I_s = abs(op2(7).I_s);
%op2(8).I_s = abs(op2(8).I_s);
%op2(9).I_s = abs(op2(9).I_s);


%op2(1).V_g = op2(1).V_g + 0.02;
%op2(2).V_g = op2(2).V_g + 0.02;
%op2(3).V_g = op2(3).V_g + 0.02;
%op2(4).V_g = op2(4).V_g + 0.02;
%op2(5).V_g = op2(5).V_g + 0.02;  %+ 0.09;
%op2(6).V_g = op2(6).V_g + 0.01;  %+ 0.09;



figure
h(1) = semilogy(tres(:,1),tres(:,2));

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 2 0.1E-11 0.0001])


op2(3).I_s  = wrev(op2(3).I_s );
op2(4).I_s  = wrev(op2(4).I_s );
op2(5).I_s  = wrev(op2(5).I_s );

hold;
h(2) = semilogy(op2(1).V_g,op2(1).I_s );
h(3) = semilogy(op2(2).V_g,op2(2).I_s );
h(4) = semilogy(op2(3).V_g,op2(3).I_s );
h(5) = semilogy(op2(4).V_g,op2(4).I_s );

h(6) = semilogy(op2(5).V_g,op2(5).I_s );
%h(7) = semilogy(op2(6).V_g,op2(6).I_s );
%h(8) = semilogy(op2(7).V_g,op2(7).I_s );
%h(9) = semilogy(op2(8).V_g,op2(8).I_s );
%h(10) = semilogy(op2(9).V_g,op2(9).I_s );


%hold off;

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(2,:);

h(4).Color = map(3,:);
h(5).Color = map(4,:);
h(6).Color = map(5,:);
%h(7).Color = 'y';


legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838  v_{sat}=0.8e+06  beta=0.54375; d_{con} = -1e9','d_{con} = -9e9', 'n type d_{con} = 1e7, sb = -0.2'}, 'Location', 'southwest');


if aux == 123
h(4).Color = map(3,:);
h(5).Color = map(4,:);
h(6).Color = map(5,:);

h(7).Color = map(3,:);
h(8).Color = map(4,:);
h(9).Color = map(5,:);

h(7).LineStyle = '--';
h(8).LineStyle = '--';
h(9).LineStyle = '--';

legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.4595, v_{sat} = 8e+06, beta=0.725','mu_0=0.68925, v_{sat} = 8e+06, beta=0.3625','mu_0=0.68925, v_{sat} = 8e+06, beta=0.54375'}, 'Location', 'southwest');

legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','1e6','5e6','1e7'}, 'Location', 'southwest');
end



if aux == 1
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.725','1e7','1e8'}, 'Location', 'southwest');
end

if aux == 2
legend([h(1) h(2) h(4) h(5) h(6) h(7)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375','1e7','5e7','1e8'}, 'Location', 'southwest');
end

if aux == 3
legend([h(1) h(2) h(4) h(5) h(6) h(7)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375','5e6','1e6','1e4'}, 'Location', 'southwest');
end

if aux == 4
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838  v_{sat}=0.8e+06  beta=0.54375; d_{con} = 1e7','sb = -0.1','sb = -0.2'}, 'Location', 'southwest');
end


legend('boxoff')


