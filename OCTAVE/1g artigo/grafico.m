addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02 %1g

clear all
%close all
clc

op7 = [];

%op7 =  rdcelpa('s/p_esq_3g_fet_semmod_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('s/p_dir_3g_fet_semmod_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('s/n_esq_3g_fet_semmod_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('s/n_dir_3g_fet_semmod_dd_iv.elpa','*',[],op7);

[op7] =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op7);
[op7] =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op7);
[op7] =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
[op7] =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);



op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
op7(3).Isum = abs(op7(3).Isum);
op7(4).Isum = abs(op7(4).Isum);
%semilog_elpa(op7,{{'Isum','G'}});


figure
%h(19) = semilogy(tres(:,1),tres(:,2));
h(1) = semilogy(op7(1).G,op7(1).Isum );
%set(h,'linewidth',2)
hold
h(2) = semilogy(op7(2).G,op7(2).Isum );
h(3) = semilogy(op7(3).G,op7(3).Isum );
h(4) = semilogy(op7(4).G,op7(4).Isum );      

%axis([-1.5 1.5 0.1E-11 0.0001])

%%artigo
axis([-1.5 1.5 6E-9 0.00001])
%axis([-2 2 1E-10 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')


hold off;

% h(1).Color = 'r';
% h(2).Color = 'r';
% h(3).Color = 'b';
% h(4).Color = 'b';

%%artigo
h(1).Color = [0 0.5 0];
h(2).Color = [0 0.5 0]';
h(3).Color = [0 0 1];
h(4).Color = [0 0 1];

h(1).LineStyle = '--';
h(2).LineStyle = '--';

%%artigo
 legend([h(3) h(1)],...
     {'n-type','p-type'},...
 	'Location', 'best');

%print('2g_transfer_n_p', '-depsc')