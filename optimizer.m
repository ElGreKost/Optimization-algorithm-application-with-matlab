clear all; clc 

% Nel = #Ράβδων.
[Nel,NN,XY,dens,E,Elem,BC,F] = load_data(); % Μόνο η πρώτη έξοδος μας ενδιαφέρει.
x0 = zeros(Nel, 1);

% linear coefficients.
A = []; b = []; Aeq = []; beq = []; ub = [];

%lower bound
lb = ones(1, Nel);

% routine parameters of fmincon are set through options
options = optimset('Display', 'iter', 'MaxIter', 1000, 'MaxFunEvals', 900000, "TolCon", 1e-6, 'TolFun', 1e-6, 'Diagnostics', 'off');
[x, fval, exitflag, output] = fmincon(@obj_fun, x0, A, b, Aeq, beq, lb, ub, @constrain_fun, options);
x