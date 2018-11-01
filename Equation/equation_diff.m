%%First-Order Linear ODE
%syms y(t)
%ode = diff(y,t) == t*y
%ySol(t) = dsolve(ode)


%%Solve Differential Equation with Condition
%cond = y(0) == 2;
%ySol(t) = dsolve(ode,cond)

%Second-Order ODE with Initial Conditions
syms y(x)
Dy = diff(y);

ode = diff(y,x,2) == cos(2*x)-y;
cond1 = y(0) == 1;
cond2 = Dy(0) == 0;

conds = [cond1 cond2];
ySol(x) = dsolve(ode,conds)
%ySol = simplify(ySol)
