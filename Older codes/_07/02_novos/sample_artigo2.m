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
	
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v0
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v1
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v2
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v3
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v4
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v5
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v6
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v7

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v18
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v19
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v20
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v21
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v22

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v23
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v24
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v25
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v26
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v27
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v28
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v29
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\06_artigo\p_artigo_v30


%%
%%%Read data and store it in a struct
op2 = [];		

aux = 1111
%%%%%%%%%

%padrao
op2 =  rdcelpa('p_dir_artigo_d24_b000/p_esq_artigo_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_artigo_d24_b000/p_dir_artigo_d24_b000_dd_iv.elpa','*',[],op2);

%variacao beta
if aux == 1
op2 =  rdcelpa('p_artigo_v3/p_artigo_v3_dd_iv.elpa','*',[],op2); %&MOB_DEF mu_0=1.838  v_sat=9e+05  beta=0.3625 /

op2 =  rdcelpa('p_artigo_v0/p_artigo_v0_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=9e+05  beta=0.6625 /
op2 =  rdcelpa('p_artigo_v1/p_artigo_v1_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=9e+05  beta=0.725 /
op2 =  rdcelpa('p_artigo_v2/p_artigo_v2_dd_iv.elpa','*',[],op2); %&MOB_DEF mu_0=1.838  v_sat=9e+05  beta=0.85 /

end
%
if aux == 2
op2 =  rdcelpa('p_artigo_v4/p_artigo_v4_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.919  v_sat=9e+05  beta=0.725 /
op2 =  rdcelpa('p_artigo_v1/p_artigo_v1_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=9e+05  beta=0.725 /
op2 =  rdcelpa('p_artigo_v5/p_artigo_v5_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=9e+05  beta=0.725 /

%op2 =  rdcelpa('p_artigo_v6/p_artigo_v6_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=9e+05  beta=1 /
%op2 =  rdcelpa('p_artigo_v7/p_artigo_v7_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=9e+05  beta=1 /
end

if aux == 3
%op2 =  rdcelpa('p_artigo_v8/p_artigo_v8_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.919  v_sat=8e+06  beta=0.725 /
%op2 =  rdcelpa('p_artigo_v9/p_artigo_v9_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=8e+06  beta=0.725 /
%op2 =  rdcelpa('p_artigo_v10/p_artigo_v10_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=8e+06  beta=0.725 /
end 

if aux == 4
op2 =  rdcelpa('p_artigo_v12/p_artigo_v12_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.4595  v_sat=8e+06  beta=0.54375/
op2 =  rdcelpa('p_artigo_v11/p_artigo_v11_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.4595  v_sat=8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v8/p_artigo_v8_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.919  v_sat=8e+06  beta=0.725 /
end

if aux == 5
%op2 =  rdcelpa('p_artigo_v11/p_artigo_v11_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.4595  v_sat=8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v14/p_artigo_v14_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.68925  v_sat=8e+06  beta=0.54375/
op2 =  rdcelpa('p_artigo_v13/p_artigo_v13_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.68925  v_sat=8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v8/p_artigo_v8_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.919  v_sat=8e+06  beta=0.725 /
end

if aux == 6
op2 =  rdcelpa('p_artigo_v15/p_artigo_v15_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.68925  v_sat=8e+06  beta=0.3625/
op2 =  rdcelpa('p_artigo_v14/p_artigo_v14_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.68925  v_sat=8e+06  beta=0.54375/
op2 =  rdcelpa('p_artigo_v13/p_artigo_v13_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.68925  v_sat=8e+06  beta=0.725 /
end

if aux == 7
op2 =  rdcelpa('p_artigo_v15/p_artigo_v15_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.68925  v_sat=8e+06  beta=0.3625/
op2 =  rdcelpa('p_artigo_v8/p_artigo_v8_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=0.919  v_sat=8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v16/p_artigo_v16_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=8e+06  beta=0.3625 /
end

if aux == 8
op2 =  rdcelpa('p_artigo_v17/p_artigo_v17_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.3625/
op2 =  rdcelpa('p_artigo_v18/p_artigo_v18_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v19/p_artigo_v19_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=0.8e+06  beta=0.3625 /
%op2 =  rdcelpa('p_artigo_v20/p_artigo_v20_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=0.8e+06  beta=0.725 /
end

if aux == 9
op2 =  rdcelpa('p_artigo_v18/p_artigo_v18_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v21/p_artigo_v21_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /
op2 =  rdcelpa('p_artigo_v22/p_artigo_v22_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=0.8e+06  beta=0.54375 /
end

if aux == 10
op2 =  rdcelpa('p_artigo_v18/p_artigo_v18_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.725 /
op2 =  rdcelpa('p_artigo_v21/p_artigo_v21_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /
op2 =  rdcelpa('p_artigo_v22/p_artigo_v22_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=3.676  v_sat=0.8e+06  beta=0.54375 /
end

%op2 =  rdcelpa('p_artigo_v23/p_artigo_v23_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.1
%op2 =  rdcelpa('p_artigo_v24/p_artigo_v24_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.2
%op2 =  rdcelpa('p_artigo_v25/p_artigo_v25_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.3
op2 =  rdcelpa('p_artigo_v26/p_artigo_v26_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.4
%op2 =  rdcelpa('p_artigo_v27/p_artigo_v27_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.41
%op2 =  rdcelpa('p_artigo_v28/p_artigo_v28_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.45
op2 =  rdcelpa('p_artigo_v29/p_artigo_v29_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.4
op2 =  rdcelpa('p_artigo_v30_dd_iv.elpa','*',[],op2);  %&MOB_DEF mu_0=1.838  v_sat=0.8e+06  beta=0.54375 /	sb = -0.4


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
axis([-1.5 2 0.1E-11 0.0001])


hold;
h(2) = semilogy(op2(1).V_g,op2(1).I_s );
h(3) = semilogy(op2(2).V_g,op2(2).I_s );
h(4) = semilogy(op2(3).V_g,op2(3).I_s );
h(5) = semilogy(op2(4).V_g,op2(4).I_s );
h(6) = semilogy(op2(5).V_g,op2(5).I_s );
%h(7) = semilogy(op2(6).V_g,op2(6).I_s );


%hold off;

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(2,:);
h(4).Color = map(3,:);
h(5).Color = map(4,:);
h(6).Color = map(5,:);
%h(7).Color = map(6,:);


%legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','beta=0.3625','beta=0.6625','beta=0.725','beta=0.85'}, 'Location', 'southwest');  % Only the blue and green lines appear in the legend
if aux == 1
legend([h(1) h(2) h(4) h(5) h(6) h(7)],{'Experimental','v_{sat} = 6.25e+05, beta=0.3625','v_{sat} = 9e+05, beta=0.3625','v_{sat} = 9e+05, beta=0.6625','v_{sat} = 9e+05, beta=0.725','v_{sat} = 9e+05, beta=0.85'}, 'Location', 'southwest');  % Only the blue and green lines appear in the legend
end
if aux == 2
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.919, v_{sat} = 9e+05, beta=0.725','mu_0=1.838, v_{sat} = 9e+05, beta=0.725','mu_0=3.676, v_{sat} = 9e+05, beta=0.725'}, 'Location', 'southwest');
end

if aux == 3
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.919, v_{sat} = 8e+06, beta=0.725','mu_0=1.838, v_{sat} = 8e+06, beta=0.725','mu_0=3.676, v_{sat} = 8e+06, beta=0.725'}, 'Location', 'southwest');
end

if aux == 4
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.4595, v_{sat} = 8e+06, beta=0.54375','mu_0=0.4595, v_{sat} = 8e+06, beta=0.725','mu_0=0.919, v_{sat} = 8e+06, beta=0.725'}, 'Location', 'southwest');
end

if aux == 5
%legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.4595, v_{sat} = 8e+06, beta=0.725','mu_0=0.68925, v_{sat} = 8e+06, beta=0.54375','mu_0=0.68925, v_{sat} = 8e+06, beta=0.725'}, 'Location', 'southwest');
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.68925, v_{sat} = 8e+06, beta=0.54375','mu_0=0.68925, v_{sat} = 8e+06, beta=0.725','mu_0=0.919, v_{sat} = 8e+06, beta=0.725'}, 'Location', 'southwest');
end

if aux == 6
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.68925, v_{sat} = 8e+06, beta=0.3625','mu_0=0.68925, v_{sat} = 8e+06, beta=0.54375','mu_0=0.68925, v_{sat} = 8e+06, beta=0.725'}, 'Location', 'southwest');
end

if aux == 7
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=0.68925, v_{sat} = 8e+06, beta=0.3625','mu_0=0.919, v_{sat} = 8e+06, beta=0.725','mu_0=1.838, v_{sat} = 8e+06, beta=0.3625'}, 'Location', 'southwest');
end

if aux == 8
%legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.725','mu_0=3.676, v_{sat} = 0.8e+06, beta=0.725'}, 'Location', 'southwest');

legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.725','mu_0=3.676, v_{sat} = 0.8e+06, beta=0.3625'}, 'Location', 'southwest');


end
if aux == 9
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.725','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375','mu_0=3.676, v_{sat} = 0.8e+06, beta=0.54375'}, 'Location', 'southwest');
end


legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375, sb = -0.1','sb = -0.2','sb = -0.3'}, 'Location', 'southwest');
legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375, sb = -0.2','sb = -0.3','sb = -0.4'}, 'Location', 'southwest');

legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375, sb = -0.4','sb = -0.41','sb = -0.45'}, 'Location', 'southwest');

legend([h(1) h(2) h(4) h(5) h(6)],{'Experimental','mu_0=1.838, v_{sat} = 6.25e+05, beta=0.3625','mu_0=1.838, v_{sat} = 0.8e+06, beta=0.54375, sb = -0.4','sb = -0.45','sb = -0.4, n_{sub} = 2'}, 'Location', 'southwest');

legend('boxoff')
