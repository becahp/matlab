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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\04_FE\var_vds05
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\04_FE\var_vds05_sem
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nHP_tbox_25 %vbg 0v, nHP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nLP_tbox_25 %vbg 0v, nHP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\neg


%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 2
%%%%%%%%%

%op2 =  rdcelpa('var_vds05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_tbox_25_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nHP_BG_neg_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('var_vds05_sem_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('nLP_tbox_25_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('nLP_BG_neg_dd_iv.elpa','*',[],op2);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

op2(1).I_d = abs(op2(1).I_d);
op2(2).I_d = abs(op2(2).I_d);
op2(2).I_s = abs(op2(2).I_s);
%op2(2).I_d = smooth(op2(2).I_d,1);
op2(3).I_d = abs(op2(3).I_d);
op2(4).I_d = abs(op2(4).I_d);
op2(5).I_d = abs(op2(5).I_d);
%op2(6).I_d = abs(op2(6).I_d);




figure
%h(1) = semilogy(op2(1).V_gs,op2(1).I_d );
h(1) = semilogy(op2(1).V_g,op2(1).I_d); %HP
xlabel('V_{CG} (V)')
ylabel('I_{d} (A)')

%axis([0 0.8 1E-21 1e-5])
%ay = gca;
%ay.YTick = [1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];

hold; 
h(2) = semilogy(op2(2).V_g,op2(2).I_d); %HP

h(3) = semilogy(op2(3).V_gs,op2(3).I_d, '--'); %exp

h(4) = semilogy(op2(4).V_g*(-1),op2(4).I_d); %LP
h(5) = semilogy(op2(5).V_g*(-1),op2(5).I_d); %LP
%h(4) = semilogy(op2(4).V_g,op2(4).I_d);


%set(h(1),"color",map(1,:)) 
%set(h(2),"color",map(2,:))
%set(h(3),"color",map(3,:))
 
h(1).Color = map(1,:);
h(2).Color = map(1,:);

h(3).Color = map(2,:);

h(4).Color = map(3,:);
h(5).Color = map(3,:);



%legend({'nHP','nLP'}, 'Location', 'best');
%legend({"VCG = +1V, VBG = 0V", "sem CG"}, "location", "southeast");

legend([h(1) h(3) h(4)],{'2-Gate nHP', 'source sided CG', '2-Gate nLP (VCG=-|VCG|)'}, 'location', 'best');
legend('boxoff');

%print "var_sem" -depsc

print('compare_var_sem', '-depsc');