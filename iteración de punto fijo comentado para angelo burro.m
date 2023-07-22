Q=3; %- Inicializa la variable Q en 3. Esto es solo para asegurarse de que el bucle while se ejecute al menos una vez.
while Q~=0 % - Inicia un bucle while que se repetirá mientras Q sea diferente de cero. Dentro de este bucle, el programa solicita al usuario ingresar las ecuaciones F(x,y) y G(x,y), y resuelve estas ecuaciones para x e y utilizando la función solve.
    fprintf('SISTEMA DE ECUACIONES CON DOS INCOGNITAS \n'); %- Imprime un mensaje en la pantalla para indicar que se está resolviendo un sistema de ecuaciones de dos incógnitas.
    syms x y %- Declara x e y como variables simbólicas. Esto es necesario para utilizar la función solve.
    f=input('Ingrese F(x,y)=0 \n'); %- Solicita al usuario que ingrese la ecuación F(x,y) y almacena esta ecuación en la variable f.
    g=input('Ingrese G(x,y)=0 \n'); %- Solicita al usuario que ingrese la ecuación G(x,y) y almacena esta ecuación en la variable g.
    fx = solve(f,x); %- Resuelve la ecuación f para x utilizando la función solve y almacena la solución en la variable fx.
    gy = solve(g,y); %- Resuelve la ecuación g para y utilizando la función solve y almacena la solución en la variable gy.
    figure; %- Crea una nueva figura.
    ezplot(f); %- Dibuja la gráfica de la ecuación f utilizando la función ezplot.
    hold on; %- Mantiene la figura actual activa para que la siguiente gráfica se dibuje en la misma figura.
    ezplot(g); %- Dibuja la gráfica de la ecuación g utilizando la función ezplot.
    line([-10 10], [0 0], 'Color', 'k'); %- Dibuja una línea horizontal en el eje x.
    line([0 0], [-10 10], 'Color', 'k'); %- Dibuja una línea vertical en el eje y.
    xlabel('x'); %- Etiqueta el eje x.
    ylabel('y'); %- Etiqueta el eje y.
    hold off; %- Desactiva el modo de retención de la figura.
    fprintf('Ingrese una aproximacion inicial a la Raiz P(x,y)\n'); %- Solicita al usuario que ingrese una aproximación inicial de las soluciones.
    a = input('Ingrese el valor de x: '); %- Solicita al usuario que ingrese un valor para x y almacena el valor en la funcion
    b = input('Ingrese el valor de y: '); %- Solicita al usuario que ingrese un valor para y, y almacena el valor en la funcion
    iter_max = 10000; %el numero de iteraciones 
    iter = 0; %el inicio de las iteraciones de 0 a ...
    while iter < iter_max % un bucle que se repite hasta encontrar la solución dentro de maximo de las iteraciones
        a1 = subs(fx, [x, y], [a, b]); %formula del pdf
        b1 = subs(gy, [x, y], [a, b]); %formula del pdf
        if abs(a1 - a) < 1e-6 && abs(b1 - b) < 1e-6 %si el valor absoluto de la ecuacion supera a la tolerancia  
            break;
        end
        a = a1; %si se supera, (a) toma los valores de a1 y
        b = b1; %si se supera, (b) toma los valores de b1
        iter = iter + 1; %número de iteraciones que va de 1 en 1
    end
    fprintf('La Solución es \n x= %5.6f \n y= %5.6f\n',a, b); %imprimir las respuestas
    Q=input('Para salir pulse cero. Para continuar pulse diferente de cero. \n'); %en este input colocaremos si queremos continuar o no con la operación
    clc; %es para limpiar el programa, sin este codigo al final te ejecutará el programa nuevamente sin borrar lo anterior
end