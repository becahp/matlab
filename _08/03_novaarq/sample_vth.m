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

	
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16 %tensao 1.2V

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\07_vth
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_09_nova_arq\03_vth

%%
%%%Read data and store it in a struct
op2 = [];		

sel = 4
%%%%%%%%%
 
if sel == 4 
op2 =  rdcelpa('03_vth/n_dir_1g_vth_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_vth/n_dir_fbg_vth_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('03_vth/n_dir_2g_vth_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('07_vth/n_dir_3g_vth_dd_iv.elpa','*',[],op2);
end


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


op2(1).I_s = abs(op2(1).I_s);
op2(2).I_s = abs(op2(2).I_s);
op2(3).I_s = abs(op2(3).I_s);
op2(4).I_s = abs(op2(4).I_s);
%op2(5).I_s = abs(op2(5).I_s);
%op2(6).I_s = abs(op2(6).I_s);
%op2(7).I_s = abs(op2(7).I_s);
%op2(8).I_s = abs(op2(8).I_s);


figure
h(1) = plot(op2(1).V_g,op2(1).I_d );

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-2 2 0.1E-16 0.0001])

hold;
h(2) = plot(op2(2).V_g,op2(2).I_d );
h(3) = plot(op2(3).V_g,op2(3).I_d );
h(4) = plot(op2(4).V_g,op2(4).I_d );
%h(5) = plot(op2(5).V_g,op2(5).I_s );
%h(6) = plot(op2(6).V_g,op2(6).I_s );

%hold off;

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);
%h(5).Color = map(2,:);
%h(6).Color = map(2,:);


%legend([h(1) h(3) h(5)],{'E_{\rm gap} = 0.36eV','E_{\rm gap} = 0.54eV','E_{\rm gap} = 0.78eV'}, 'Location', 'southeast');  % Only the blue and green lines appear in the legend

legend({'1G','FBG','2G', '3G'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
legend('boxoff')

%%%%%%%%%%%%%%%%%
%1G
opT(1).V_g = op2(1).V_g(11:25); %0.6206 0.6896 0.7586
opT(1).I_d = op2(1).I_d(11:25);

%FBG
opT(2).V_g = op2(2).V_g(11:20);
opT(2).I_d = op2(2).I_d(11:20);

%2G
opT(3).V_g = op2(3).V_g(15:26);
opT(3).I_d = op2(3).I_d(15:26);

%parecido com FBG
%opT(3).V_g = op2(3).V_g(32:42); %0.4211 a
%opT(3).I_d = op2(3).I_d(32:42);

%3G
opT(4).V_g = op2(4).V_g(4:7);
opT(4).I_d = op2(4).I_d(4:7);


%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	

for i=1:4
p(i,:) = polyfit(opT(i).I_d,opT(i).V_g, 1);		%pegar valor correto
%p(i,:) = polyfit(opT(i).V_g,opT(i).I_d, 1); 		%pegar imagem correta


fit = polyval(p(i,:), op2(i).V_g);
end

%h(i+4) = plot(op2(i).V_g,fit);
%h(i+4).Color = map(i,:);
%h(i+4).LineStyle = '--';
%end

Vth = p(:,2);

%fit = polyval(p(1,:), op2(1).V_g);
%plot(op2(i).V_g,fit,'k--');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sel == 4
for i=1:4
	figure
	h(1) = plot(op2(i).V_g,op2(i).I_d );

	xlabel('V_{gs} (V)')
	ylabel('I_{ds} (A)')

	hold

	fit = polyval(p(i,:), op2(i).V_g);
	h(2) = plot(op2(i).V_g,fit,'k--');

	h(1).Color = map(i,:);

	hold off;
	legend('boxoff');

if sel == 5
	if i ==1
		legend([h(1)],{'1G'}); 
		print('vth_1g', '-depsc');
	end

	if i == 2
		legend([h(1)],{'FBG'});  
		print('vth_fbg', '-depsc');
	end

	if i==3
		legend([h(1)],{'2G'});  
		print('vth_2g', '-depsc');
	end

	if i==4
		legend([h(1)],{'3G'});  
		print('vth_3g', '-depsc');
	end
end
	
end %end do for
end %end do if