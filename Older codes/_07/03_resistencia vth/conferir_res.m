clear;
close all;

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\1G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\2G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\3G
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\FBG
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\05_meffsaida\re

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g

	   
map = [0, 0, 1
    0, 0.5, 0
    1, 0, 0
    0, 0.75, 0.75
    0.75, 0, 0.75];
	
%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V

%aux = 1;

for aux=1:4
op2 = [];
if aux == 1
op2 = rdcelpa('re/n_1g_meff_004_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('1G/n_1g_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('1G/n_1g_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 2
op2 = rdcelpa('re/n_fbg_meff_004_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('FBG/n_fbg_meff_01_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('FBG/n_fbg_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 3
op2 = rdcelpa('re/n_2g_meff_004_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('re/n_2g_meff_01_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('2G/n_2g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_04_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('2G/n_2g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('2G/n_2g_meff_10_dd_iv.elpa','*',[],op2);
end

if aux == 4
op2 = rdcelpa('3G/n_3g_meff_004_dd_iv.elpa','*',[],op2); 
op2 = rdcelpa('re/n_3g_meff_01_dd_iv.elpa','*',[],op2); %
op2 = rdcelpa('3G/n_3g_meff_02_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_03_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_04_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_05_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_06_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_07_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_08_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_09_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_10_dd_iv.elpa','*',[],op2);
end

op2(1).I_d = op2(1).I_d * 1e6;
op2(2).I_d = op2(2).I_d * 1e6;
op2(3).I_d = op2(3).I_d * 1e6;
op2(4).I_d = op2(4).I_d * 1e6;
op2(5).I_d = op2(5).I_d * 1e6;
op2(6).I_d = op2(6).I_d * 1e6;
op2(7).I_d = op2(7).I_d * 1e6;
op2(8).I_d = op2(8).I_d * 1e6;
op2(9).I_d = op2(9).I_d * 1e6;
op2(10).I_d = op2(10).I_d * 1e6;
op2(11).I_d = op2(11).I_d * 1e6;

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
%h(1) = plot(op2(1).V_d(op2(1).n_iter>0),op2(1).I_d(op2(1).n_iter>0) );
h(1) = plot(op2(1).V_d,op2(1).I_d );
hold on
xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')
grid on
h(2) = plot(op2(2).V_d,op2(2).I_d );
h(3) = plot(op2(3).V_d(op2(3).n_iter>0),op2(3).I_d(op2(3).n_iter>0) );
h(4) = plot(op2(4).V_d(op2(4).n_iter>0),op2(4).I_d(op2(4).n_iter>0) );
h(5) = plot(op2(5).V_d(op2(5).n_iter>0),op2(5).I_d(op2(5).n_iter>0) );      
h(6) = plot(op2(6).V_d(op2(6).n_iter>0),op2(6).I_d(op2(6).n_iter>0) );      
h(7) = plot(op2(7).V_d(op2(7).n_iter>0),op2(7).I_d(op2(7).n_iter>0) );      
h(8) = plot(op2(8).V_d(op2(8).n_iter>0),op2(8).I_d(op2(8).n_iter>0) );
h(9) = plot(op2(9).V_d(op2(9).n_iter>0),op2(9).I_d(op2(9).n_iter>0) );
h(10) = plot(op2(10).V_d(op2(10).n_iter>0),op2(10).I_d(op2(10).n_iter>0) );
h(11) = plot(op2(11).V_d(op2(11).n_iter>0),op2(11).I_d(op2(11).n_iter>0) );
hold off;


plotar = 0;
if plotar == 1
axis([0 2 0 8])
h(1).Color  = 'r';
h(2).Color  = [1    0.6  0 ]; %orange
h(3).Color  = 'y';
h(4).Color  = 'g';
h(5).Color  = 'c';
h(6).Color  = 'b';
h(7).Color  = [0.5  0    0.9 ]; %purple
h(8).Color  = 'm';
h(9).Color  = 'k'; %'g';
h(10).Color = map(2,:);
h(11).Color = map(4,:);

								%[x_begin y_begin dx dy].
annotation('arrow', 'Position', [0.35 0.6 0.1 -0.3]);

annotation('textbox','String','m_{eff}',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.20 0.62 0.065 0.066],...
    'FitBoxToText','on');

% if aux == 1
% print('1G', '-depsc');
% elseif aux == 2
% print('FBG', '-depsc');
% elseif aux == 3
% print('2G', '-depsc');
% else 
% print('3G', '-depsc');
% end

end %END DE PLOTAR


%pause 
end 

if plotar == 0

op2 = [];
op6 = [];


op2 = rdcelpa('re/n_1g_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_fbg_meff_004_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('re/n_2g_meff_004_v2_dd_iv.elpa','*',[],op2);
op2 = rdcelpa('3G/n_3g_meff_004_dd_iv.elpa','*',[],op2);

op6 =  rdcelpa('1g/n_1g_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('fbg/n_fbg_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('2g/n_2g_2V_vgs_1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/n_3g_vds_vg_12_dd_iv.elpa','*',[],op6);

op2(1).I_d = op2(1).I_d * 1e6;
op2(2).I_d = op2(2).I_d * 1e6;
op2(3).I_d = op2(3).I_d * 1e6;
op2(4).I_d = op2(4).I_d * 1e6;

op6(1).Isum = op6(1).Isum * 1e6;
op6(2).Isum = op6(2).Isum * 1e6;
op6(3).Isum = op6(3).Isum * 1e6;
op6(4).Isum = op6(4).Isum * 1e6;


figure
%h(19) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op6(1).D,op6(1).Isum );
%set(h,'linewidth',2)
hold on
xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')
grid on

h(2) = plot(op6(2).D,op6(2).Isum );
h(3) = plot(op6(3).D,op6(3).Isum );
h(4) = plot(op6(4).D,op6(4).Isum );   

for i = 1:4
h(i+4) = plot(op2(i).V_d, op2(i).I_d);
end

h(1).Color =  map(1,:);
h(2).Color =  map(2,:);
h(3).Color =  map(3,:);
h(4).Color =  map(4,:);

h(5).Color =  map(1,:);
h(6).Color =  map(2,:);
h(7).Color =  map(3,:);
h(8).Color =  map(4,:);


h(5).LineStyle = '--';
h(6).LineStyle = '--';
h(7).LineStyle = '--';
h(8).LineStyle = '--';

legend([h(1) h(2) h(3) h(4)],...
    {'1G v20a','FBG v20a','2G v20a','3G v20a'},'Location', 'northwest'); 
print('Comparacao_saida', '-djpeg')

% Imagem das novas simulações
% figure
% for i = 1:4
	% h(i) = plot(op2(i).V_d, op2(i).I_d);
	% if i == 1
		% hold;
	% end
% end


end

%nao convergiram
%op2 = rdcelpa('1G/n_1g_meff_004_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('FBG/n_fbg_meff_004_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('2G/n_2g_meff_01_dd_iv.elpa','*',[],op2);
%op2 = rdcelpa('2G/n_2g_meff_04_dd_iv.elpa','*',[],op2);

% for i = 1:4
% figure
% plot(op2(i).V_d, op2(i).I_d)
% hold off
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indice = struct('a',{},'b',{},'c',{});
% res = struct('a',{},'b',{},'c',{},'media',{});

% indice(1).a = find(op2.D>0.0 & op2.D<0.2);
% indice(1).b = find(op2.D>0.2 & op2.D<0.4);
% indice(1).c = find(op2.D>0.4 & op2.D<0.6);

% %p(1) slope; p(2) constant
% p(1,:) = polyfit(op2.D(indice(1).a),op2.Isum(indice(1).a), 1);
% p(2,:) = polyfit(op2.D(indice(1).b),op2.Isum(indice(1).b), 1);
% p(3,:) = polyfit(op2.D(indice(1).c),op2.Isum(indice(1).c), 1);

% %res(1) = 1/p(1);
% res(1).a = 1/p(1,1);
% res(1).b = 1/p(2,1);
% res(1).c = 1/p(3,1);

% res(1).media = (res(1).a + res(1).b + res(1).c) / segmentos;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%indice(1,:) = find(op2.D>0.0 & op2.D<0.2);
%indice(2,:) = find(op2.D>0.2 & op2.D<0.4);
%indice(3,:) = find(op2.D>0.4 & op2.D<0.6);

%p(1) slope; p(2) constant
%p = polyfit(op2.D(indice),op2.Isum(indice), 1);
%res(1) = 1/p(1);

%for i=1:3
%p = polyfit(op2.D(indice(i)),op2.Isum(indice(i)), 1);
%end
%
%fit = polyval(p, op2.D(indice));
%x = op2.D(indice)
%y = op2.Isum(indice)
%
%figure
%h(1) = plot(op2(1).D,op2(1).Isum ); hold on
%plot(x,y, 'r');
%x = x - 0.05;
%%plot(x,fit,'k--');
