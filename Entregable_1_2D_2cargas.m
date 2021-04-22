% Entregable 1 con 2 cargas en 2D

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
q = Q;
eps0 = 8.854e-12; %Constante dieléctrica
A = ALp * lLP; % Area de la lamina positiva

% Propiedades para los vectores
Px = x;
Py = y;

% Campo Q1
rx = x -(-0.05);
ry = y - 0;
r = sqrt(rx.^2 + ry.^2); % distancia de la particula (magnitud)
Ex1 = ((q / 4*pi*eps0) * rx) ./ r.^3;
Ey1 = ((q / 4*pi*eps0) * ry) ./ r.^3;


% Campo Q2
rx = x -(0.05);
ry = y - 0;
r = sqrt(rx.^2 + ry.^2); % distancia de la particula (magnitud)
Ex2 = ((-q / 4*pi*eps0) * rx) ./ r.^3;
Ey2 = ((-q / 4*pi*eps0) * ry) ./ r.^3;


%COMPONENTES DE LOS VECTORES
Ex = Ex1 + Ex2;
Ey = Ey1 + Ey2;

E = sqrt(Ex.^2 + Ey .^2);


figure();
hold on 

% Grafica función vectorial
h = quiver(x, y, Ex./E, Ey./E);

LP = rectangle('Position',[PxLP,PyLP,ALp,lLP],'FaceColor','r','EdgeColor','r'); 
LN = rectangle('Position',[PxLN,PyLN,ALn,lLN],'FaceColor','b','EdgeColor','b');
scatter(-0.05,0,'g','linewidth',5)
scatter(0.05,0,'g','linewidth',5);

axis equal
xlabel('x')
ylabel('y')

     %       x        y
axis([-0.12 0.12 -0.12 0.12]); %ampliar la vista

hold off 