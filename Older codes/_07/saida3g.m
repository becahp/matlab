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


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\00_saida3g

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g

%%
%%%Read data and store it in a struct
op2 = [];		
op6 = [];		

%aux = 2
%%%%%%%%%

%if aux == 1 %	1 p_dir_artigo_d18_b102	: versão para novo coos
op2 =  rdcelpa('00_saida3g/n_3g_04V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('00_saida3g/n_3g_08V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('00_saida3g/n_3g_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('00_saida3g/n_3g_12V_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('00_saida3g/p_3g_04V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('00_saida3g/p_3g_08V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('00_saida3g/p_3g_10V_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('00_saida3g/p_3g_12V_dd_iv.elpa','*',[],op2);

%end
op6 =  rdcelpa('3g/n_3g_vds_vg_04_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/n_3g_vds_vg_08_v1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/n_3g_vds_vg_10_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/n_3g_vds_vg_12_dd_iv.elpa','*',[],op6);

op6 =  rdcelpa('3g/p_3g_vds_vg_04_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/p_3g_vds_vg_08_v1_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/p_3g_vds_vg_10_dd_iv.elpa','*',[],op6);
op6 =  rdcelpa('3g/p_3g_vds_vg_12_dd_iv.elpa','*',[],op6);




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


%op2(1).I_d = abs(op2(1).I_d);
%op2(2).I_d = abs(op2(2).I_d);
%op2(3).I_d = abs(op2(3).I_d);
%op2(4).I_d = abs(op2(4).I_d);

op2(1).I_d = op2(1).I_d * 1e6;
op2(2).I_d = op2(2).I_d * 1e6;
op2(3).I_d = op2(3).I_d * 1e6;
op2(4).I_d = op2(4).I_d * 1e6;
op2(5).I_d = op2(5).I_d * 1e6;
op2(6).I_d = op2(6).I_d * 1e6;
op2(7).I_d = op2(7).I_d * 1e6;
op2(8).I_d = op2(8).I_d * 1e6;

op6(1).Isum = op6(1).Isum * 1e6;
op6(2).Isum = op6(2).Isum * 1e6;
op6(3).Isum = op6(3).Isum * 1e6;
op6(4).Isum = op6(4).Isum * 1e6;
op6(5).Isum = op6(5).Isum * 1e6;
op6(6).Isum = op6(6).Isum * 1e6;
op6(7).Isum = op6(7).Isum * 1e6;
op6(8).Isum = op6(8).Isum * 1e6;



figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );

axis([-1.2 1.2 -4 4])
xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')

ax = gca;
ax.XTick = [-1.2 -0.8 -0.4 0 0.4 0.8 1.2];

ax.YTick = [-4 -3 -2 -1 0 1 2 3 4];


grid on

hold;
h(2) = plot(op2(2).V_d,op2(2).I_d );
h(3) = plot(op2(3).V_d,op2(3).I_d );
h(4) = plot(op2(4).V_d,op2(4).I_d );
h(5) = plot(op2(5).V_d,op2(5).I_d );      
h(6) = plot(op2(6).V_d,op2(6).I_d );      
h(7) = plot(op2(7).V_d,op2(7).I_d );      
h(8) = plot(op2(8).V_d,op2(8).I_d );

h(9) = plot(op6(1).D,op6(1).Isum );
h(10) = plot(op6(2).D,op6(2).Isum );
h(11) = plot(op6(3).D,op6(3).Isum );
h(12) = plot(op6(4).D,op6(4).Isum );      
h(13) = plot(op6(5).D,op6(5).Isum );      
h(14) = plot(op6(6).D,op6(6).Isum );      
h(15) = plot(op6(7).D,op6(7).Isum );      
h(16) = plot(op6(8).D,op6(8).Isum );      

hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(1,:);
h(4).Color = map(1,:);

h(5).Color =  map(2,:);
h(6).Color =  map(2,:);
h(7).Color =  map(2,:);
h(8).Color =  map(2,:);


h(9).Color = map(1,:);
h(10).Color = map(1,:);
h(11).Color = map(1,:);
h(12).Color = map(1,:);
h(13).Color =  map(2,:);
h(14).Color =  map(2,:);
h(15).Color =  map(2,:);
h(16).Color =  map(2,:);

h(9).LineStyle =  '--';
h(10).LineStyle = '--';
h(11).LineStyle = '--';
h(12).LineStyle = '--';
h(13).LineStyle = '--';
h(14).LineStyle = '--';
h(15).LineStyle = '--';
h(16).LineStyle = '--';

%if aux == 1
%legend({'V = 0.4V','V = 0.8V','V = 1.0V','V = 1.2V'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% só parte n
figure
%h(1) = semilogy(tres(:,1),tres(:,2));
h(1) = plot(op2(1).V_d,op2(1).I_d );

axis([0 1.2 0 4])
xlabel('V_{ds} (V)')
ylabel('I_{ds} (\muA)')

ax = gca;
ax.XTick = [0 0.2 0.4 0.6 0.8 1.0 1.2];

ax.YTick = [0 1 2 3 4];


grid on

hold;
h(2) = plot(op2(2).V_d,op2(2).I_d );
h(3) = plot(op2(3).V_d,op2(3).I_d );
h(4) = plot(op2(4).V_d,op2(4).I_d );
h(5) = plot(op6(1).D,op6(1).Isum );      
h(6) = plot(op6(2).D,op6(2).Isum );      
h(7) = plot(op6(3).D,op6(3).Isum );      
h(8) = plot(op6(4).D,op6(4).Isum );

hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(1,:);
h(4).Color = map(1,:);

h(5).Color =  map(1,:);
h(6).Color =  map(1,:);
h(7).Color =  map(1,:);
h(8).Color =  map(1,:);



h(5).LineStyle =  '--';
h(6).LineStyle = '--';
h(7).LineStyle = '--';
h(8).LineStyle = '--';

