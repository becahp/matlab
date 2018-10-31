clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close 08_overlap figures, and then repeat the first example.
close all;
 
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
set(0,'DefaultAxesUnits','normalized');
set(0,'DefaultAxesOuterPosition', [0 0 1 1]);
set(0,'DefaultAxesPosition',[0.15 0.15 0.7 0.7]); 
 
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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\12_artigo_dia16	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\12_artigo_dia18
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\12_artigo_dia14

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\14_artigo_dia20
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\14_artigo_dia22
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\14_artigo_dia24

%%
%%%Read data and store it in a struct
		
op7 = [];			

aux = 4;
%%%%%%%


if aux == 1
%op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b102_op16_dd_inqu.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b102_op16_dd_inqu.elpa','*',[],op7);

end

if aux == 2
%op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b002_op16_dd_inqu.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b002_op16_dd_inqu.elpa','*',[],op7);
end


if aux == 3
% op7 =  rdcelpa('12_artigo_dia18/p_esq_artigo_d18_b102_op16_dd_inqu.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b102_op16_dd_inqu.elpa','*',[],op7);

end

if aux == 4

%op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b002_op16_dd_inqu.elpa','*',[],op7); %1V

op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b002_op30_dd_inqu.elpa','*',[],op7); %2V
end

if aux == 5
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b102_op16_dd_inqu.elpa','*',[],op7);
end

if aux == 6
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b002_op16_dd_inqu.elpa','*',[],op7);
end


if aux == 7
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b102_op16_dd_inqu.elpa','*',[],op7);
end

if aux == 8
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b002_op16_dd_inqu.elpa','*',[],op7);
end


if aux == 9
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b102_op16_dd_inqu.elpa','*',[],op7);
end

if aux == 10
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b002_op16_dd_inqu.elpa','*',[],op7);
end



%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


% op7(1).Isum = abs(op7(1).Isum);
% op7(2).Isum = abs(op7(2).Isum);
% op7(3).Isum = abs(op7(3).Isum);
% op7(4).Isum = abs(op7(4).Isum);
% op7(5).Isum = abs(op7(5).Isum);
% op7(6).Isum = abs(op7(6).Isum);
% op7(7).Isum = abs(op7(7).Isum);
% op7(8).Isum = abs(op7(8).Isum);
% op7(9).Isum = abs(op7(9).Isum);
% op7(10).Isum = abs(op7(10).Isum);


% for i = 1:10
% op7(i).jn = abs(op7(i).jn);
% op7(i).jn_therm = abs(op7(i).jn_therm);
% op7(i).jn_diff = abs(op7(i).jn_diff);
% op7(i).jn_drift = abs(op7(i).jn_drift);
% op7(i).jn_tun = abs(op7(i).jn_tun);
% end

%soma = op7(1).jn_tun + op7(1).jn_drift + op7(1).jn_diff + op7(1).jn_therm;

op7(1).x = op7(1).x * 10^9;
op7(1).jp = abs(op7(1).jp);
op7(1).jp_therm = abs(op7(1).jp_therm);
op7(1).jp_diff = abs(op7(1).jp_diff);
op7(1).jp_drift = abs(op7(1).jp_drift);
op7(1).jp_tun = abs(op7(1).jp_tun);


figure
h(1) = semilogy(op7(1).x,op7(1).jp );
hold
h(2) = semilogy(op7(1).x,op7(1).jp_tun );
h(3) = semilogy(op7(1).x,op7(1).jp_therm);


% h(2) = semilogy(op7(1).x,op7(1).jp_therm );
% h(3) = semilogy(op7(1).x,op7(1).jp_diff);
% h(4) = semilogy(op7(1).x,op7(1).jp_drift );
% h(5) = semilogy(op7(1).x,op7(1).jp_tun );

%h(6) = semilogy(op7(1).x,(op7(1).jn_tun + op7(1).jn_drift + op7(1).jn_diff + op7(1).jn_therm) );
%%h(6) = semilogy(op7(1).x, soma );

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])
xlabel('x (nm)')
ylabel('J_p (A)')


%f = gcf;
%h.XTickLabel = ['0','100','200','300','400','500'];

%xticks([0 100 200 300 400 500])
%xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi'})



hold off;

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
%h(4).Color = map(4,:);
%h(5).Color = map(5,:);
%h(6).Color = map(6,:);
% h(7).Color = map(4,:);
% h(8).Color = map(5,:);
% h(9).Color = map(5,:);

% h(10).Color = map(6,:);
% h(11).Color = map(6,:);


legend([h(1) h(2) h(3)],...
    {'jp', 'jp_{tun}','jp_{therm}'},'Location', 'best'); 



	
% legend([h(1) h(2) h(3) h(4) h(5)],...
    % {'jp', 'jp_{therm}','jp_{diff}', 'jp_{drift}', 'jp_{tun}'},'Location', 'best'); 

% legend([h(1) h(2) h(3) h(4) h(5) h(6)],...
    % {'jn', 'jn_{therm}','jn_{diff}', 'jn_{drift}', 'jn_{tun}', 'soma'},'Location', 'best'); 
