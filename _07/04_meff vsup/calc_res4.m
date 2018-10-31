function [r_out] = calc_res4(i, op2,aux)

teste = 5;

% %%%%%%%%%%%%%%%%%% R_out para Vsup
if aux == 4
indice_out = find(op2(i).V_d>0.5 & op2(i).V_d<0.7); %para 3g
%indice_out = find(op2(i).V_d>=1.0 & op2(i).V_d<=1.2); %para 3g

a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));

r_out = b/a;

else
if teste == 1 %fit de 1V a 2V
indice_out = find(op2(i).V_d>0.9 & op2(i).V_d<2);
%indice_out = find(op2(i).V_d>=1.8 & op2(i).V_d<=2);


p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);

res(1).saida = 1/p_out(1);

r_out = res(1).saida;
end

if teste == 2 %diferenca finita de 1 a 2V
	maximo(i) = find(op2(i).V_d>=1.0,1);
	if (maximo(i) == 0) || (maximo(i) == 1)
		op2(i).V_d = wrev(op2(i).V_d);
		op2(i).I_d = wrev(op2(i).I_d);
	end

	indice_out = find(op2(i).V_d>=1.0 & op2(i).V_d<=2); %para 3g

	a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
	b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));

	r_out = b/a;
end

if teste == 3 %diferenca finita para 2V
maximo(i) = find(op2(i).V_d>=1.0,1);
if (maximo(i) == 0) || (maximo(i) == 1)
	op2(i).V_d = wrev(op2(i).V_d);
	op2(i).I_d = wrev(op2(i).I_d);
end

indice = find(op2(i).V_d>=1.9,1);

%indice_out = [(indice - 1), indice, (indice +1)];
%indice_out = [indice, (indice +1)];
indice_out = [(indice - 1), indice];

	a = op2(i).I_d(indice_out(end)) - op2(i).I_d(indice_out(1)) ;
	b =  op2(i).V_d(indice_out(end)) - op2(i).V_d(indice_out(1));

	r_out = b/a;
end

if teste == 5 %fit de 1.5V a 2V
indice_out = find(op2(i).V_d>1.5 & op2(i).V_d<2);
%indice_out = find(op2(i).V_d>=1.8 & op2(i).V_d<=2);


p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);

res(1).saida = 1/p_out(1);

r_out = res(1).saida;
end

end
% %%%%%%%%%%%%%%%%%% R_out diferenca finita

%se o op estiver ao contrário (começando pelo maior valor), o inverte
maximo(i) = find(op2(i).V_d>=1.0,1);
if (maximo(i) == 0) || (maximo(i) == 1)
	op2(i).V_d = wrev(op2(i).V_d);
	op2(i).I_d = wrev(op2(i).I_d);
end

%if aux == 3 %só para 2G
%indice = find(op2(i).V_d>=1,1);
%
%%indice_out = [(indice - 1), indice, (indice +1)];
%%indice_out = [(indice - 1), indice];
%indice_out = [indice, (indice +1)];
%
%
%r_out2 = op2(i).V_d(indice)/ op2(i).I_d(indice)
%end






