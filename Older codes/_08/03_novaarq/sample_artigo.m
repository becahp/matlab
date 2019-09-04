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
	

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\11_artigo
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\_re

%%
%%%Read data and store it in a struct
op2 = [];		

auxOp = 2
%%%%%%%%%


op2 =  rdcelpa('11_artigo/p_artigo_d24_bbt1_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('11_artigo/p_artigo_d24_bbt0_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('11_artigo/p_artigo_d18_bbt1_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('_re/p_artigo_d24_bbt1_dd_iv.elpa','*',[],op2);  


%dois = csvread('segundacurva2.csv');
tres = csvread('../terceiro.csv');

%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.Isum, op1.G);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


op2(1).V_g = op2(1).V_g + 0.02;
op2(2).V_g = op2(2).V_g + 0.02;
op2(3).V_g = op2(3).V_g + 0.075;

%op2(4).V_g = op2(4).V_g + 0.075;


figure
h(1) = semilogy(tres(:,1),tres(:,2));

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
axis([-1.5 2 0.1E-11 0.0001])


hold;
h(2) = semilogy(op2(1).V_g,op2(1).I_s );
h(3) = semilogy(op2(2).V_g,op2(2).I_s );
h(4) = semilogy(op2(3).V_g,op2(3).I_s );
h(5) = semilogy(op2(4).V_g,op2(4).I_s );


%hold off;

h(1).Marker = 'o';
h(1).LineStyle = 'none';
h(1).Color = map(1,:);

h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);
h(4).Color = map(5,:);

%legend([h(1) h(2) h(3) h(4)],{'Experimental','d = 2.4nm','d = 2.4nm (bbt = 0)','d = 1.8nm'}, 'Location', 'southwest');  % Only the blue and green lines appear in the legend

legend([h(1) h(2) h(3) h(4) h(5)],{'Experimental','d = 2.4nm','d = 2.4nm (bbt = 0)','d = 1.8nm', 'velocity'}, 'Location', 'southwest');  % Only the blue and green lines appear in the legend


legend('boxoff')


%% subslope

clear x;
clear y;

aux = 5; %7
aux2 = 3; %4
zero = 36;

for i=1:aux
	%x(i) = op7(1).G(aux2+i);
    %y(i) = op7(1).Isum(aux2+i);
    
	if auxOp == 1
    x(i) = op2(6).V_g(aux2+i);
    y(i) = op2(6).I_s(aux2+i);
	end
	
	x(i) = op2(3).V_g(zero + aux2+i);
    y(i) = op2(3).I_s(zero + aux2+i);
	
end

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%f1 = polyval(p, x);
fit = power(10,polyval(p, x));
%fit = power(10,polyval(p, x));

%figure
%semilogy(x,y,'r');
%hold on
x = x -0.1;
plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

var = round((1/p(1) * 10^3),0);

str = num2str(abs(var));
s = strcat('S=',str, ' mV/dec');

annotation('textbox','String',s,...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.30 0.45 0.065 0.066],...
    'FitBoxToText','on');

%p = polyfit(op7(1).G,log(op7(1).Isum), 1);
%f1 = polyval(p, op7(1).G);
%plot(op7(1).G,f1,'b--');
hold off;

seta = 0;
if seta == 1
								%[x_begin y_begin dx dy].
annotation('arrow', 'Position', [0.3 0.7 0 0.2]);

annotation('textbox','String','Interface Doping',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.2 0.62 0.065 0.066],...
    'FitBoxToText','on');
	
	
								%[x_begin y_begin dx dy].
annotation('arrow', 'Position', [0.74 0.57 0 -0.3]);

annotation('textbox','String','Traps',...
    'FontSize', 20, 'LineStyle', 'none', 'Position',...
    [0.74 0.42 0.065 0.066],...%[0.67 0.60 0.065 0.066],...
    'FitBoxToText','on');
end



%print('novo_artigo_3', '-depsc');