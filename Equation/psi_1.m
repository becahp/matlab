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

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp_pot\nHP_BG_000_25
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_potential\nLP_BG_000_25

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\02_PGD_var\01_VPGS_n
%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\04_backgate


%%
%%%Read data and store it in a struct
%op1 = [];
%op2 = [];
%aux = 3
%%%%%%%%%

%pegar psi do elpa
%op1 =  rdcelpa('07_backgate_sp/nHP_BG_000_25_dd_iv.elpa','*',[],op1);
%op1 =  rdcelpa('07_backgate_sp/nLP_BG_000_25_dd_iv.elpa','*',[],op1);

%mod_name='cnt' shape='rect' 	 low_xyz= 10e-9  26e-9	50e-9 	upp_xyz= 119e-9  26e-9 50e-9 /
%op2 =  rdcelpa('nHP_BG_000_25/nHP_BG_000_25_op1_dd_psi.elpa','*',[],op2); %0V


%[A,a,fl] = readELPA('nHP_BG_000_25/nHP_BG_000_25_op1_dd_inqu.elpa'); %0.0V
%[V_g, V_s, V_d]=minhafuncao2(fl);

%C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_potential\nHP_BG_000_25
for k = 1:51
  % Create a text file name, and read the file.
  textFileName = ['07_backgate_sp_pot\nHP_BG_000_25\nHP_BG_000_25_op' num2str(k) '_dd_inqu.elpa'];
  
  %nHP_BG_000_25_op1_dd_inqu
  if exist(textFileName, 'file')
     %op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V

     [A,a,fl] = readELPA(textFileName); %0.0V
     [V_g, V_s, V_d]=minhafuncao2(fl);

     op2Vg(k) = V_g;
     %op2 = [];
  else
    fprintf('File %s does not exist.\n', textFileName);
  end
end

%C:\Users\becahp\UnB\Artigo\Simulacoes\TFET\04_hipotese\07_backgate_sp\nHP_BG_000_25
for k = 31:81
  % Create a text file name, and read the file.
  textFileName = ['07_backgate_sp\nHP_BG_000_25\nHP_BG_000_25_op' num2str(k) '_dd_inqu.elpa'];
  %nHP_BG_000_25_op1_dd_inqu
  if exist(textFileName, 'file')
     %op2 =  rdcelpa(textFileName,'*',[],op2);	%1 V

     [A,a,fl] = readELPA(textFileName); %0.0V
     [V_g, V_s, V_d]=minhafuncao2(fl);

     op1Vg(k-30) = V_g;
     %op2 = [];
  else
    fprintf('File %s does not exist.\n', textFileName);
  end
end

op1Vg = op1Vg';
op2Vg = op2Vg';
