clear;
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Figure settings for publications %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
 
% The new defaults will not take effect if there are any open figures. To
% use them, we close 08_overlap figures, and then repeat the first example.
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

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_10V
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\02_dia16\n_esq_3g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_07v30\03_variacoes3g\n_3g_d16_program_18V

%%
%%%Read data and store it in a struct
		
op7 = [];			

aux = 3

if aux == 1
op7 =  rdcelpa('n_3g_d16_program_10V/n_3g_d16_program_10V_op26_dd_inqu.elpa','*',[],op7);
end

if aux == 2
op7 =  rdcelpa('n_esq_3g/n_esq_3g_op9_dd_inqu.elpa','*',[],op7);
end

if aux == 3
op7 =  rdcelpa('n_3g_d16_program_18V/n_3g_d16_program_18V_op26_dd_inqu.elpa','*',[],op7);
end


%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');


%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done


%40               x                 y                 z               cb1               vb1          psi_semi             f_mag               f_x             phi_n             phi_p          V_band_n          V_band_p               d_n               d_p           d_n_cb1           d_p_vb1               dop         dop_donor      dop_acceptor         d_n_traps         d_p_traps      space_charge             j_mag            jn_mag            jp_mag              jn_x              jp_x           jn_dd_x           jp_dd_x           j_tun_x          jn_tun_x          jp_tun_x         gen_n_tun         gen_p_tun            recomb              temp           mob_n_x           mob_p_x             rhs_n             rhs_p

%j_mag 	Magnitude of total current density
%jn_mag 	Magnitude of electron current density
%jp_mag 	Magnitude of hole current density
%j_x 	Total current density in x-direction
%jn_x 	Electron current density in x-direction
%jp_x 	Hole current density in x-direction
%jn_dd_x 	Drift diffusion electron current density in x-direction
%jp_dd_x 	Drift diffusion hole current density in x-direction
%j_tun_x 	Total tunnel current in x-direction
%jn_tun_x 	Electron tunnel current in x-direction
%jp_tun_x 	Hole tunnel current in x-direction

%+ jn_x, jp_x, j_tun_x, j_x

op7(1).x = op7(1).x * 10^9;
op7(1).jn_mag = abs(op7(1).jn_mag);
op7(1).jp_mag = abs(op7(1).jp_mag);
op7(1).j_tun_x = abs(op7(1).j_tun_x);
op7(1).j_mag = abs(op7(1).j_mag);

op7(1).jn_x = abs(op7(1).jn_x);
op7(1).jp_x = abs(op7(1).jp_x);

op7(1).jn_dd_x = abs(op7(1).jn_dd_x);
op7(1).jp_dd_x = abs(op7(1).jp_dd_x);

figure
h(1) = semilogy(op7(1).x,op7(1).j_mag );
hold
h(2) = semilogy(op7(1).x,op7(1).jp_dd_x );
h(3) = semilogy(op7(1).x,op7(1).jn_dd_x);
h(4) = semilogy(op7(1).x,op7(1).j_tun_x);
                                
%h(6) = semilogy(op7(1).x,(op7(1).jn_tun + op7(1).jn_drift + op7(1).jn_diff + op7(1).jn_therm) );
%%h(6) = semilogy(op7(1).x, soma );

%set(h,'linewidth',2)
%axis([-1.5 1.5 0.1E-10 0.0001])
xlabel('x (nm)')
ylabel('I (A)')
axis([0 500 0.1E-25 8e-9])

%ay = gca;
%ay.YTick = [1e-15 1e-13 1e-11 1e-9 1e-7 1e-5];

%if aux == 4 || aux == 5 || aux == 6
%axis([0 500 0.1E-11 3e-5])
%ay = gca;
%ay.YTick = [1e-11 1e-10 1e-9 1e-8 1e-7 1e-6 1e-5];
%end

%f = gcf;
%h.XTickLabel = ['0','100','200','300','400','500'];

%xticks([0 100 200 300 400 500])
%xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi'})



hold off;

h(1).Color = map(1,:);
h(2).Color = map(2,:);
h(3).Color = map(3,:);
h(4).Color = map(4,:);
%h(5).Color = map(5,:);
%h(6).Color = map(6,:);
% h(7).Color = map(4,:);
% h(8).Color = map(5,:);
% h(9).Color = map(5,:);

% h(10).Color = map(6,:);
% h(11).Color = map(6,:);


%legend([h(1) h(2) h(3) h(4)], {'j_{mag}', 'jn_x', 'jp_x','j_{tun x}'},'Location', 'best'); 
legend([h(1) h(2) h(3) h(4)], {'j_{mag}', 'j_{p,dd}', 'j_{n,dd}','j_{tun}'},'Location', 'northeast'); 
%legend([h(1) h(2) h(3) h(4)], {'j_{mag}', 'jn_{mag}', 'jp_{mag}','j_{tun x}'},'Location', 'best'); 
legend('boxoff')
	
% legend([h(1) h(2) h(3) h(4) h(5)],...
    % {'jp', 'jp_{therm}','jp_{diff}', 'jp_{drift}', 'jp_{tun}'},'Location', 'best'); 

% legend([h(1) h(2) h(3) h(4) h(5) h(6)],...
    % {'jn', 'jn_{therm}','jn_{diff}', 'jn_{drift}', 'jn_{tun}', 'soma'},'Location', 'best'); 
