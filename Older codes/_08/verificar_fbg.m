% calculo de resistencia para vsup
clear;
%close all; 

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


	
%antigo
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\04_meff_output\FBG

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\03_meff_transfer\FBG


%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V


	

pule = 1;
if pule == 1
for aux = 1:4

op2 = [];
if aux == 1	%saida
op2 = rdcelpa('fbg/n_fbg_meff_04_vsup_ron_dd_iv.elpa','*',[],op2);

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on
xlabel('V_{ds} (V)')
ylabel('I_{ds} (A)')
grid on

i = 1;
maximo(i) = find(op2(i).V_d>=1.0,1);
if (maximo(i) == 0) || (maximo(i) == 1)
	op2(i).V_d = wrev(op2(i).V_d);
	op2(i).I_d = wrev(op2(i).I_d);
end

indice_out = find(op2(i).V_d>=1.5 & op2(i).V_d<=2); %para fbg
p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);

f1 = polyval(p_out, op2(i).V_d(indice_out));

h(2) = plot(op2(i).V_d(indice_out),f1,'k--');

r_out = 1/p_out(1)
end

if aux == 2	%transferencia

op2 = rdcelpa('fbg/n_fbg_vsup_meff_04_dd_iv.elpa','*',[],op2);

op2(1).I_s = abs(op2(1).I_s);
%op2(2).I_s = abs(op2(2).I_s);

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op2(1).V_g,op2(1).I_d );
hold on
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%grid on
%h(2) = semilogy(op2(2).V_g,op2(2).I_d );

%h(1).Color  = map(1,:);
%h(2).Color  = map(1,:);

legend({'fbg'});

end

if aux ==  3   %ganho
op2 = rdcelpa('fbg/n_fbg_vsup_meff_04_dd_iv.elpa','*',[],op2);

%op2 = restringeOp(op2); 

[op(1).x,op(1).y] =plot_elpa_gm_v30(op2,'n');

%[gm3G(i).x,gm3G(i).y] = plot_elpa_gm_v30(op2(i));
%gms(aux, i) = gm3G(i).y(find(gm3G(i).x>=0.6 & gm3G(i).x<=0.64)); %encontrar gm em (0.6,0.6)

oi = op(1).y(find(op(1).x>=0.6 & op(1).x<=0.64)) * 1e-6;

g_intrinseco = r_out * oi

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op(1).x,op(1).y);

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('g_m (\muS)')
%axis([-0.5 2 0 1.2*10]);
%axis([0 1.5 0 10]);
legend({'fbg'});
end









end %plotar





%%%% teste
% i = 5
% indice_out = find(op2(i).V_d>=0.9 & op2(i).V_d<=1.1);
% p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);
% r_out = 1/p_out(1);


end %for


