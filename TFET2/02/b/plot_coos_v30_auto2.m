%pa = 'C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02'
%cd(pa);

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\02_spacer\nLP_sp_10
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\02_spacer\nLP_sp_20
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\02_spacer\nLP_sp_30
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET2\02_otimizacao\04_tbox\nLP_tbox_25



%% padrao
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

% ax = gca;
% ax.XTick = [0 8 200 350 500];
% xticks = {0 8 200 350 500};
% set(ax,'XTickLabel',xticks); % set tick labels to updated values


%% band profile
%h=figure;


%%%%%%%
%[A,a,fl] = readELPA('nLP_sp_30/nLP_sp_30_op1_dd_inqu.elpa'); %0.8V 
%[A,a,fl] = readELPA('nLP_sp_30/nLP_sp_30_op21_dd_inqu.elpa'); %0.6V 
%[A,a,fl] = readELPA('nLP_sp_30/nLP_sp_30_op41_dd_inqu.elpa'); %0.4V 
%[A,a,fl] = readELPA('nLP_sp_30/nLP_sp_30_op61_dd_inqu.elpa'); %0.2V 
%[A,a,fl] = readELPA('nLP_sp_30/nLP_sp_30_op81_dd_inqu.elpa'); %0.0V 

%[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op1_dd_inqu.elpa'); %0.8V 
%[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op21_dd_inqu.elpa'); %0.6V 
%[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op41_dd_inqu.elpa'); %0.4V 
%[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op61_dd_inqu.elpa'); %0.2V 
%[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op81_dd_inqu.elpa'); %0.0V 


%%%%%%%%%%%%%%%só contato tipo n
for i=1:4

h=figure;

if i == 1
	[A,a,fl] = readELPA('nLP_sp_10/nLP_sp_10_op101_dd_inqu.elpa'); %0.8V 
end

if i == 2
	[A,a,fl] = readELPA('nLP_sp_20/nLP_sp_20_op101_dd_inqu.elpa'); %0.6V 
end

if i == 3
	[A,a,fl] = readELPA('nLP_sp_30/nLP_sp_30_op101_dd_inqu.elpa'); %0.4V 
end

if i == 4
	[A,a,fl] = readELPA('nLP_tbox_25/nLP_tbox_25_op101_dd_inqu.elpa'); %0.2V 
end

if i == 5
	[A,a,fl] = readELPA('nLP_vpg_106/nLP_vpg_106_op101_dd_inqu.elpa'); %0.0V 
end

if i == 6
	[A,a,fl] = readELPA('nLP_vpg_108/nLP_vpg_108_op101_dd_inqu.elpa'); %0.8V 
end

if i == 7
	[A,a,fl] = readELPA('nLP_vpg_110/nLP_vpg_110_op101_dd_inqu.elpa'); %0.6V 
end

if i == 8
	[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op41_dd_inqu.elpa'); %0.4V 
end

if i == 9
	[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op61_dd_inqu.elpa'); %0.2V 
end

if i == 10
	[A,a,fl] = readELPA('nHP_sp_30/nHP_sp_30_op81_dd_inqu.elpa'); %0.0V 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[V_g, V_s, V_d]=minhafuncao2(fl);

%for para saber se é vb1 ou cb1
flag = 0;
for j=1:length(a)
    if (strcmp(a(j),'vb1'))
        flag = flag + 1;
    end
    
    if (strcmp(a(j),'cb1'))
        flag = flag + 2;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vd    = -1;
x_add = 10;
x     = 1e9*A(:,strcmp(a,'x'));  % position [nm]
cb1   = A(:,strcmp(a,'cb1'));    % conduction band [eV]
qfn   = -A(:,strcmp(a,'phi_n')); % quasi Fermi level electrons [eV]
vb1   = A(:,strcmp(a,'vb1'));    % valence band [eV]
qfp   = -A(:,strcmp(a,'phi_p')); % quasi Fermi level holes [eV]

if flag == 1
 plot(x,vb1,'r','linewidth',2);hold on   
elseif flag == 2
 plot(x,cb1,'k','linewidth',2);hold on
else
 plot(x,cb1,'k','linewidth',2);hold on
 plot(x,qfn,'k--','linewidth',2);hold on
 plot(x,vb1,'r','linewidth',2);hold on
 plot(x,qfp,'r--','linewidth',2);hold on
end        


plot([x(1)-x_add,x(1)],[0,0],'r','linewidth',2)
%%plot([x(end),x(end)+x_add],-[vd,vd]*1,'r','linewidth',2)
plot([x(end),x(end)+x_add],-[V_d,V_d]*1,'r','linewidth',2)

%n
%set(gca,'ylim',[-1.5,0.5]);
set(gca,'ylim',[-1.5,1]);
%set(gca,'ylim',[-1.2,0.8]);

%p
%set(gca,'ylim',[-0.7,1.5]);
%set(gca,'ylim',[-0.7,1.7]);


set(gca,'xlim',[x(1)-x_add,x(end)+x_add]);
plot([x(1),x(1)],[get(gca,'ylim')],'--k')
plot([x(end),x(end)],[get(gca,'ylim')],'--k')

set(get(gca,'xlabel'),'string','x(nm)')
set(get(gca,'ylabel'),'string','E(eV)')

%ax = gca;
%ax.XTick = [0 100 200 300 400 500];
%xticks = {0 100 200 300 400 500};
%set(ax,'XTickLabel',xticks); % set tick labels to updated values

hold off

if i == 1
	print('nLP_sp_10', '-depsc'); %0.8V
end        
           
if i == 2  
	print('nLP_sp_20', '-depsc'); %0.6V 
end        
           
if i == 3  
	print('nLP_sp_30', '-depsc');%0.4V 
end        
           
if i == 4  
	print('nLP_sp_40', '-depsc');%0.2V 
end        
           
if i == 5  
	print('nLP_vpg_106', '-depsc');%0.0V 
end        
           
if i == 6  
	print('nLP_vpg_108', '-depsc'); %0.8V 
end        
           
if i == 7  
	print('nLP_vpg_110', '-depsc'); %0.6V 
end


end %end do for i=1:10