
% Entregable 1 caso ideal en 3D

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

xl = linspace(-1.5*movX,1.5*movX,10);  % Valores de x que vamos a evaluar
yl = linspace(-ly,ly,10);  % Valores de y que vamos a evaluar
zl = linspace(-lz,lz,10); % Valores de z que vamos a evaluar

[xGrid, yGrid, zGrid]= meshgrid(xl,yl,zl);

%PROPIEDADES DEL CAMPO ELÉCTRICO
Q = 1e-6; %Carga (+)
eps0 = 8.854e-12; %Constante dieléctrica
A = 4*(ly * lz); %Área de la lámina positiva
E = Q / (eps0 * A); %campo electrico caso ideal

%PROPIEDADES PARA LOS VECTORES
Px = xGrid;
Py = yGrid;
Pz = zGrid;

Ex = E * ones(size(xGrid));
Ex(xGrid < -movX | xGrid > movX) = 0;
Ey = zeros(size(yGrid));
Ez = zeros(size(zGrid)); 

figure();
hold on

patch('Faces',caras,'Vertices',vertices,'FaceColor','r');
patch('Faces',caras,'Vertices',vertices2,'FaceColor','b');
axis equal
xlabel('x')
ylabel('y')
zlabel('z')

h = quiver3(xGrid, yGrid, zGrid,Ex,Ey,Ez);

axis([-1.5*movX 1.5*movX -ly ly -lz lz]);
view(30,30); %Establecer la vista de el espacio 3D
grid();

hold off