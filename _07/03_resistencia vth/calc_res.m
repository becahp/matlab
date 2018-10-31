%function [res] = calc_res(i, op2)
function [r_on,r_out] = calc_res(i, op2)

%funcao para calcular a resistencia de entrada (R_on) da curva de saida
%pegando 3 segmentos, calcula a resistencia em cada um deles e depois tira a média
%calcula também a resistencia de saida (r_out)
%final da variavel
% 1G FBG 2G 3G
% x  x   x  x
% x  x   x  x

segmentos = 3;

indice = struct('a',{},'b',{},'c',{});
res = struct('a',{},'b',{},'c',{},'media',{},'saida',{});

%%%%%%%%%%%%%%%%%% R_on
indice(1).a = find(op2(i).D>0.0 & op2(i).D<0.2);
indice(1).b = find(op2(i).D>0.2 & op2(i).D<0.4);
indice(1).c = find(op2(i).D>0.4 & op2(i).D<0.6);

%p(i) slope; p(2) constant
p(1,:) = polyfit(op2(i).D(indice(1).a),op2(i).Isum(indice(1).a), 1);
p(2,:) = polyfit(op2(i).D(indice(1).b),op2(i).Isum(indice(1).b), 1);
p(3,:) = polyfit(op2(i).D(indice(1).c),op2(i).Isum(indice(1).c), 1);

%res(i) = 1/p(i);
res(1).a = 1/p(1,1);
res(1).b = 1/p(2,1);
res(1).c = 1/p(3,1);

res(1).media = (res(1).a + res(1).b + res(1).c) / segmentos;

r_on = res(1).media;

%res(1)

%%%%%%%%%%%%%%%%%% R_out
if i == 4
indice_out = find(op2(i).D>=1.0 & op2(i).D<=1.2); %para 3g
else
indice_out = find(op2(i).D>=1.8 & op2(i).D<=2.0);
end

p_out = polyfit(op2(i).D(indice_out),op2(i).Isum(indice_out), 1);

res(1).saida = 1/p_out(1);

r_out = res(1).saida;