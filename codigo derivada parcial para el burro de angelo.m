Q=3; %Crea una variable Q y le asigna el valor 3.
while Q~=0 %Inicia un bucle while que se repetirá mientras Q sea diferente de cero.
    fprintf('SISTEMA DE ECUACIIONES CON DOS INCOGNITAS \n'); %Muestra en la consola un mensaje que indica que se va a resolver un sistema de ecuaciones con dos incógnitas.
    syms  x y %Declara las variables x e y como símbolos.
    f=input('ingrese F(x,y)=0 \n');
    g=input('ingrese G(x,y)=0 \n'); %Pide al usuario que ingrese las ecuaciones f(x,y)=0 y g(x,y)=0 que conforman el sistema de ecuaciones a resolver.
    figure; %- Crea una nueva figura.
    ezplot(f); %- Dibuja la gráfica de la ecuación f utilizando la función ezplot.
    hold on; %- Mantiene la figura actual activa para que la siguiente gráfica se dibuje en la misma figura.
    ezplot(g); %- Dibuja la gráfica de la ecuación g utilizando la función ezplot.
    line([-10 10], [0 0], 'Color', 'k'); %- Dibuja una línea horizontal en el eje x.
    line([0 0], [-10 10], 'Color', 'k'); %- Dibuja una línea vertical en el eje y.
    xlabel('x'); %- Etiqueta el eje x.
    ylabel('y'); %- Etiqueta el eje y.
    hold off; %- Desactiva el modo de retención de la figura.
    fx=diff(f,x); fy=diff(f,y);gx=diff(g,x);gy=diff(g,y); %Calcula las derivadas parciales de f y g respecto a x e y.
    fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
    a=input('ingrese el valor de "x" \n') ;
    b=input ('ingrese el valor de "y" \n'); %Pide al usuario que ingrese una aproximación inicial para las raíces de las ecuaciones.
    %Este bucle while implementa el método de Derivada parcial para encontrar la solución del sistema de ecuaciones. 
    while true
        %En cada iteración, se actualizan los valores de a y b usando las ecuaciones del método de Derivada parcial, y se verifica si la aproximación actual es suficientemente precisa. Si lo es, se sale del bucle while.
        a1 = a - subs(f,{x,y},{a,b})/subs(fx,{x,y},{a,b}); 
        b1 = b - subs(g,{x,y},{a,b})/subs(gy,{x,y},{a,b});
        if abs(a1 - a) < 10^(-6) && abs(b1 - b) < 10^(-6)
            a = a1;
            b = b1;
            break;
        end
        a = a1;
        b = b1;
    end
    if a > 0 && b > 0
        fprintf('la solucion es \n x= %5.6f  \n y= %5.6f  \n',a,b);%Muestra en la consola la solución del sistema de ecuaciones encontrada si ambas incógnitas son mayores que cero.
    end
    Q=input('Para salir pulse cero. Para continuar pulse diferente de cero. \n'); %Pide al usuario que ingrese un valor para la variable Q que determine si se continúa resolviendo sistemas de ecuaciones o se sale del programa. 
    clc; %La función clc se utiliza para borrar la pantalla antes de la próxima iteración del bucle while.
end