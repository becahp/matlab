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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\02_dopagem\1e8
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\02_dopagem\1e7

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\02_dopagem\variar2


%%
%%%Read data and store it in a struct
		
op7 = [];			


op7 =  rdcelpa('1e7/p_esq_artigo_d18_b102_doping_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('1e7/p_dir_artigo_d18_b102_doping_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_2e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_2e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_3e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_3e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_4e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_4e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_5e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_5e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_6e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_6e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_7e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_7e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_8e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_8e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('variar2/p_esq_artigo_d18_b102_9e7_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('variar2/p_dir_artigo_d18_b102_9e7_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('1e8/p_esq_artigo_d18_b102_doping_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('1e8/p_dir_artigo_d18_b102_doping_dd_iv.elpa','*',[],op7);


op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);
op7(5).Isum = abs(op7(5).Isum);
op7(6).Isum = abs(op7(6).Isum);
op7(7).Isum = abs(op7(7).Isum);
op7(8).Isum = abs(op7(8).Isum);
op7(9).Isum = abs(op7(9).Isum);
op7(10).Isum = abs(op7(10).Isum);
op7(11).Isum = abs(op7(11).Isum);
op7(12).Isum = abs(op7(12).Isum);
op7(13).Isum = abs(op7(13).Isum);
op7(14).Isum = abs(op7(14).Isum);
op7(15).Isum = abs(op7(15).Isum);
op7(16).Isum = abs(op7(16).Isum);

op7(17).Isum = abs(op7(17).Isum);
op7(18).Isum = abs(op7(18).Isum);
op7(19).Isum = abs(op7(19).Isum);
op7(20).Isum = abs(op7(20).Isum);

for i=1:20
elp.mat=[op7(i).G,op7(i).Isum];
elp.var_names={'G','Isum'};

str = strcat('Fig_doping', num2str(i));

elp.title=str;
save_elpa(['Data/',elp.title,'.elpa'],elp)

end %for i
