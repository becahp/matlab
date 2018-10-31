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

	
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\12_artigo_dia18
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\12_artigo_dia16
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\12_artigo_dia14

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\14_artigo_dia20
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\14_artigo_dia22
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\14_artigo_dia24

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\15_ruins12

%%
%%%Read data and store it in a struct
		
op7 = [];			

aux = 2;
%%%%%%%


%%(ii) 3G: |Vpg/s|=|Vds|=1.2, 1.4, 1.6V

if aux == 1
op7 =  rdcelpa('12_artigo_dia18/p_esq_artigo_d18_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_esq_artigo_d18_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_esq_artigo_d18_b000_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('15_ruins12/p_dir_artigo_d18_b000_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('12_artigo_dia18/p_esq_artigo_d18_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_esq_artigo_d18_b002_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia18/p_dir_artigo_d18_b002_dd_iv.elpa','*',[],op7);
end

if aux == 2
op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b101_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('15_ruins12/p_dir_artigo_d16_b101_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b000_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('15_ruins12/p_dir_artigo_d16_b000_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b001_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('15_ruins12/p_dir_artigo_d16_b001_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('12_artigo_dia16/p_esq_artigo_d16_b002_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia16/p_dir_artigo_d16_b002_dd_iv.elpa','*',[],op7);


end

if aux == 3
op7 =  rdcelpa('12_artigo_dia14/p_esq_artigo_d14_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_dir_artigo_d14_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_esq_artigo_d14_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_dir_artigo_d14_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_esq_artigo_d14_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_dir_artigo_d14_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_esq_artigo_d14_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_dir_artigo_d14_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_esq_artigo_d14_b002_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('12_artigo_dia14/p_dir_artigo_d14_b002_dd_iv.elpa','*',[],op7);
end

if aux == 4
op7 =  rdcelpa('14_artigo_dia20/p_esq_artigo_d20_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_esq_artigo_d20_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_esq_artigo_d20_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_esq_artigo_d20_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_esq_artigo_d20_b002_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia20/p_dir_artigo_d20_b002_dd_iv.elpa','*',[],op7);
end

if aux == 5
op7 =  rdcelpa('14_artigo_dia22/p_esq_artigo_d22_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_esq_artigo_d22_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_esq_artigo_d22_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_esq_artigo_d22_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_esq_artigo_d22_b002_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia22/p_dir_artigo_d22_b002_dd_iv.elpa','*',[],op7);
end

if aux == 6
op7 =  rdcelpa('14_artigo_dia24/p_esq_artigo_d24_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b102_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_esq_artigo_d24_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b101_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_esq_artigo_d24_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b000_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_esq_artigo_d24_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b001_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_esq_artigo_d24_b002_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('14_artigo_dia24/p_dir_artigo_d24_b002_dd_iv.elpa','*',[],op7);
end




%dois = csvread('segundacurva2.csv');
tres = csvread('terceiro.csv');


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


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

figure
h(1) = semilogy(tres(:,1),tres(:,2));
%h(1) = semilogy(op7(1).G,op7(1).Isum );

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

hold                        
h(2) = semilogy(op7(1).G,op7(1).Isum );
h(3) = semilogy(op7(2).G,op7(2).Isum );
h(4) = semilogy(op7(3).G,op7(3).Isum );
h(5) = semilogy(op7(4).G,op7(4).Isum );
h(6) = semilogy(op7(5).G,op7(5).Isum );
h(7) = semilogy(op7(6).G,op7(6).Isum );
h(8) = semilogy(op7(7).G,op7(7).Isum );
h(9) = semilogy(op7(8).G,op7(8).Isum );
h(10) = semilogy(op7(9).G,op7(9).Isum );
h(11) = semilogy(op7(10).G,op7(10).Isum );


hold off;

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(2,:);
h(4).Color = map(3,:);
h(5).Color = map(3,:);
h(6).Color = map(4,:);
h(7).Color = map(4,:);
h(8).Color = map(5,:);
h(9).Color = map(5,:);

h(10).Color = map(6,:);
h(11).Color = map(6,:);


legend([h(1) h(2) h(4) h(6) h(8) h(10)],...
    {'Experimental', 'sb = -0.2','sb = -0.1', 'sb = 0.0', 'sb = 0.1','sb = 0.2'},'Location', 'best'); 
%    {'3G VGS 1.0', '3G VGS 1.2','3G VGS 1.4','3G VGS 1.6'},'Location', 'best'); 
%print('4estruturas', '-depsc')
