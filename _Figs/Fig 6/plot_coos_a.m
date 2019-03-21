%usado
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\13_3g_vds
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_05\10_vgs

%% padrao
clear;
 
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

% ax = gca;
% ax.XTick = [0 8 200 350 500];
% xticks = {0 8 200 350 500};
% set(ax,'XTickLabel',xticks); % set tick labels to updated values


%% band profile
h=figure;
aux = 1

if aux == 1
%%13_3g_vds/
[A,a,fl] = readELPA('n_dir_3g_100_12V_10V_op3_dd_inqu.elpa'); %2V 
end

%[A,a,fl] = readELPA('10_vgs/n_dir_3g_100_12V_op3_dd_inqu.elpa'); %2V 
if aux == 2
[A,a,fl] = readELPA('n_dir_3g_100_12V_14V_op3_dd_inqu.elpa'); %2V 
end

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[G,S,D] = minhafuncao(fl);

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
plot([x(end),x(end)+x_add],-[D,D]*1,'r','linewidth',2)

%n
set(gca,'ylim',[-1.5,0.5]);

%p
%set(gca,'ylim',[-0.7,1.5]);
%set(gca,'ylim',[-0.7,1.7]);


set(gca,'xlim',[x(1)-x_add,x(end)+x_add]);
plot([x(1),x(1)],[get(gca,'ylim')],'--k')
plot([x(end),x(end)],[get(gca,'ylim')],'--k')

set(get(gca,'xlabel'),'string','x(nm)')
set(get(gca,'ylabel'),'string','E(eV)')

ax = gca;
ax.XTick = [0 100 200 300 400 500];
xticks = {0 100 200 300 400 500};
set(ax,'XTickLabel',xticks); % set tick labels to updated values

if aux == 1
elp.mat=[x,cb1, qfn, vb1, qfp];
elp.var_names={'x','cb1','qfn','vb1','qfp'};
elp.title='Fig6a';
save_elpa([elp.title,'.elpa'],elp)
end

if aux == 2
elp.mat=[x,cb1, qfn, vb1, qfp];
elp.var_names={'x','cb1','qfn','vb1','qfp'};
elp.title='Fig6b';
save_elpa([elp.title,'.elpa'],elp)
end