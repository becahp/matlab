%pa = 'D:\E_Colleagues\Stefan_Blawid\problem_coos_3\';
%cd(pa);

%% transfer characteristic
[A,a] = readELPA('p_dir_vsat_model_var3_dd_iv.elpa');
Vg    = A(:,strcmp(a,'G'));
Id    = A(:,strcmp(a,'Isum'));
Id = abs(Id);
%figure
%semilogy(Vg,Id,'b');hold on

%% band profile
h=figure;
%[A,a,fl] = readELPA('b/p_dir_vsat_model_var3_op14_dd_inqu.elpa');
%[A,a,fl] = readELPA('b/p_esq_vsat_model_var3_op27_dd_inqu.elpa');
[A,a,fl] = readELPA('b/cnt-fet_p_bb_vstefan_op1_ball_inqu.elpa');
%[A,a,fl] = readELPA('b/reconfig_p_coosv20_ballbte_1_op5_ball_inqu.elpa');

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
 plot(x,vb1,'r','linewidth',2);hold on
end        

%plot(x,cb1,'k','linewidth',2);hold on
%plot(x,vb1,'r','linewidth',2);hold on
%plot(x,vb1,'k','linewidth',2);hold on
%plot(x,qfp,'r','linewidth',2);hold on

plot([x(1)-x_add,x(1)],[0,0],'r','linewidth',2)
%%plot([x(end),x(end)+x_add],-[vd,vd]*1,'r','linewidth',2)
plot([x(end),x(end)+x_add],-[D,D]*1,'r','linewidth',2)
%set(gca,'ylim',[-vd-0.1,0.2]);
set(gca,'xlim',[x(1)-x_add,x(end)+x_add]);
plot([x(1),x(1)],[get(gca,'ylim')],'--k')
plot([x(end),x(end)],[get(gca,'ylim')],'--k')
set(get(gca,'xlabel'),'string','x(nm)','fontsize',14)
set(get(gca,'ylabel'),'string','E(eV)','fontsize',14)
set(gca,'fontsize',14)
%%title('V_D=-1V  V_G=-1V','fontsize',14)
titulo = strcat('V_D = ',num2str(D),'V  V_G = ',num2str(G), 'V');
title(titulo,'fontsize',14)