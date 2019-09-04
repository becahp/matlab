function [V_g, V_s, V_d]=minhafuncao2(fl)

%'version=COOS_v030h V_s=  0.000000000E+000 V_d= -1.000000000E+000 V_g=  1.034482759E+000 /'

str = 'aaaaaaaaaaaaaaaaaa';
n = 16; %tamanho do número em chars

a = 5; %%espaço para "V_g= "
%version = 18; %tamanho para ler a versão

for k = 1:(length(fl)-2)
	%if fl(k:k+3) == 'V_gs'
    %    continue
    %end
    %if fl(k:k+3) == 'V_gd'
    %  continue  
    %end    
    if fl(k:k+2) == 'V_g'
		
		%pega a posição atual de fl (que é k), adiciona o espaço para ler "V_g= ", e a partir dela pega mais n (para ler o numero) 
		str = fl(k+a : k+a+n);
		
		%for i=1:n
		%	str(i) = fl((k+a)+i);
		%end
		V_g = sscanf(str,'%f');
	end
	
	if fl(k:k+2) == 'V_s'
		str = fl(k+a : k+a+n);
		V_s = sscanf(str,'%f');
	end
	
	if fl(k:k+2) == 'V_d'
		str = fl(k+a : k+a+n);
		V_d = sscanf(str,'%f');
	end
end