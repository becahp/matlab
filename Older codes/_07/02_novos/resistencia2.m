clear;

addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\1g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\fbg
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\2g
addpath C:\Users\becahp\UnB\Artigo\Simulacoes\_06\01_saida16\3g

%%%- calcular resistência a partir das curvas de saída para as quatro arquiteturas
%%%	- polyfit, inverso do slope é a resistencia
%%%	- calcular entre 0.1, 0.2, 0.3
%%%	- curva de Vgs = 2V, 1.2V


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1G
op2 = [];
op2 =  rdcelpa('1g/n_1g_vgs_2_dd_iv.elpa','*',[],op2);


indice = struct('z',{},'b',{},'c',{})
indice(1).a = find(op2.D>0.0 & op2.D<0.2);
indice(1).b = find(op2.D>0.2 & op2.D<0.4);
indice(1).c = find(op2.D>0.4 & op2.D<0.6);

indice(1,:) = find(op2.D>0.0 & op2.D<0.2);
indice(2,:) = find(op2.D>0.2 & op2.D<0.4);
indice(3,:) = find(op2.D>0.4 & op2.D<0.6);

%p(1) slope; p(2) constant
%p = polyfit(op2.D(indice),op2.Isum(indice), 1);
%res(1) = 1/p(1);

for i=1:3
p = polyfit(op2.D(indice(i)),op2.Isum(indice(i)), 1);
end

fit = polyval(p, op2.D(indice));
x = op2.D(indice)
y = op2.Isum(indice)

figure
h(1) = plot(op2(1).D,op2(1).Isum ); hold on
plot(x,y, 'r');
x = x - 0.05;
%plot(x,fit,'k--');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FBG
op2 = [];
op2 =  rdcelpa('fbg/n_fbg_vgs_2_dd_iv.elpa','*',[],op2);

%op2.D>0.2 & op2.D<0.4
indice = find(op2.D>0.4 & op2.D<0.6);

%p(1) slope; p(2) constant
p = polyfit(op2.D(indice),op2.Isum(indice), 1);

res(2) = 1/p(1);

fit = polyval(p, op2.D(indice));
x = op2.D(indice)
y = op2.Isum(indice)

%figure
h(2) = plot(op2(1).D,op2(1).Isum ); hold on
plot(x,y, 'r');
x = x - 0.05;
%plot(x,fit,'k--');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2G
op2 = [];
op2 =  rdcelpa('2g/n_2g_2V_vgs_2_dd_iv.elpa','*',[],op2);

%op2.D>0.1 & op2.D<0.3
indice = find(op2.D>0.1 & op2.D<0.3);

%p(1) slope; p(2) constant
p = polyfit(op2.D(indice),op2.Isum(indice), 1);

res(3) = 1/p(1);

fit = polyval(p, op2.D(indice));
x = op2.D(indice)
y = op2.Isum(indice)

%figure
h(3) = plot(op2(1).D,op2(1).Isum ); hold on
plot(x,y, 'r');
x = x - 0.05;
%plot(x,fit,'k--');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3G
op2 = [];
op2 =  rdcelpa('3g/n_3g_vds_vg_12_dd_iv.elpa','*',[],op2);

indice = find(op2.D>0.1 & op2.D<0.3);

%p(1) slope; p(2) constant
p = polyfit(op2.D(indice),op2.Isum(indice), 1);

res(4) = 1/p(1);

fit = polyval(p, op2.D(indice));
x = op2.D(indice)
y = op2.Isum(indice)

%figure
h(4) = plot(op2(1).D,op2(1).Isum ); hold on
plot(x,y, 'r');
x = x - 0.05;
%plot(x,fit,'k--');


legend([h(1),h(2),h(3),h(4)],{'1G', 'FBG', '2G', '3G'});
%dois = csvread('segundacurva2.csv');
%tres = csvread('terceiro.csv');

%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.Isum, op1.G);

%%
%%%Visualize data stored in a struct 
%%%Data is accessed via names of the struct elements
%%%Simple preprocessing of data can be done

%para op2.D = 0.1, 0.2, 0.3 

%for i =1:4
%%encontrar VD = 0.1, 0.2, 0.3 
%%find(op2(i).D>0.1 & op2(i).D<0.2)
%corrente(i) = op2(i).Isum(find(op2(i).D>0.1 & op2(i).D<0.2))
%end



