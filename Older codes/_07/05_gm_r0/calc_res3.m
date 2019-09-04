function [r_out] = calc_res3(i, op2, aux)

maximo(i) = find(op2(i).V_d>=1.0,1);
if (maximo(i) == 0) || (maximo(i) == 1)
	op2(i).V_d = wrev(op2(i).V_d);
	op2(i).I_d = wrev(op2(i).I_d);
end

% %%%%%%%%%%%%%%%%%% R_out para Vsup
if aux == 4
%indice_out = find(op2(i).V_d>=0.6 & op2(i).V_d<=1.2); %para 3g
indice_out = find(op2(i).V_d>=0.7 & op2(i).V_d<=1.2); %para 3g


%indice_out = find(op2(i).V_d>=0.5 & op2(i).V_d<=0.7); %para 3g
%indice_out = find(op2(i).V_d>=1.0 & op2(i).V_d<=1.2); %para 3g
else
indice_out = find(op2(i).V_d>=1.5 & op2(i).V_d<=2.0);
%indice_out = find(op2(i).V_d>=0.9& op2(i).V_d<=1.9);

%indice_out = find(op2(i).V_d>=0.9 & op2(i).V_d<=1.1);
%indice_out = find(op2(i).V_d>=1.8 & op2(i).V_d<=2);
end

p_out = polyfit(op2(i).V_d(indice_out),op2(i).I_d(indice_out), 1);

r_out = 1/p_out(1);






% segmentos = 3;

% indice = struct('a',{},'b',{},'c',{});
% res = struct('a',{},'b',{},'c',{},'media',{},'saida',{});

% %%%%%%%%%%%%%%%%%% R_on
% indice(1).a = find(op2(i).V_d>0.0 & op2(i).V_d<0.2);
% indice(1).b = find(op2(i).V_d>0.2 & op2(i).V_d<0.4);
% indice(1).c = find(op2(i).V_d>0.4 & op2(i).V_d<0.6);

% %p(i) slope; p(2) constant
% p(1,:) = polyfit(op2(i).V_d(indice(1).a),op2(i).I_d(indice(1).a), 1);
% p(2,:) = polyfit(op2(i).V_d(indice(1).b),op2(i).I_d(indice(1).b), 1);
% p(3,:) = polyfit(op2(i).V_d(indice(1).c),op2(i).I_d(indice(1).c), 1);

% %res(i) = 1/p(i);
% res(1).a = 1/p(1,1);
% res(1).b = 1/p(2,1);
% res(1).c = 1/p(3,1);

% res(1).media = (res(1).a + res(1).b + res(1).c) / segmentos;

% r_on = res(1).media;
% %res(1)