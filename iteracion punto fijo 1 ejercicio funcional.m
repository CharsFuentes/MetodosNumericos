Q=3;
while Q~=0
    fprintf('SISTEMA DE ECUACIIONES CON DOS INCOGNITAS: METODO ITERACIÓN DE PUNTO FIJO \n');
    syms  x y
    f=input('ingrese F(x,y)=0 \n');
    g=input('ingrese G(x,y)=0 \n');
    figure
    hold on
    ezplot(f)
    ezplot(g)
    line([-10,10],[0,0],'color','k');
    line([0,0],[-10,10],'color','k');
    xlabel('x');
    ylabel('y');
    hold off
    fx = solve(f,x);
    gy = solve(g,y);
    Fx=diff(fx)
    Gy=diff(gy)
    fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
    a = input('Ingrese el valor de x \n');
    b = input('Ingrese el valor de y \n');
    iter_max = 10000;
    iter = 0;
    while iter < iter_max
        a1 = subs(Fx, [x, y], [a, b]);
        b1 = subs(Gy, [x, y], [a, b]);
        if abs(a1 - a) > 10^(-6) && abs(b1 - b) > 10^(-6)
            break;
        end
        a = a1;
        b = b1;
    end
    fprintf('La Solución es \n x= %5.6f \n y= %5.6f\n',a, b);
    Q=input('Para salir pulse cero. Para continuar pulse diferente de cero. \n');
    clc;
end