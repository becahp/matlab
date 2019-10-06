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

aux = 455;

if aux == 1
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\06_nGate	%eps = 12
end

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\10_reArtigoNGate %%eps = 16
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_08_novo\10_reArtigoNGate\wkb



%%
%%%Read data and store it in a struct
op2 = [];		

%%%%%%%%%

% + nG: d = 1.8nm/bbt = 1/sb = 0V	+
%		d = 1.8nm/bbt = 0/sb = 0V


op2 =  rdcelpa('p_fet_d24_b000_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_fet_d18_b000_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('wkb/p_fet_d24_b000_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('wkb/p_fet_d24_b000_bbt0_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('p_fet_d18_b000_dd_iv.elpa','*',[],op2);



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

op2(1).I_s = abs(op2(1).I_s );
op2(2).I_s = abs(op2(2).I_s );
op2(3).I_s = abs(op2(3).I_s );


%op2(1).I_s = abs(op2(1).I_s * 1.1);
%op2(2).I_s = abs(op2(2).I_s * 1.1);
%op2(3).I_s = abs(op2(3).I_s * 1.1);
%op2(4).I_s = abs(op2(4).I_s * 1.1);
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

hold off;

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);


legend([h(1) h(2) h(3) h(4)],{'Experimental','Diameter = 2.4nm','Diameter = 2.4nm (bbt = 0)','Diameter = 1.8nm'}, 'Location', 'southwest');  % Only the blue and green lines appear in the legend


legend('boxoff')

%print('Fig4a', '-depsc');

oi = 0
if oi == 1
cd ..

elp.mat=[dois(:,1),dois(:,2)];
elp.var_names={'V_g','I_s'};
elp.title='Fig4a_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[op2(1).V_g,op2(1).I_s];
elp.var_names={'V_g','I_s'};
elp.title='Fig4a_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[op2(2).V_g,op2(2).I_s];
elp.var_names={'V_g','I_s'};
elp.title='Fig4a_d3';
save_elpa(['Data/',elp.title,'.elpa'],elp)

elp.mat=[op2(3).V_g,op2(3).I_s];
elp.var_names={'V_g','I_s'};
elp.title='Fig4a_d4';
save_elpa(['Data/',elp.title,'.elpa'],elp)


cd 'Fig4a'
end 