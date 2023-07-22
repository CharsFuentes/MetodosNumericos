Q=3;
while Q~=0
    fprintf('SISTEMA DE ECUACIIONES CON DOS INCOGNITAS: metodo derivada parcial \n');
    syms  x y
    f=input('ingrese F(x,y)=0 \n');
    g=input('ingrese G(x,y)=0 \n');
    fx=diff(f,x); fy=diff(f,y);gx=diff(g,x);gy=diff(g,y);
    fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
    a=input('ingrese el valor de "x" \n');
    b=input('ingrese el valor de "y" \n');
    iter = 0;
    max_iter=100;
    Fx = subs(fx, {x,y}, {a,b});
    Gx = subs(gx, {x,y}, {a,b});
    while iter<max_iter
        a1 = a -(subs(f, {x,y}, {a,b})/Fx);
        b1 = b -(subs(g, {x,y}, {a,b})/Gx);
        if abs(subs(f,{x,y},{a,b}))<10^(-6) & abs(subs(g,{x,y},{a,b}))<10^(-6)
            a1 = a -(subs(f, {x,y}, {a,b})/Fx);
            b1 = b -(subs(g, {x,y}, {a,b})/Gx);
            a = a1;
            b = b1;
            break;
        end
        if iter >= max_iter
            fprintf('No se alcanzó la convergencia después del número máximo de iteraciones permitidas.');
            break;
        end
        a = a1;
        b = b1;
    end
    fprintf('El valor de x es %5.6f y el valor de y es %5.6f\n', a, b);
    Q=input('Para continuar pulse 1. \nPara salir pulse diferente de 1 \n');
    clc;
end