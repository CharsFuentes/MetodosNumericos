Q=3;
while Q~=0
    fprintf('SISTEMA DE ECUACIIONES CON DOS INCOGNITAS \n');
    syms  x y
    f=input('ingrese F(x,y)=0 \n');
    g=input('ingrese G(x,y)=0 \n');
    fprintf('Elije el método: 1.Serie de Taylor  2.Derivada Parcial  3.Iteración de punto fijo \n');
    op = input('Ingrese la opción:  \n');
    switch op
        case 1            
            fx=diff(f,x); fy=diff(f,y);gx=diff(g,x);gy=diff(g,y);
            J=fx*gy-gx*fy;
            RX=(f*gy-g*fy)/J;RY=(f*gx-g*fx)/J;
            fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
            a=input('ingrese el valor de "x" \n') ;
            b=input ('ingrese el valor de "y" \n');
            J1=subs(J,{x,y},{a,b});
            while J1==0
            fprintf('ingrese otra aproximacion inicial a la Raiz P(x,y)\n');
            a=input('ingrese el valor de "x" \n') ;
            b=input ('ingrese el valor de "y" \n');
            J1=subs(J,{x,y},{a,b});
            end
            a1=a-subs(RX,{x,y},{a,b});b1=b+subs(RY,{x,y},{a,b});
            a=a1; b=b1;
            while abs(subs(f,{x,y},{a,b}))>10^(-6) & abs(subs(g,{x,y},{a,b}))>10^(-6)
               a1=a-subs(RX,{x,y},{a,b});b1=b+subs(RY,{x,y},{a,b});
            a=a1; b=b1; 
            end
            fprintf('la solucion es \n x= %5.6f  \n y=%5.6f  \n',a,b);    
            Q=input('para salir pulse cero \n para continuar pulse diferente cero. \n');
            clc;          
            break;
        case 2
            fx=diff(f,x); fy=diff(f,y);gx=diff(g,x);gy=diff(g,y);
            fprintf('ingrese una aproximacion inicial a la Raiz P(x,y)\n');
            a=input('ingrese el valor de "x" \n') ;
            b=input ('ingrese el valor de "y" \n');
            while true
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
                fprintf('la solucion es \n x= %5.6f  \n y= %5.6f  \n',a,b);
            end
            Q=input('para salir pulse cero \n para continuar pulse diferente cero. \n');
            clc;
            break;
        case 3
            fprintf('Iteración de punto fijo seleccionado.\n');
            fxy = matlabFunction(f);
            gxy = matlabFunction(g);
            x = input('Ingrese el valor inicial de x: ');
            y = input('Ingrese el valor inicial de y: ');
            tol = 1e-6;
            while true
                x1 = x;
                y1 = y;
                x = fxy(x1, y1);
                y = gxy(x1, y1);
                if abs(x - x1) < tol && abs(y - y1) < tol
                    fprintf('La solución es: x = %5.6f, y = %5.6f\n', x, y);
                    break;
                end
            end
            Q=input('Para salir pulse cero. Para continuar pulse diferente de cero. \n');
            clc;
            break;
        otherwise
            fprintf('Opción incorrecta. Vuelve a ingresar los datos. \n');
    end
end