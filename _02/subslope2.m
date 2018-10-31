clear all;

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\00
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\01
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\02
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\03

%addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_02_novassimul\04
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_04_re\09_3g %novo 3g

op7 = [];

auxOp = 4

%%All of them
if auxOp == 1
op7 =  rdcelpa('01/n_esq_fbg_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('01/n_dir_fbg_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('01/p_esq_fbg_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('01/p_dir_fbg_dd_iv.elpa','*',[],op7);
end 

if auxOp == 2
op7 =  rdcelpa('02/n_esq_1g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('02/n_dir_1g_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('02/p_esq_1g_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('02/p_dir_1g_dd_iv.elpa','*',[],op7);

end 

if auxOp == 3
op7 =  rdcelpa('03/n_esq_2g_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('03/n_dir_2g_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('03/p_esq_2g_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('03/p_dir_2g_dd_iv.elpa','*',[],op7);

end 

if auxOp == 4 || auxOp == 5
% op7 =  rdcelpa('04/n_esq_3g_dd_iv.elpa','*',[],op7);
% op7 =  rdcelpa('04/n_dir_3g_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('04/p_esq_3g_dd_iv.elpa','*',[],op7);
%%op7 =  rdcelpa('04/p_dir_3g_dd_iv.elpa','*',[],op7);

op7 =  rdcelpa('09_3g/n_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('09_3g/n_dir_3g_100_1V_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('09_3g/p_esq_3g_100_1V_dd_iv.elpa','*',[],op7);
%op7 =  rdcelpa('09_3g/p_dir_3g_100_1V_dd_iv.elpa','*',[],op7);


end

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);
%op7(3).Isum = abs(op7(3).Isum);
%op7(4).Isum = abs(op7(4).Isum);

figure
h(1) = semilogy(op7(1).G,op7(1).Isum );

%set(h,'linewidth',2)
axis([-1.5 1 0.1E-10 0.0001])
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

if auxOp == 4 || auxOp == 5
legend( h(1), '3G', 'Location', 'best');
end


if auxOp == 1 || auxOp == 3 || auxOp == 4
%primeiro pega os valores interessantes
%FBG e %1G e %2G
aux = 4; %7
aux2 = 0; %4
end

if auxOp == 2
%3G
aux = 4; %7
aux2 = 1; %4
end

if auxOp == 5
%3G
aux = 7; %7
aux2 = 3; %4
end

for i=1:aux
	%x(i) = op7(1).G(aux2+i);
    %y(i) = op7(1).Isum(aux2+i);
    
    x(i) = op7(2).G(aux2+i);
    y(i) = op7(2).Isum(aux2+i);
end

if auxOp == 5
    for i=1:aux
        %x(i) = op7(1).G(aux2+i);
        %y(i) = op7(1).Isum(aux2+i);

        x(i) = op7(1).G(aux2+i);
        y(i) = op7(1).Isum(aux2+i);
    end
end
    

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

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
