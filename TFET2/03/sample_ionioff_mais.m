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
    0.75, 0, 0.75
    0.25, 0.25, 0.25
	0, 0, 1];



addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\HP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\LP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\03_backgate\re

%vbg = 1V %vpg = -1V %if aux == 11 %vbg = inverso com vds 0.5V NLP
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\00_ideal\nLP_vds05


%%
%%%Read data and store it in a struct
op2 = [];	
%aux = 2
%%%%%%%%%

%for aux=1:2
aux = 2
if aux == 1
op2 =  rdcelpa('HP/nHP_BG_010_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('HP/nHP_BG_000_dd_iv.elpa','*',[],op2);
str = 'HP';
end

if aux == 2
op2 =  rdcelpa('nLP_vds05_dd_iv.elpa','*',[],op2);
op2 =  rdcelpa('LP/nLP_BG_000_dd_iv.elpa','*',[],op2);

op2(1).I_d = flip(op2(1).I_d);
str = 'LP';
end

op2(1).I_d = abs(op2(1).I_d); %1V
op2(2).I_d = abs(op2(2).I_d); %0V


for i=1:length(op2)
ion1(i) = op2(i).I_d(1); %1V
ion2(i) = op2(i).I_d(51); %0.5V

%ioff(i) = op2(i).I_d(101); %0V
%vgb(i) = op2(i).V_gb(1);
%ratio(i) = ion(i)./ioff(i);
end %for i

%end % for aux

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


pule = 0
if pule == 1
figure
h(1) = plot(vgb, ion * 1e6);
xlabel('V_{GB} (V)')
ylabel('I_{on} (\mu A)')

if aux == 2
ylim([0 0.2]);
end

strAux = [str '_ion'];
print(strAux, '-depsc');

figure
if aux == 1
h(1) = plot(vgb, ioff * 1e9);
ylabel('I_{off} (nA)')
end
if aux == 2
h(1) = plot(vgb, ioff * 1e12);
ylabel('I_{off} (pA)')
end
xlabel('V_{GB} (V)')


strAux = [str '_ioff'];
%print(strAux, '-depsc');


figure
h(1) = plot(vgb, ratio);
xlabel('V_{GB} (V)')
ylabel('I_{on}/I_{off}')

strAux = [str '_ratio'];
%print(strAux, '-depsc');
end