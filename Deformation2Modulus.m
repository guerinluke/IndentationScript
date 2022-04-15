close all
clear

% Vertical deformation of gel (m)
d = 0.001;
% Radius of indenter (m)
R = 0.001;
% Density of indenter material
p = 1;
% Force applied by indenter (N)
w = ((4*pi*R*R*R)/3)*p*9.81;
% a/R ratio of gel
a = 5;
% gel thickness (m)
h = 0.001;

X = d/R;
% Calculating polynomial parameters
B0 = 0.05668*a + 0.1522 - X;
B1 = (19653 + 8143*a + 845*a.*a);
B2 = -(8500165149+ 3261047248*a - 310079383*a.*a);

% Determining the Roots
Y = roots([B2 B1 B0]);
% Modulus in Pa
E = (6*w)/(Y*h*R)

% Plotting relevant a/R curve
Y1 = [0:0.000001:0.0004];
X1 = 0.05668*a + 0.1522+(19653 + 8143*a + 845*a.*a)*Y1 ...
    - (8500165149+ 3261047248*a - 310079383*a.*a)*Y1.*Y1;

plot(Y1,X1,'DisplayName', strcat('a/R = ', num2str(a))); hold on;
axis([0 0.00004 0 5]);
ylabel('δ/R'); xlabel('6w/EhR');
title('X (δ/R) and Y (6w/EhR)');
legend('show')

