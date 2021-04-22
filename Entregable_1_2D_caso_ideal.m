% Entregable 1 caso ideal en 2D

% Propiedades de la lamina (+)
ALp = 0.005; % ancho en centimetros
PxLP = -0.05 - ALp; % posicion en x
PyLP = -0.1 ; % posicion en y
lLP = 0.2; % largo en centimetros

% Propiedades de la lamina (-)
ALn = 0.005;% mismo ancho
PxLN = 0.05 + ALn; % posicion en x
PyLN = -0.1; % posicion en y 
lLN = 0.2; % largo 

xl = linspace(-0.05,0.05,10);  % Valores de x que vamos a evaluar
yl = linspace(-0.1,0.1,10);  % Valores de y que vamos a evaluar
[x, y] = meshgrid(xl, yl);   % Retícula de puntos

%PROPIEDADES DEL CAMPO ELÉCTRICO
Q = 1e-6; %Carga (+)
eps0 = 8.854e-12; %Constante dieléctrica
A = ALp * lLP; % Area de la lamina positiva
E = Q / (eps0 * A); %campo electrico caso ideal


% Propiedades para los vectores
Px = x;
Py = y;

Ex = E * ones(size(x));
%Ex(x < -movX | x > movX) = 0;
Ey = zeros(size(y));


figure();
hold on 

% Grafica función vectorial
h = quiver(x, y, Ex, Ey);

LP = rectangle('Position',[PxLP,PyLP,ALp,lLP],'FaceColor','r','EdgeColor','r'); 
LN = rectangle('Position',[PxLN,PyLN,ALn,lLN],'FaceColor','b','EdgeColor','b'); 
axis equal
xlabel('x')
ylabel('y')

     %       x        y
axis([-0.12 0.12 -0.12 0.12]); %ampliar la vista

hold off 