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



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\03_as
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\03_spacer_n

%%
%%%Read data and store it in a struct
op2 = [];	
aux = 2
%%%%%%%%%

if aux == 1
op2 =  rdcelpa('nHP_as_18_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_as_18_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v2_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40_dd_iv.elpa','*',[],op2);	
op2 =  rdcelpa('nLP_sp_40_dd_iv.elpa','*',[],op2);	

end

if aux == 2
op2 =  rdcelpa('nHP_as_18_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_as_18_v4_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v4_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40_dd_iv.elpa','*',[],op2);	
op2 =  rdcelpa('nLP_sp_40_dd_iv.elpa','*',[],op2);	
end

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

if aux == 1 || aux == 2
op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
%op2(7).I_s = abs(op2(7).I_s);
%op2(8).I_s = abs(op2(8).I_s);
%op2(9).I_s = abs(op2(9).I_s);
%op2(10).I_s = abs(op2(10).I_s);


figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );


xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

axis([0 1 1E-15 2e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_s);
h(3) = semilogy(op2(3).V_g,op2(3).I_s);
h(4) = semilogy(op2(4).V_g,op2(4).I_s);

h(5) = semilogy(op2(5).V_g,op2(5).I_s);
h(6) = semilogy(op2(6).V_g,op2(6).I_s);

%h(7) = semilogy(op2(7).V_g,op2(7).I_s);
%h(8) = semilogy(op2(8).V_g,op2(8).I_s);
%h(9) = semilogy(op2(9).V_g,op2(9).I_s);
%h(10) = semilogy(op2(10).V_g,op2(10).I_s);






h(1).Color = map(1,:);
h(2).Color = map(2,:);

h(3).Color = map(1,:);
h(4).Color = map(2,:);

h(5).Color = map(4,:);
h(6).Color = map(4,:);

%h(7).Color = map(2,:);
%h(8).Color = map(3,:);
%h(9).Color = 'y';
%h(10).Color = map(4,:);


h(3).LineStyle = '--';
h(4).LineStyle = '--';
h(6).LineStyle = '--';
%h(9).LineStyle = '--';

%legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend
%legend({'VGS = -0.6','VGS = -0.8','VGS = -1.0'}, 'Location', 'best');

%legend([h(1) h(2) h(3) h(4) h(5)],{'dv = 0.2, vpg = 1.0','dv = 0.2, vpg = 1.2','dv = 0.4, vpg = 1.2','dv = 0.18, vpg = 1.0','dv = 0, vpg = 1.0' }, 'Location', 'best');

if aux == 1
%v1 e v2
legend([h(1) h(2) h(5)],{'vpg = +0.18, vg = +0.18','vpg = -0.18, vg = +0.18','dv = 0, vpg = 1.0' }, 'Location', 'best');
end
if aux == 2
%v3 e v4
legend([h(1) h(2) h(5)],{'vpg = +0.18, vg = -0.18','vpg = -0.18, vg = -0.18','dv = 0, vpg = 1.0' }, 'Location', 'best');
end

legend('boxoff')

end %if aux 1 or 2

%	VPG		G
%v1: +0.18	+0.18
%v2: -0.18	+0.18
%v3: +0.18	-0.18
%v4: -0.18	-0.18

if aux == 3
op2 =  rdcelpa('nHP_as_18_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_as_18_v2_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v2_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_as_18_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_as_18_v4_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v3_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_as_18_v4_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nHP_sp_40_dd_iv.elpa','*',[],op2);	
op2 =  rdcelpa('nLP_sp_40_dd_iv.elpa','*',[],op2);	

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


%%%%%%%%%%%%
%%%%%%
figure
h(1) = semilogy(op2(1).V_g,op2(1).I_s );

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

axis([0 1 1E-15 2e-5])
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
h(2).Color = map(2,:);
h(3).Color = map(1,:);
h(4).Color = map(2,:);

h(5).Color = map(3,:);
h(6).Color = map(5,:);
h(7).Color = map(3,:);
h(8).Color = map(5,:);

h(9).Color = map(4,:);
h(10).Color = map(4,:);


h(3).LineStyle = '--';
h(4).LineStyle = '--';
h(7).LineStyle = '--';
h(8).LineStyle = '--';
h(10).LineStyle = '--';

%legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Position',[0.70,0.60,0.25,0.1]);  % Only the blue and green lines appear in the legend
%legend({'VGS = -0.6','VGS = -0.8','VGS = -1.0'}, 'Location', 'best');

%legend([h(1) h(2) h(3) h(4) h(5)],{'dv = 0.2, vpg = 1.0','dv = 0.2, vpg = 1.2','dv = 0.4, vpg = 1.2','dv = 0.18, vpg = 1.0','dv = 0, vpg = 1.0' }, 'Location', 'best');

legend([h(1) h(2) h(5) h(6) h(9)],{'vpg = +0.18, vg = +0.18','vpg = -0.18, vg = +0.18','vpg = +0.18, vg = -0.18','vpg = -0.18, vg = -0.18', 'dv = 0, vpg = 1.0' }, 'Location', 'best');


legend('boxoff')
end

