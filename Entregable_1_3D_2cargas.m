
%Entregable 1 con 2 cargas en 3D

lz = 0.1; %distancia del centro a la orilla por eje z
lx = 0.005;  %ancho de la placa
ly = 0.1;  %distancia del centro a la orilla por eje y
movX = 0.05; % mitad de la distancia entre placas

%VERTICES Y CARAS DE LÁMINA (+)
           % x       y     z
vertices = [-lx-movX -ly  -lz; %v1
            -lx-movX   ly  -lz; %v2
             -movX   ly  -lz; %v3
             -movX  -ly  -lz; %v4
            -lx-movX  -ly   lz; %v5
            -lx-movX   ly   lz; %v6
             -movX   ly   lz; %v7
             -movX  -ly   lz]; %v8
         
caras = [1 5 8 4; %c1
         1 5 6 2; %c2
         2 3 7 6; %c3
         3 4 8 7; %c4
         5 6 7 8; %c5
         1 2 3 4]; %c6

     
%VERTICES Y CARAS DE LÁMINA (-)
           % x       y     z
vertices2 = [+movX -ly  -lz; %v1
            +movX   ly  -lz; %v2
             lx+movX   ly  -lz; %v3
             lx+movX  -ly  -lz; %v4
            +movX  -ly   lz; %v5
            +movX   ly   lz; %v6
             lx+movX   ly   lz; %v7
             lx+movX  -ly   lz]; %v8

xl = linspace(-2*movX,2*movX,11);  % Valores de x que vamos a evaluar
yl = linspace(-1.5*ly,1.5*ly,11);  % Valores de y que vamos a evaluar
zl = linspace(-1.5*lz,1.5*lz,11); % Valores de z que vamos a evaluar

[xGrid, yGrid, zGrid]= meshgrid(xl,yl,zl);

%PROPIEDADES DEL CAMPO ELÉCTRICO
Q = 1e-6; %Carga (+)
q = Q;
eps0 = 8.854e-12; %Constante dieléctrica
A = 4*(ly * lz); %Área de la lámina positiva

%PROPIEDADES PARA LOS VECTORES
Px = xGrid;
Py = yGrid;
Pz = zGrid;

% Campo Q1
rx = xGrid -(-movX);
ry = yGrid - 0;
rz = zGrid - 0;
r = sqrt(rx.^2 + ry.^2 + rz.^2); % distancia de la particula (magnitud)
Ex1 = ((q / 4*pi*eps0) * rx) ./ r.^3; % E = [(k*q) / sqrt ( (x-qx)^2 + (y-qy)^2 + (z-qz)^2) )^2 ] * r unitario
Ey1 = ((q / 4*pi*eps0) * ry) ./ r.^3;
Ez1 = ((q / 4*pi*eps0) * rz) ./ r.^3;

% Campo Q2
rx = xGrid -(movX);
ry = yGrid - 0;
rz = zGrid - 0;
r = sqrt(rx.^2 + ry.^2 + rz.^2); % distancia de la particula (magnitud)
Ex2 = ((-q / 4*pi*eps0) * rx) ./ r.^3; % E = [(k*q) / sqrt ( (x-qx)^2 + (y-qy)^2 + (z-qz)^2) )^2 ] * r unitario
Ey2 = ((-q / 4*pi*eps0) * ry) ./ r.^3;
Ez2 = ((-q / 4*pi*eps0) * rz) ./ r.^3;

%COMPONENTES DE LOS VECTORES
Ex = Ex1 + Ex2;
Ey = Ey1 + Ey2;
Ez = Ez1 + Ez2;

E = sqrt(Ex.^2 + Ey .^2 + Ez.^2);

figure();
hold on

patch('Faces',caras,'Vertices',vertices,'FaceColor','r','facealpha',0.5);
patch('Faces',caras,'Vertices',vertices2,'FaceColor','b','facealpha',0.5);
scatter3(-movX,0,0,'g','linewidth',5)
scatter3(movX,0,0,'g','linewidth',5);


axis equal
xlabel('x')
ylabel('y')
zlabel('z')

h = quiver3(xGrid, yGrid, zGrid,Ex./E,Ey./E,Ez./E);
%h = quiver3(xGrid, yGrid, zGrid,Ex,Ey,Ez,2,'linewidth',2);

axis([-2*movX 2*movX -1.5*ly 1.5*ly -1.5*lz 1.5*lz]);
view(30,30); %Establecer la vista de el espacio 3D
grid();

hold off