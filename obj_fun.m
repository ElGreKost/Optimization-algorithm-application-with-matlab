function [f]=obj_fun(x)
[~,~,XY,dens,~,Elem] = load_data;

% Calculate the differences in XY coordinates for each element
dXY = XY(Elem(:,2), :) - XY(Elem(:,1), :);

% Calculate the lengths L of each element using Euclidean distance
L = sqrt(sum(dXY.^2, 2));
% Define the objective function f using matrix multiplication
f = sum(dens * L.* x);

