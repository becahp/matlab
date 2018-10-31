function [ss]=subslope3(op7,auxOp, aux, aux2)

%% para diametro = 1.6nm
% auxOp
% 1 - fbg
% 2 - 1g
% 3 - 2g
% 4 - 3g

op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);


if auxOp == 1 || auxOp == 3 
%primeiro pega os valores interessantes
%FBG e %2G
aux = 4; %7
aux2 = 0; %4
end

if auxOp == 2
%1G
aux = 4; %7
aux2 = 1; %4
end

if auxOp == 4
%3G
aux = 3; %7
aux2 = 0; %4
end



for i=1:aux
	%x(i) = op7(1).G(aux2+i);
    %y(i) = op7(1).Isum(aux2+i);
    
    x(i) = op7(2).G(aux2+i);
    y(i) = op7(2).Isum(aux2+i);
end
    

%faz o polyfit
%%p(1) : slope		
%%p(2) : constant	
p = polyfit(x,log10(y), 1);

%f1 = polyval(p, x);
%fit = power(10,polyval(p, x));
%fit = power(10,polyval(p, x));

%figure
%semilogy(x,y,'r');
%hold on
%x = x -0.1;
%plot(x,fit,'k--');

%ss = 1/p(1) * 10^3;

%retorna o sub slope
ss = round((1/p(1) * 10^3),0);

