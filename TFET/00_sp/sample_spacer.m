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

%%
%%%Read data and store it in a struct
op2 = [];	

aux = 4
%%%%%%%%%


if aux == 1 %todos normais
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\02_spacer
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS

op2 =  rdcelpa('01_VPGS/nHP_PGS_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_VPGS/nLP_PGS_10_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_10_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_20_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_20_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_30_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_30_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_40_dd_iv.elpa','*',[],op2);

end

if aux == 2 %todos tipo n
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer_n
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS_n

op2 =  rdcelpa('01_VPGS_n/nHP_PGS_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_VPGS_n/nLP_PGS_10_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_10_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_20_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_20_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_30_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_30_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_40_dd_iv.elpa','*',[],op2);

end

if aux == 3	%quase todos com dreno estendido
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS

op2 =  rdcelpa('01_VPGS/nHP_PGS_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_VPGS/nLP_PGS_10_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_10d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_10d_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_20d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_20d_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_30d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_30d_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_40d_dd_iv.elpa','*',[],op2);

end


if aux == 4 %quase todos com dreno estendido
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer_n
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS_n

op2 =  rdcelpa('01_VPGS_n/nHP_PGS_10_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('01_VPGS_n/nLP_PGS_10_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_10d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_10d_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_20d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_20d_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_30d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_30d_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_sp_40d_dd_iv.elpa','*',[],op2);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if aux == 5
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer_n
op2 = [];
%normais
op2 =  rdcelpa('03_spacer/nHP_sp_30_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_spacer/nLP_sp_30_dd_iv.elpa','*',[],op2);

%dreno estendido
op2 =  rdcelpa('03_spacer/nHP_sp_30d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_spacer/nLP_sp_30d_dd_iv.elpa','*',[],op2);

%normais com tipo n
op2 =  rdcelpa('03_spacer_n/nHP_sp_30_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_spacer_n/nLP_sp_30_dd_iv.elpa','*',[],op2);

%Estendido com tipo n
op2 =  rdcelpa('03_spacer_n/nHP_sp_30d_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_spacer_n/nLP_sp_30d_dd_iv.elpa','*',[],op2);

op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);

figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );
%xlim([0 1.4])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

axis([0 1.0 1E-15 2e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s);
h(3) = semilogy(op2(3).V_g,op2(3).I_s);
h(4) = semilogy(op2(4).V_g,op2(4).I_s);
h(5) = semilogy(op2(5).V_g,op2(5).I_s);
h(6) = semilogy(op2(6).V_g,op2(6).I_s);
h(7) = semilogy(op2(7).V_g,op2(7).I_s);
h(8) = semilogy(op2(8).V_g,op2(8).I_s);



h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(4,:);
h(8).Color = map(4,:);


%h(1).LineStyle = '--';
h(2).LineStyle = '--';
%h(3).LineStyle = '--';
h(4).LineStyle = '--';
%h(5).LineStyle = '--';
h(6).LineStyle = '--';
%h(7).LineStyle = '--';
h(8).LineStyle = '--';

legend([h(1) h(3) h(5) h(7)],{'sp = 30nm','sp = 30nm, drain','sp = 30nm n','sp = 30nm, drain n'}, 'Location', 'best');
legend('boxoff')

print('sp_var_30nm', '-depsc');
end

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
op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);
op2(9).I_s = abs(op2(9).I_s);
op2(10).I_s = abs(op2(10).I_s);



figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );
%xlim([0 1.4])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

axis([0 1.0 1E-15 2e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s);
h(3) = semilogy(op2(3).V_g,op2(3).I_s);
h(4) = semilogy(op2(4).V_g,op2(4).I_s);
h(5) = semilogy(op2(5).V_g,op2(5).I_s);
h(6) = semilogy(op2(6).V_g,op2(6).I_s);
h(7) = semilogy(op2(7).V_g,op2(7).I_s);
h(8) = semilogy(op2(8).V_g,op2(8).I_s);
h(9) = semilogy(op2(9).V_g,op2(9).I_s);
h(10) = semilogy(op2(10).V_g,op2(10).I_s);


h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(4,:);
h(8).Color = map(4,:);
h(9).Color = map(5,:);
h(10).Color = map(5,:);

%h(1).LineStyle = '--';
h(2).LineStyle = '--';
%h(3).LineStyle = '--';
h(4).LineStyle = '--';
%h(5).LineStyle = '--';
h(6).LineStyle = '--';
%h(7).LineStyle = '--';
h(8).LineStyle = '--';
%h(9).LineStyle = '--';
h(10).LineStyle = '--';

if aux == 1
legend([h(1) h(3) h(5) h(7) h(9)],{'Vpgs = 1.0V, sp = 5nm','sp = 10nm','sp = 20nm','sp = 30nm','sp = 40nm'}, 'Location', 'best');
legend('boxoff')

print('sp_var', '-depsc');

end

if aux == 2
legend([h(1) h(3) h(5) h(7) h(9)],{'Vpgs = 1.0V, sp = 5nm n','sp = 10nm n','sp = 20nm n','sp = 30nm n','sp = 40nm n'}, 'Location', 'best');
legend('boxoff')

print('sp_var_n', '-depsc');
end

if aux == 3
legend([h(1) h(3) h(5) h(7) h(9)],{'Vpgs = 1.0V, sp = 5nm','sp = 10nm, drain','sp = 20nm, drain','sp = 30nm, drain','sp = 40nm, drain'}, 'Location', 'best');
legend('boxoff')

print('sp_var_dreno', '-depsc');

end

if aux == 4
legend([h(1) h(3) h(5) h(7) h(9)],{'Vpgs = 1.0V, sp = 5nm n','sp = 10nm, drain n','sp = 20nm, drain n','sp = 30nm, drain n','sp = 40nm, drain n'}, 'Location', 'best');
legend('boxoff')

print('sp_var_dreno_n', '-depsc');
end

%legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend

%legend({'nHP','nLP'}, 'Location', 'best');
%legend({'nLP', 'nLP elec','nLP hole'}, 'Location', 'best');
%legend({'nLP V_{gd} = 0.8V', 'V_{gd} = 1.0V','V_{gd} = 1.2V','V_{gd} = 1.4V'}, 'Location', 'best');

