% Definir las funciones f(x,y) y g(x,y)
f = @(x,y) y - 1/x^2;
g = @(x,y) sqrt(3*(4 - x^2/3));

% Aproximación inicial
x0 = 1;
y0 = 2;

% Constante K
dfdx = @(x,y) 2/x^3;
dgdx = @(x,y) -2*x/(3*sqrt(3*(4 - x^2/3)));
K = max(dfdx(x0,y0) + 1, abs(dgdx(x0,y0)));

% Criterio de convergencia
epsilon = 1e-6;

% Número máximo de iteraciones
max_iter = 100;

% Iterar hasta convergencia
[x, y, iter] = fixed_point_iteration(f, g, x0, y0, K, epsilon, max_iter);

% Imprimir resultado
fprintf('Solución: x = %f, y = %f\n', x, y);
fprintf('Iteraciones: %d\n', iter);