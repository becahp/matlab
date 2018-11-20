function [ss]=subslope3(op,auxOp, aux, aux2)
%% 
% op7 : elpa lido
% auxOp : encontrar zero
% aux/aux2: ajudam no cálculo do SS

%% para diametro = 1.6nm
% auxOp
% 1 - fbg
% 2 - 1g
% 3 - 2g
% 4 - 3g

%op = [];
op(1).I_d = abs(op(1).I_d);
%op7(2).I_d = abs(op7(2).I_d);

%op = meu_merge(op7);

%saber onde é o meio da curva
%op.V_g(30)

for i=1:aux
	%x(i) = op7(1).V_g(aux2+i);
    %y(i) = op7(1).I_d(aux2+i);
    
    x(i) = op.V_g(aux2+i);
    y(i) = op.I_d(aux2+i);
end

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%f1 = polyval(p, x);
%fit = power(10,polyval(p, x));
fit = power(10,polyval(p, x));


figure
semilogy(op.V_g,op.I_d);
hold on
semilogy(x,y,'r');

x = x -0.1;
plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

%retorna o sub slope
ss = round((1/p(1) * 10^3),0);

oiv30 = ss