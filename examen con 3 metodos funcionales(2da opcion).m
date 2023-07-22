Q=3;
while Q~=0
    fprintf('SISTEMA DE ECUACIIONES CON DOS INCOGNITAS \n');
    syms  x y
    f=input('ingrese F(x,y)=0 \n');
    g=input('ingrese G(x,y)=0 \n');
    fprintf('Elije el método:  1.Derivada Parcial  2.Iteración de punto fijo \n');
    op = input('Ingrese la opción:  \n');
    switch op
        case 1
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
                if abs(a1 - a) < 1e-6 && abs(b1 - b) < 1e-6 %1e-6= 10^(-6)
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
        case 2
            fx=solve(f,x);
            gy=solve(g,y);
            fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
            a = input('Ingrese el valor de x \n');
            b = input('Ingrese el valor de y \n');
            iter_max = 100;
            iter = 0;
            while iter < iter_max
                a1 = subs(fx, [x, y], [a, b]);
                b1 = subs(gy, [x, y], [a, b]);
                if abs(a1 - a) < 1e-6 && abs(b1 - b) < 1e-6
                    break;
                end
                a = a1;
                b = b1;
                iter = iter + 1;
            end
            fprintf('La Solución es \n x= %5.6f \n y= %5.6f\n',a, b);
        otherwise
            fprintf('Opción incorrecta. Vuelve a ingresar los datos. \n');
    end
    Q=input('Para salir pulse cero. Para continuar pulse diferente de cero. \n');
    clc;
end