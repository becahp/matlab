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

	
%%
%%%Read data and store it in a struct
op2 = [];		

vbg = [1.0 0.6 0.2 0 -0.2 -0.6 -1.0];
vth_hp = [0.0200    0.0400    0.0500    0.0600    0.0700    0.1400    0.2500]; 
vth_lp = [0.3600	0.3600	  0.3600	0.3600	  0.3400	0.3300	  0.3300]; 

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done
%sel = 2;
%1o = 6:7
%2o = 3:5
%3o = 1:2
res = [];
for sel=1:3
sel
if sel == 3
a = 6;
b = 7;
end

if sel == 2
a = 3;
b = 5;

end
if sel == 1
a = 1;
b = 2;
end

x = vbg(a:b);
y = vth_hp(a:b);

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,y, 1);
res(1,sel) = p(1);
res(2,sel) = (vth_hp(b)-vth_hp(a)) / (vbg(b) - vbg(a)) ;
%res
end


pule = 0;
if pule == 1
figure
h(1) = plot(vbg,vth_hp, '-o');
xlabel('V_{\rm BG} (V)')
ylabel('V_{\rm th} (V)')

axis([-1.1 1.1 0 0.3]);
hold off;
%h(1).Color = map(1,:);


%legend({'VBG = 1.0 V','VBG = 0.6V','VBG = 0.2V','VBG = 0.0V','VBG = -0.2V','VBG = -0.6V','VBG = -1.0V'}, 'Location', 'northeast');
%legend('boxoff')
%print('vth_HP', '-depsc');


figure
h(1) = plot(vbg,vth_lp, '-o');
xlabel('V_{\rm BG} (V)')
ylabel('V_{\rm th} (V)')
axis([-1.1 1.1 0.3 0.4]);
hold off;

%print('vth_LP', '-depsc');
end

cd ..
elp.mat=[vbg',vth_hp'];
elp.var_names={'V_bg','V_th'};
elp.title='Fig4_d1';
save_elpa(['Data/',elp.title,'.elpa'],elp)
	
elp.mat=[vbg',vth_lp'];
elp.var_names={'V_bg','V_th'};
elp.title='Fig4_d2';
save_elpa(['Data/',elp.title,'.elpa'],elp)

cd 'Fig4a'