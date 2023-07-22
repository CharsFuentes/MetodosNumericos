% Define las funciones F(x,y) y G(x,y)
F = @(x,y) x + 1/x^2 - y;
G = @(x,y) x^2/3 + y^2/3 - 4;

% Define las funciones f(x,y) y g(x,y)
f = @(x,y) x = (y ± sqrt(y^2 - 4(y-1))) / 2;
g = @(x,y) x - y^2;

% Define la aproximación inicial (x0, y0)
x0 = 0.5;
y0 = 0.5;

% Define la tolerancia y el número máximo de iteraciones
tol = 1e-6;
max_iter = 100;

% Iteración de punto fijo
for i = 1:max_iter
    % Calcula xn+1 y yn+1
    xn1 = f(x0, y0);
    yn1 = g(x0, y0);
    
    % Verifica la convergencia
    if abs(xn1 - x0) < tol && abs(yn1 - y0) < tol
        fprintf('El método converge a la solución (%f, %f) en %d iteraciones.\n', xn1, yn1, i);
        break;
    end
    
    % Actualiza la aproximación inicial
    x0 = xn1;
    y0 = yn1;
end

% Verifica si el método no converge
if i == max_iter
    fprintf('El método no converge a una solución después de %d iteraciones.\n', max_iter);
end