Q=1;
while Q==1
    syms x;
    fprintf('Bisección \n');
    f=input('Ingrese el polinomio \n');
    figure;
    ezplot(f);
    hold on;
    line([-10 10], [0 0], 'Color', 'k'); 
    line([0 0], [-10 10], 'Color', 'k'); 
    xlabel('x');
    hold off;
    f=inline(f);
        fprintf('De la gráfica en que extremos corta para encontrar la solución del polinimio \n');
        m=input('Ingrese el extremo izquierdo \n');
        n=input('Ingrese el extremo derecho \n');
         if m==n
        fprintf('Los extremos no deben ser iguales \n');
         else
             if m>n
                 o=m;m=n;n=o;
             end
         end
        h=1;A=m;B=A+h;
        while f(A)*f(B)>0 & B<=n 
            A=B;B=A+h;
        end
        if f(A)*f(B)<0
            fprintf('La solución si se encuentra entre %5.2f y %5.2f \n',A,B);
            C=(A+B)/2;
            while abs(f(C))>10^(-12)
                if f(A)*f(C)>0
                    A=C;
                else
                    B=C;
                end
                C=(A+B)/2;
            end
            fprintf('La solución del polinomio es %5.12f \n',C);
        else
            if f(A)*f(B)==0
                fprintf('La solución del polinomio es %5.2f \n',B);
            else
                fprintf('No existe solución entre %5.2f y %5.2f \n',m,n);
            end
        end
        Q=input('Para volver a usar el programa pulse 1. \nPara salir pulse diferente de 1. \n');
    clc;
end