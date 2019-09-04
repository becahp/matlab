op7 = [];

op7 =  rdcelpa('p_dir_vsat_model_var3_dd_iv.elpa','*',[],op7);
op7 =  rdcelpa('p_esq_vsat_model_var3_dd_iv.elpa','*',[],op7);

tres = csvread('terceiro.csv');
%plot(M(:,1),M(:,2))

%plot(primeiro(:,1),primeiro(:,2))
%figure
%plot(segundo(:,1),segundo(:,2))
%plot(op1.Isum, op1.G);


op7(1).Isum = abs(op7(1).Isum);
op7(2).Isum = abs(op7(2).Isum);

figure
h(1) = semilogy(tres(:,1),tres(:,2));
%set(h,'linewidth',2)
axis([-1.5 0.6 0.1E-12 0.0001])
xlabel('V_{gs} (V)')
ylabel('I_{ds} (A)')
hold
h(2) = semilogy(op7(1).G,op7(1).Isum );
h(3) = semilogy(op7(2).G,op7(2).Isum );
hold off;
h(2).Color = 'r';
h(3).Color = 'r';
legend([h(1) h(3)],{'Artigo','Simulado'});  % Only the blue and green lines appear in the legend
legend({'Artigo','Simulado'},'Location','south')