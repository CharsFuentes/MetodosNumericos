Q=3;
while Q~=0
fprintf('SISTEMA DE ECUACIIONES CON DOS INCOGNITAS: metodo derivada parcial \n');
syms x y
f=input('ingrese F(x,y)=0 \n');
g=input('ingrese G(x,y)=0 \n');
fx=diff(f,x); fy=diff(f,y);gx=diff(g,x);gy=diff(g,y);
fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
a=input('ingrese el valor de "x" \n');
b=input('ingrese el valor de "y" \n');
iter = 0;
max_iter=100;
Fx = subs(fx, {x,y}, {a,b});
Fy = subs(fy, {x,y}, {a,b}); % calcular las derivadas parciales de F en (a,b)
Gx = subs(gx, {x,y}, {a,b});
Gy = subs(gy, {x,y}, {a,b}); % calcular las derivadas parciales de G en (a,b)
while iter<max_iter
J = [Fx Fy; Gx Gy]; % calcular la matriz jacobiana
f_val = subs(f, {x,y}, {a,b}); % calcular F(a,b)
g_val = subs(g, {x,y}, {a,b}); % calcular G(a,b)
xk = [a; b]; % vector de incógnitas
xk1 = xk - J[f_val; g_val]; % calcular la siguiente aproximación
if norm(xk1 - xk) < 10^(-6) % criterio de convergencia
a = xk1(1);
b = xk1(2);
break;
end
if iter >= max_iter
fprintf('No se alcanzó la convergencia después del número máximo de iteraciones permitidas.');
break;
end
a = xk1(1);
b = xk1(2);
Fx = subs(fx, {x,y}, {a,b});
Fy = subs(fy, {x,y}, {a,b}); % actualizar las derivadas parciales de F
Gx = subs(gx, {x,y}, {a,b});
Gy = subs(gy, {x,y}, {a,b}); % actualizar las derivadas parciales de G
iter = iter + 1;
end
fprintf('El valor de x es %5.6f y el valor de y es %5.6f\n', a, b);
Q=input('Para continuar pulse 1. \nPara salir pulse diferente de 1 \n');
clc;
end