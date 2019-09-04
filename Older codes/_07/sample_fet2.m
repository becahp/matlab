clear;
clear all;
%close all; 

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


% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\artigo2\p_dir_fet_d18_b000
% %addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\artigo2\p_dir_fet_d18_b000_bbt0
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\artigo2\p_dir_fet_d18_b102
% %addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_90_rfet_brasil\artigo2\p_dir_fet_d18_b102_bbt0

% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01\p_dir_fet_d18_b000_bbt0

% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01\p_dir_fet_d24_b000_bbt0
% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01\p_esq_fet_d24_b000_bbt0

% addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01\p_dir_fet_d24_b000


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d18_b000
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d18_b000_bbt0
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d18_b102
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d18_b102_bbt0
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d24_b000
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\artigo2\p_dir_fet_d24_b000_bbt0
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\artigo2\p_esq_fet_d24_b000_bbt0
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\artigo2\p_dir_fet_d24_b000_bbt0_disc1

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d24_b000_bbt0_disc1 %range
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_dir_fet_d24_b000_bbt0_disc2 %area disc

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_esq_fet_d24_b000_bbt0_disc2 %area disc
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_esq_fet_d24_b000_bbt0_disc1 %range



%%
%%%Read data and store it in a struct
op2 = [];		

aux = 4
%%%%%%%%%

% + nG: d = 1.8nm/bbt = 1/sb = 0V	+
%		d = 1.8nm/bbt = 0/sb = 0V

if aux == 1
op2 =  rdcelpa('p_dir_fet_d18_b000/p_esq_fet_d18_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000/p_dir_fet_d18_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000_bbt0/p_esq_fet_d18_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000_bbt0/p_dir_fet_d18_b000_bbt0_dd_iv.elpa','*',[],op2);
end


if aux == 2
op2 =  rdcelpa('p_dir_fet_d24_b000/p_dir_fet_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d24_b000/p_esq_fet_d24_b000_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_fet_d24_b000_bbt0_disc1/p_dir_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_fet_d24_b000_bbt0_disc1/p_esq_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);

end



if aux == 3
op2 =  rdcelpa('p_dir_fet_d18_b000/p_esq_fet_d18_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000/p_dir_fet_d18_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000_bbt0/p_esq_fet_d18_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000_bbt0/p_dir_fet_d18_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d24_b000/p_dir_fet_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d24_b000/p_esq_fet_d24_b000_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('p_dir_fet_d24_b000_bbt0_disc1/p_dir_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_fet_d24_b000_bbt0_disc1/p_esq_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);

end



if aux == 4
op2 =  rdcelpa('p_dir_fet_d24_b000/p_dir_fet_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d24_b000/p_esq_fet_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d24_b000_bbt0_disc1/p_dir_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_fet_d24_b000_bbt0_disc1/p_esq_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);

%barreira = 0
op2 =  rdcelpa('p_dir_fet_d18_b000/p_esq_fet_d18_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_dir_fet_d18_b000/p_dir_fet_d18_b000_dd_iv.elpa','*',[],op2);

%barreira = -0.2
%%op2 =  rdcelpa('p_dir_fet_d18_b102/p_dir_fet_d18_b102_dd_iv.elpa','*',[],op2);
%%op2 =  rdcelpa('p_dir_fet_d18_b102/p_esq_fet_d18_b102_dd_iv.elpa','*',[],op2);
end

if aux == 5
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\01_artigofet\p_fet_d24_b000_bbt0

op2 =  rdcelpa('p_fet_d24_b000_bbt0/p_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);
op2(1).I_s = abs(op2(1).I_s * 1.1);

figure
semilogy(dois(:,1),dois(:,2), op2(1).V_g,op2(1).I_s );

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-1.5 1 0.1E-11 0.0001])

legend({'Experimental','Diameter = 2.4nm, (bbt = 0)'}, 'Location', 'best');
end

dois = csvread('segundacurva2.csv');
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


%op2(1).I_s = abs(op2(1).I_s * 1.1);
%op2(2).I_s = abs(op2(2).I_s * 1.1);
%op2(3).I_s = abs(op2(3).I_s * 1.1);
%op2(4).I_s = abs(op2(4).I_s * 1.1);
%
%if aux == 3
%op2(5).I_s = abs(op2(5).I_s * 1.1);
%op2(6).I_s = abs(op2(6).I_s * 1.1);
%op2(7).I_s = abs(op2(7).I_s * 1.1);
%op2(8).I_s = abs(op2(8).I_s * 1.1);
%end


%if aux == 4
%op2(5).I_s = abs(op2(5).I_s * 1.1);
%op2(6).I_s = abs(op2(6).I_s * 1.1);
%end
if aux == 4
op2(1).I_s = abs(op2(1).I_s * 0.8/1.15);
op2(2).I_s = abs(op2(2).I_s * 0.8/1.15);
op2(3).I_s = abs(op2(3).I_s * 0.8/1.15);
op2(4).I_s = abs(op2(4).I_s * 0.8/1.15);
op2(5).I_s = abs(op2(5).I_s * 0.8/1.15);
op2(6).I_s = abs(op2(6).I_s * 0.8/1.15);
end

figure
h(1) = semilogy(dois(:,1),dois(:,2));

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-1.5 1 0.1E-11 0.0001])


hold;
h(2) = semilogy(op2(1).V_g,op2(1).I_s );
h(3) = semilogy(op2(2).V_g,op2(2).I_s );
h(4) = semilogy(op2(3).V_g,op2(3).I_s );
h(5) = semilogy(op2(4).V_g,op2(4).I_s );

if aux == 3
h(6) = semilogy(op2(5).V_g,op2(5).I_s );
h(7) = semilogy(op2(6).V_g,op2(6).I_s );
h(8) = semilogy(op2(7).V_g,op2(7).I_s );
h(9) = semilogy(op2(8).V_g,op2(8).I_s );
end


if aux == 4
h(6) = semilogy(op2(5).V_g,op2(5).I_s );
h(7) = semilogy(op2(6).V_g,op2(6).I_s );
end

hold off;

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(2,:);
h(4).Color = map(3,:);
h(5).Color = map(3,:);

if aux == 3

h(6).Color = map(4,:);
h(7).Color = map(4,:);
h(8).Color = map(5,:);
h(9).Color = map(5,:);

legend([h(1) h(2) h(4) h(6) h(8)],{'Experimental','Diameter = 1.8nm','Diameter = 1.8nm, bbt = 0','Diameter = 2.4nm','Diameter = 2.4nm, bbt = 0'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
end

if aux == 4

h(6).Color = map(4,:);
h(7).Color = map(4,:);

legend([h(1) h(2) h(4) h(6)],{'Experimental','Diameter = 2.4nm','Diameter = 2.4nm (bbt = 0)','Diameter = 1.8nm'}, 'Location', 'southwest');  % Only the blue and green lines appear in the legend
end


if aux == 1
legend([h(1) h(2) h(4)],{'Experimental','Diameter = 1.8nm','Diameter = 1.8nm, bbt = 0'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
end

if aux == 2
legend([h(1) h(2) h(4)],{'Experimental','Diameter = 2.4nm','Diameter = 2.4nm, bbt = 0'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
end

legend('boxoff')

