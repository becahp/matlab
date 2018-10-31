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



	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\00_dia16

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\00_todas

%%
%%%Read data and store it in a struct
op2 = [];	
op7 = [];	

%%%%%%%%%%%%%%gm
i = 1;
op2 = [];
op2 =  rdcelpa('new_1g_dd_iv.elpa','*',[],op2);
%op2(1).I_s = abs(op2(1).I_s);

op7 = [];	
op7 =  rdcelpa('n_dir_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op7);


[x,y] = plot_elpa_gm_v30(op2,'n');
tensao = x(find(y == max(y)))

[x1,y1] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 
i = i +1;

figure
plot(x, y,'g');
hold
plot(x1, y1,'b');
legend(['1G']);
%%%%%%%%%%%%%%

op2 = [];
op2 =  rdcelpa('new_fbg_dd_iv.elpa','*',[],op2);
op2(1).I_s = abs(op2(1).I_s);

op7 = [];	
op7 =  rdcelpa('n_dir_fbg_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('n_esq_fbg_dd_iv.elpa','*',[],op7);


[x,y] = plot_elpa_gm_v30(op2,'n');
tensao = x(find(y == max(y)))
[x1,y1] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 
i = i +1;

figure
plot(x, y,'g');
hold
plot(x1, y1,'b');
legend(['FBG']);
%%%%%%%%%%%%%%

op2 = [];
op2 =  rdcelpa('new_2g_dd_iv.elpa','*',[],op2);
op2(1).I_s = abs(op2(1).I_s);

op7 = [];	
op7 =  rdcelpa('n_dir_2g_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('n_esq_2g_dd_iv.elpa','*',[],op7);

[x,y] = plot_elpa_gm_v30(op2,'n');
tensao = x(find(y == max(y)))
[x1,y1] = plot_elpa_gm_v30(op7,'n');
peak_gm(i) = max(y); 
i = i +1;

figure
plot(x, y,'g');
hold
plot(x1, y1,'b');
legend(['2G']);

peak_gm


op7 = [];	
op7 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op7);
[x1,y1] = plot_elpa_gm_v30(op7,'n');

tensao = x1(find(y1 == max(y1)))

figure
plot(x1, y1,'b');
legend(['3G']);
