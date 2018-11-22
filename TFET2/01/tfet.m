addpath ~/UnB/Artigo/Simulacoes/TFET2/01_miniFET/03_tfet_as

op2 = []
op2 =  rdcelpa('tFET_mini3_v7_dd_iv.elpa','*',[],op2);


op2(1).I_d = abs(op2(1).I_d);

figure
h(1) = semilogy(op2(1).V_g,op2(1).I_d );
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')



op2 = []
addpath ~/UnB/Artigo/Simulacoes/TFET2/01_miniFET/04_dv

op2 =  rdcelpa('nFET_mini_v2_dd_iv.elpa','*',[],op2);	%04_dv

op2(1).I_d = abs(op2(1).I_d);

%encontrar vg = 1
find(op2.V_g == 0.5)
op2.I_d(find(op2.V_g == 0.5))


aux = 0.000006303752377
find(op2.I_d == aux)


%figure
%h(1) = semilogy(op2(1).V_g,op2(1).I_d );
%xlabel('V_{gs} (V)')
%ylabel('I_{ds} (A)')

