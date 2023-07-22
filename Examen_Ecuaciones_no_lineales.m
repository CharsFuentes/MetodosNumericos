Q=3;
while Q~=0
    fprintf('SISTEMA DE ECUACIONES CON DOS INCOGNITAS \n');
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
            fprintf('ingrese una aproximación inicial a la Raiz P(x,y)\n');
            a=input('ingrese el valor de "x" \n') ;
            b=input ('ingrese el valor de "y" \n');
            J1=subs(J,{x,y},{a,b});
            while J1==0
                f=input('ingrese F(x,y)=0 \n');
            g=input('ingrese G(x,y)=0 \n');
            fx=diff(f,x); fy=diff(f,y);gx=diff(g,x);gy=diff(g,y);
            J=fx*gy-gx*fy;
            RX=(f*gy-g*fy)/J;RY=(f*gx-g*fx)/J;
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
        case 2
             x0=input('Ingrese el valor inicial de x: \n');
             y0=input('Ingrese el valor inicial de y: \n');
            J=[diff(f,x), diff(f,y); diff(g,x), diff(g,y)];
            F=[f; g];
            X=[x; y];
            for i=1:10
                F0=double(subs(F,X,[x0; y0]));
                J0=double(subs(J,X,[x0; y0]));
                dX=-J0\F0;
                x0=x0+dX(1);
                y0=y0+dX(2);
            end
            fprintf('La solución aproximada es: \n x=%f \n y=%f \n', x0, y0);
        case 3
        otherwise
            fprintf('Opción incorrecta. Vuelve a ingresar los datos. \n');        
    end    
    Q=input('Para salir pulse cero.\n Para continuar pulse diferente cero. \n');
    clc;  
end