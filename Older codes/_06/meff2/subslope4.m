%function [ss]=subslope3(op7,auxOp)

%% para diametro = 1.6nm
% auxOp
% 1 - fbg
% 2 - 1g
% 3 - 2g
% 4 - 3g

clear all
%close all
clc


addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\06_meff\fbg

op7 = [];

op7 = rdcelpa('2g/n_esq_meff_004_dd_iv.elpa','*',[],op7);
op7 = rdcelpa('2g/n_dir_meff_004_dd_iv.elpa','*',[],op7);

%zeroFlag = 1; %2g meff 04 e 06
zeroFlag = 0;

auxOp = 3

% Ioff = op7(1).Isum(17);	%Ioff
% Ion = op7(2).Isum(13);	%Ion
% I0 = op7(1).Isum(1);	%Ioff_0

% Ion/Ioff

% op7(1).G(1)
% op7(1).G(17)
% op7(2).G(13)

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);


figure
h(1) = semilogy(op7(1).G,op7(1).Isum );
%set(h,'linewidth',2)
%axis([-1.5 1 0.1E-10 0.0001])
%axis([-1.5 1.5 0.1E-5 0.0001])

xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')

hold
h(2) = semilogy(op7(2).G,op7(2).Isum );
%h(3) = semilogy(op7(3).G,op7(3).Isum );
%h(4) = semilogy(op7(4).G,op7(4).Isum );

h(1).Color  = 'b'; %'r';
h(2).Color  = 'b'; %'r';

if auxOp == 1
legend( h(1), 'FBG', 'Location', 'best');
end

if auxOp == 2
legend( h(1), '1G', 'Location', 'best');
end

if auxOp == 3
legend( h(1), '2G', 'Location', 'best');
end

if auxOp == 4
legend( h(1), '3G', 'Location', 'best');
end


if auxOp == 1
%FBG
aux = 12; %7
aux2 = 2; %4
end

if auxOp == 3 
%2G
aux = 6; %7
aux2 = 0; %4
end

if auxOp == 2
%1G
aux = 10; %7
aux2 = 4; %4
end

if auxOp == 4
%3G
aux = 3; %7
aux2 = -2; %4
end


op = meu_merge(op7);

%saber onde é o meio da curva
%op.G(30)

zero = 30;

if zeroFlag == 1
zero = 54;
end


for i=1:aux
	%x(i) = op7(1).G(aux2+i);
    %y(i) = op7(1).Isum(aux2+i);
    
    x(i) = op.G(zero+aux2+i);
    y(i) = op.Isum(zero+aux2+i);
end
    

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%%%%%%%%%%%%%5%retorna o sub slope
ss = round((1/p(1) * 10^3),0);

%f1 = polyval(p, x);
fit = power(10,polyval(p, x));
%fit = power(10,polyval(p, x));

%figure
semilogy(x,y,'r');
%hold on
x = x -0.1;
plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

var = round((1/p(1) * 10^3),0);

str = num2str(abs(var));
s = strcat('SS = ',str, ' mV/dec');

annotation('textbox','String',s,...
    'FontSize', 12, 'LineStyle', 'none', 'Position',...
    [0.30 0.45 0.065 0.066],...
    'FitBoxToText','on');

%p = polyfit(op7(1).G,log(op7(1).Isum), 1);
%f1 = polyval(p, op7(1).G);
%plot(op7(1).G,f1,'b--');
hold off;

