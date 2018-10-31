function [op2] = restringeOp(op2)

for i=1:length(op2)
	indice(i) = find(op2(i).V_g>=1.5,1);

	if indice(i) == 1
		op2(i).V_g = wrev(op2(i).V_g);
		op2(i).I_s = wrev(op2(i).I_s);
		
		indice(i) = find(op2(i).V_g>=1.5,1);
	end

	op2(i).V_g = op2(i).V_g(1:indice(i));
	op2(i).I_s = op2(i).I_s(1:indice(i));
end