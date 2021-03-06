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



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16
%antigo
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\07_all_16_overlap

%%
%%%Read data and store it in a struct
op2 = [];	
op7 = [];	
	
%aux = 2
%%%%%%%%%

%if aux == 1 %	1 p_dir_artigo_d18_b102	: versão para novo coos
op2 =  rdcelpa('n_dir_1g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_1g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_fbg_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_fbg_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_2g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('p_esq_2g_dd_iv.elpa','*',[],op2);

op2 =  rdcelpa('n_dir_3g_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('n_esq_3g_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('p_dir_1g_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('p_dir_fbg_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('p_dir_2g_dd_iv.elpa','*',[],op2);

%op2 =  rdcelpa('p_dir_3g_dd_iv.elpa','*',[],op2);
%op2 =  rdcelpa('p_esq_3g_dd_iv.elpa','*',[],op2);


op7 =  rdcelpa('07_all_16_overlap/n_dir_1g_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('07_all_16_overlap/n_esq_1g_d16_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('07_all_16_overlap/n_dir_fbg_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('07_all_16_overlap/n_esq_fbg_d16_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('07_all_16_overlap/n_dir_2g_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('07_all_16_overlap/n_esq_2g_d16_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('07_all_16_overlap/n_dir_3g_d16_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('07_all_16_overlap/n_esq_3g_d16_dd_iv.elpa','*',[],op7);

%op7 =  rdcelpa('07_all_16_overlap/p_dir_3g_d16_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('07_all_16_overlap/p_esq_3g_d16_dd_iv.elpa','*',[],op7);

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
op2(5).I_s = abs(op2(5).I_s);
op2(6).I_s = abs(op2(6).I_s);
op2(7).I_s = abs(op2(7).I_s);
op2(8).I_s = abs(op2(8).I_s);

%op2(9).I_s = abs(op2(9).I_s);
%op2(10).I_s = abs(op2(10).I_s);

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);
op7(5).Isum = abs(op7(5).Isum);
op7(6).Isum = abs(op7(6).Isum);
op7(7).Isum = abs(op7(7).Isum);
op7(8).Isum = abs(op7(8).Isum);

%op7(9).Isum = abs(op7(9).Isum);
%op7(10).Isum = abs(op7(10).Isum);

figure
%h(1) = semilogy(tres(:,1),tres(:,2));
%h(1) = semilogy(op2(1).V_g,op2(1).I_s );
h(1) = semilogy(op2(1).V_g(op2(1).n_iter>0),op2(1).I_s(op2(1).n_iter>0));

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 1 0.1E-11 0.0001])

hold; %h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );
h(2) = semilogy(op2(2).V_g(op2(2).n_iter>0),op2(2).I_s(op2(2).n_iter>0));
h(3) = semilogy(op2(3).V_g(op2(3).n_iter>0),op2(3).I_s(op2(3).n_iter>0));
h(4) = semilogy(op2(4).V_g(op2(4).n_iter>0),op2(4).I_s(op2(4).n_iter>0));
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );
%h(5) = semilogy(op2(5).V_g(op2(5).n_iter>0),op2(5).I_s(op2(5).n_iter>0));
%h(6) = semilogy(op2(6).V_g(op2(6).n_iter>0),op2(6).I_s(op2(6).n_iter>0));
h(7) = semilogy(op2(7).V_g(op2(7).n_iter>0),op2(7).I_s(op2(7).n_iter>0));
h(8) = semilogy(op2(8).V_g(op2(8).n_iter>0),op2(8).I_s(op2(8).n_iter>0));

hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(4,:);
h(8).Color = map(4,:);


legend([h(1) h(3) h(5) h(7)],{'1G','FBG', '2G', '3G'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')

%%%*****************************************************************************Figura 2
figure
h(1) = semilogy(op2(1).V_g(op2(1).n_iter>0),op2(1).I_s(op2(1).n_iter>0)); %1G

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 1 0.1E-11 0.0001])

hold; %h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );
h(2) = semilogy(op2(2).V_g(op2(2).n_iter>0),op2(2).I_s(op2(2).n_iter>0)); %1G
h(3) = semilogy(op2(3).V_g(op2(3).n_iter>0),op2(3).I_s(op2(3).n_iter>0)); %FBG
h(4) = semilogy(op2(4).V_g(op2(4).n_iter>0),op2(4).I_s(op2(4).n_iter>0)); %FBG

h(5) = semilogy(op7(1).G,op7(1).Isum); % 1g antigo
h(6) = semilogy(op7(2).G,op7(2).Isum); % 1g antigo
h(7) = semilogy(op7(3).G,op7(3).Isum); % fbg antigo
h(8) = semilogy(op7(4).G,op7(4).Isum); % fbg antigo

hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(1,:);
h(6).Color = map(1,:);
h(7).Color = map(2,:);
h(8).Color = map(2,:);


h(5).LineStyle = '--';
h(6).LineStyle = '--';
h(7).LineStyle = '--';
h(8).LineStyle = '--';

%legend([h(1) h(3) h(5) h(7)],{'1G','FBG', '1G old', 'FBG old'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')
legend([h(1) h(3)],{'1G','FBG'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')

%%%*****************************************************************************Figura 3
% figure
% h(1) = semilogy(op2(7).V_g(op2(7).n_iter>0),op2(7).I_s(op2(7).n_iter>0)); %3G

% %set(h,'linewidth',2)
% xlabel('V_{gs} (V)')
% ylabel('I_{ds} (A)')
% %axis([-1.5 1 0.1E-11 0.0001])

% hold; %h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );
% h(2) = semilogy(op2(8).V_g(op2(8).n_iter>0),op2(8).I_s(op2(8).n_iter>0)); %3G
% h(3) = semilogy(op2(9).V_g(op2(9).n_iter>0),op2(9).I_s(op2(9).n_iter>0)); %3G
% h(4) = semilogy(op2(10).V_g(op2(10).n_iter>0),op2(10).I_s(op2(10).n_iter>0)); %3G

% h(5) = semilogy(op7(7).G,op7(7).Isum); % 3g antigo
% h(6) = semilogy(op7(8).G,op7(8).Isum); % 3g antigo
% h(7) = semilogy(op7(9).G,op7(9).Isum); % 3g antigo
% h(8) = semilogy(op7(10).G,op7(10).Isum); % 3g antigo

% hold off;

% h(1).Color = map(1,:);
% h(2).Color = map(1,:);
% h(3).Color = map(2,:);
% h(4).Color = map(2,:);
% h(5).Color = map(3,:);
% h(6).Color = map(3,:);
% h(7).Color = map(4,:);
% h(8).Color = map(4,:);


% %h(5).LineStyle = '--';
% %h(6).LineStyle = '--';
% %h(7).LineStyle = '--';
% %h(8).LineStyle = '--';

% %legend([h(1) h(3) h(5) h(7)],{'1G','FBG', '1G old', 'FBG old'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
% %legend('boxoff')
% legend([h(1) h(3) h(5) h(7)],{'3G n','3G p','3G n old','3G p old'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
% %legend('boxoff')



%%%*****************************************************************************Figura 4
figure
h(1) = semilogy(op2(1).V_g(op2(1).n_iter>0),op2(1).I_s(op2(1).n_iter>0)); %1G

%set(h,'linewidth',2)
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
%axis([-1.5 1 0.1E-11 0.0001])

hold; %h(2) = semilogy(op7(2).G(op7(2).n_iter>0) ,op7(2).Isum(op7(2).n_iter>0) );
h(2) = semilogy(op2(2).V_g(op2(2).n_iter>0),op2(2).I_s(op2(2).n_iter>0)); %1G
h(3) = semilogy(op2(3).V_g(op2(3).n_iter>0),op2(3).I_s(op2(3).n_iter>0)); %FBG
h(4) = semilogy(op2(4).V_g(op2(4).n_iter>0),op2(4).I_s(op2(4).n_iter>0)); %FBG
h(5) = semilogy(op2(5).V_g,op2(5).I_s );
h(6) = semilogy(op2(6).V_g,op2(6).I_s );
h(7) = semilogy(op2(7).V_g(op2(7).n_iter>0),op2(7).I_s(op2(7).n_iter>0)); %3G
h(8) = semilogy(op2(8).V_g(op2(8).n_iter>0),op2(8).I_s(op2(8).n_iter>0)); %3G

h(9) = semilogy(op7(1).G,op7(1).Isum); % 1g antigo
h(10) = semilogy(op7(2).G,op7(2).Isum); % 1g antigo
h(11) = semilogy(op7(3).G,op7(3).Isum); % fbg antigo
h(12) = semilogy(op7(4).G,op7(4).Isum); % fbg antigo
h(13) = semilogy(op7(5).G,op7(5).Isum); % 2g antigo
h(14) = semilogy(op7(6).G,op7(6).Isum); % 2g antigo
h(15) = semilogy(op7(7).G,op7(7).Isum); % 3g antigo
h(16) = semilogy(op7(8).G,op7(8).Isum); % 3g antigo
  
hold off;

h(1).Color = map(1,:);
h(2).Color = map(1,:);
h(3).Color = map(2,:);
h(4).Color = map(2,:);
h(5).Color = map(3,:);
h(6).Color = map(3,:);
h(7).Color = map(4,:);
h(8).Color = map(4,:);

h(9).Color = map(1,:);
h(10).Color = map(1,:);
h(11).Color = map(2,:);
h(12).Color = map(2,:);
h(13).Color = map(3,:);
h(14).Color = map(3,:);
h(15).Color = map(4,:);
h(16).Color = map(4,:);


h(9).LineStyle = '--';
h(10).LineStyle = '--';
h(11).LineStyle = '--';
h(12).LineStyle = '--';
h(13).LineStyle = '--';
h(14).LineStyle = '--';
h(15).LineStyle = '--';
h(16).LineStyle = '--';

%legend([h(1) h(3) h(5) h(7)],{'1G','FBG', '1G old', 'FBG old'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')
legend([h(1) h(3) h(5) h(7)],{'1G','FBG','2G','3G'}, 'Location', 'best');  % Only the blue and green lines appear in the legend
%legend('boxoff')

% for i=1:8
% op2(i).I_s(find(op2(i).V_g == 0))
% end

% I_off:
% 1G:	2.3791e-10
% FBG: 1.1525e-10
% 2G: 6.5657e-11
% 3G: 2.1482e-10
