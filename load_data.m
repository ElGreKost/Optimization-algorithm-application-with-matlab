function [NEL,NN,XY,dens,E,Elem,BC,F] = load_data
NEL = 10;               % # Δοκών
NN  = 7;                % # Κόμβων

XY   = zeros(NN,2);     % Συντεταγμένες Κόμβων
XY=load('my_NLIST.txt');
Elem = zeros(NEL,2);    % Συνδέσεις Δοκών
Elem=load('my_ELIST.txt');




dens = 7.850E-9;         % πυκνώτητα αλουμινίου t/mm3
E = 210000;              % Ελαστικότητα αλουμινίου MPa


% Οριακές συνθήκες  
% BC(n,i)=0 -> μη περιορισμένη
% BC(n,1)=1 -> η μετατόπιση ως προς x είναι περιορισμένη
% BC(n,2)=1 ->      -//-            y      -//-
BC=zeros(NN,2);         
BC(1,1)=1;
BC(1,2)=1;
BC(2,1)=1;
BC(2,2)=1;

% Εξωτερικές δυνάμεις σε Νeuton, x,y όπως παραπάνω
F = zeros(NN,2);    
phi = asin(1/3); % Γωνία FED
fx = @(x) x * cos(pi/2 - phi);
fy = @(x) x * sin(pi/2 - phi);


F(3,1) = -fx(4000);
F(3,2) = -12000 - fy(4000);
F(4,1) = -fx(8000);
F(4,2) = -24000 - fy(8000);
F(5,1) = F(3,1);
F(5,2) = F(3,2);
