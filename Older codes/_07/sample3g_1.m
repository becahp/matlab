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


%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d24_10V_10V
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d16_10V_10V
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d16_gate_v1
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\3g\p_dir_3g_d16_gate_v2
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\00\p_dir_3g_d16_gate_v3

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\16

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\3g\p_dir_3g_d16_gate_v2
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\3g\p_dir_3g_d16_gate_v3

%%
%%%Read data and store it in a struct
op2 = [];		

aux = 2
%%%%%%%%%

if aux == 1 
%	4 p_dir_3g_d24_10V_10V : comparação com diametro 2.4	
op2 =  rdcelpa('p_dir_3g_d24_10V_10V/p_esq_3g_d24_10V_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_d24_10V_10V/p_dir_3g_d24_10V_10V_dd_iv.elpa','*',[],op2);

%	5 p_dir_3g_d16_10V_10V : comparação com diametro 1.6
op2 =  rdcelpa('p_dir_3g_d16_10V_10V/p_esq_3g_d16_10V_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_d16_10V_10V/p_dir_3g_d16_10V_10V_dd_iv.elpa','*',[],op2);
end


if aux == 2 
%	6 p_dir_3g_d16_gate_v1 : variação de gate (versão padrão)
op2 =  rdcelpa('p_esq_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_dd_iv.elpa','*',[],op2);

 %	7 p_dir_3g_d16_gate_v2 : variação de gate maior
op2 =  rdcelpa('p_dir_3g_d16_gate_v2/p_esq_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_d16_gate_v2/p_dir_3g_d16_gate_v2_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_3g_d16_gate_v3/p_esq_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_3g_d16_gate_v3/p_dir_3g_d16_gate_v3_dd_iv.elpa','*',[],op2);
end
	

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


op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);


figure
%h(1) = semilogy(dois(:,1),dois(:,2));

h(1) = semilogy(op2(1).V_g,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-2 2 0.1E-9 0.0001])

hold;
h(2) = semilogy(op2(2).V_g,op2(2).I_s );
h(3) = semilogy(op2(3).V_g,op2(3).I_s );
h(4) = semilogy(op2(4).V_g,op2(4).I_s );
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );

hold off;

%h(1).Marker = 'o';
%h(1).LineStyle = 'none';
%h(1).Color = map(1,:);

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);



if aux == 1
legend([h(1) h(3)],{'Dia = 2.4nm','Dia = 1.6nm'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')
end

if aux == 2
legend([h(1) h(3) h(5)],{'d_p = 100nm','d_p = 50nm','d_p = 25nm'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')
end


%% Calculos
%pegar V_g = 1 e V_g = -1
for i=1:6
corrente(1,i)=op2(i).V_g(16);
corrente(2,i) = op2(i).I_s(16);
end

for i=0:2
j = 1 + 2*i;
ion_ioff(i+1)=(corrente(2,j+1)/corrente(2,j)); %* 1e6;
end


