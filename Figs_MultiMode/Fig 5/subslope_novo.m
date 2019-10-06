function [ss]=subslope4(opVg,opId,aux, aux2)
%% 
% op7 : elpa lido
% auxOp : encontrar zero
% aux/aux2: ajudam no cálculo do SS


%op = [];
%op(1).I_d = abs(op(1).I_d);
opId = abs(opId);


for i=1:aux
	%x(i) = op7(1).V_g(aux2+i);
    %y(i) = op7(1).I_d(aux2+i);
    
    x(i) = opVg(aux2+i);
    y(i) = opId(aux2+i);
end

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%f1 = polyval(p, x);
%fit = power(10,polyval(p, x));
fit = power(10,polyval(p, x));


%figure
%semilogy(opVg,opId);
%hold on
semilogy(x,y,'r');

x = x -0.01;
%plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

%retorna o sub slope
ss = round((1/p(1) * 10^3),0);

oiv30 = ss