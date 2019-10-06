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
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\01_vpg\HP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\01_vpg\LP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\01_vpg\LP1


%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 2
%%%%%%%%%


%op2 =  rdcelpa('HP/nHP_vpg_000_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('HP/nHP_vpg_002_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('HP/nHP_vpg_004_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('HP/nHP_vpg_006_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('HP/nHP_vpg_008_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('HP/nHP_vpg_010_dd_iv.elpa','*',[],op2);


%op2 =  rdcelpa('LP/nLP_vpg_000_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('LP/nLP_vpg_102_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('LP/nLP_vpg_104_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('LP/nLP_vpg_106_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP1/nLP_vpg_106_BG_010_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('LP/nLP_vpg_108_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('LP/nLP_vpg_110_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP1/nLP_vpg_110_BG_010_dd_iv.elpa','*',[],op2);



%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_d = abs(op2(1).I_d);
op2(2).I_d = abs(op2(2).I_d);
op2(3).I_d = abs(op2(3).I_d);
op2(4).I_d = abs(op2(4).I_d);
%op2(5).I_d = abs(op2(5).I_s);
%op2(6).I_d = abs(op2(6).I_s);
%op2(7).I_d = abs(op2(7).I_d);
%op2(8).I_d = abs(op2(8).I_d);
%op2(9).I_d = abs(op2(9).I_d);
%op2(10).I_d = abs(op2(10).I_d);
%op2(11).I_d = abs(op2(11).I_d);
%op2(12).I_d = abs(op2(12).I_d);



figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d );
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([0 1 1E-17 1e-4])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];
hold; 
h(2) = semilogy(op2(3).V_g,op2(3).I_d);
%h(3) = semilogy(op2(3).V_g,op2(3).I_d);
%h(4) = semilogy(op2(4).V_g,op2(4).I_d);

h(1).Color = map(1,:);
h(2).Color = map(2,:);
%h(3).Color = map(3,:);
%h(4).Color = map(4,:);

legend({'vpg = |0.6|V, vbg=0V','vpg = |1.0|V, vbg=0V'}, 'Location', 'best');

legend('boxoff')

%print('var_vpg', '-depsc');


figure
h(1) = semilogy(op2(2).V_g,op2(2).I_d );
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([0 1 1E-17 1e-4])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];
hold; 
h(2) = semilogy(op2(4).V_g,op2(4).I_d);
%h(3) = semilogy(op2(3).V_g,op2(3).I_d);
%h(4) = semilogy(op2(4).V_g,op2(4).I_d);

h(1).Color = map(1,:);
h(2).Color = map(2,:);
%h(3).Color = map(3,:);
%h(4).Color = map(4,:);

legend({'vpg = |0.6|V, vbg=+1V','vpg = |1.0|V, vbg=+1V'}, 'Location', 'best');

legend('boxoff')

%print('var_vpg', '-depsc');



pule = 111
if pule == 1
figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d );

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

axis([0 1 1E-17 1e-4])

%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_d);
h(3) = semilogy(op2(3).V_g,op2(3).I_d);
h(4) = semilogy(op2(4).V_g,op2(4).I_d);
%h(5) = semilogy(op2(5).V_g,op2(5).I_d);
%h(6) = semilogy(op2(6).V_g,op2(6).I_d);

%h(7) = semilogy(op2(7).V_g,op2(7).I_d);
%h(8) = semilogy(op2(8).V_g,op2(8).I_d);
%h(9) = semilogy(op2(9).V_g,op2(9).I_d);
%h(10) = semilogy(op2(10).V_g,op2(10).I_d);
%h(11) = semilogy(op2(11).V_g,op2(11).I_d);
%h(12) = semilogy(op2(12).V_g,op2(12).I_d);

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);
%h(5).Color = map(2,:);
%h(6).Color = map(3,:);

%h(7).Color = map(1,:);
%h(8).Color = map(2,:);
%h(9).Color = map(3,:);
%h(10).Color = map(4,:);
%h(11).Color = map(5,:);
%h(12).Color = map(6,:);


%h(2).LineStyle = '--';
%h(4).LineStyle = '--';
%h(6).LineStyle = '--';
%h(10).LineStyle = '--';
%h(11).LineStyle = '--';
%h(12).LineStyle = '--';

%legend([h(1) h(3)],{'nHP','nLP','nHP n','nLP n'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend


%legend({'vpg = 0.0V','vpg = |0.2|V','vpg = |0.4|V','vpg = |0.6|V','vpg = |0.8|V', 'vpg = |1.0|V'}, 'Location', 'best');
legend({'vpg = |0.6|V, vbg=0V','vpg = |0.6|V, vbg=+1V','vpg = |1.0|V, vbg=0V','vpg = |1.0|V, vbg=+1V'}, 'Location', 'best');

legend('boxoff')

%print('var_vpg', '-depsc');
end
pule = 0
if pule == 1
for i=1:length(op2)
str = num2str(i);

elp.mat=[op2(i).V_g,op2(i).I_d];
elp.var_names={'Vg','Id'};
s = strcat('Fig_d',str);
elp.title=s;

save_elpa(['Data/',elp.title,'.elpa'],elp)
end

end