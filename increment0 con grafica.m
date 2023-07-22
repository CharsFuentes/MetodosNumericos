Q=1;
while Q==1
    x=sym('x');
    f=input('Método del incremento: Ingrese la ecuación F(x)=0 \n');
    f1=diff(f);f2=diff(f,2);
    figure;
    ezplot(f);
    hold on;
    line([-10 10], [0 0], 'Color', 'k'); 
    line([0 0], [-10 10], 'Color', 'k'); 
    xlabel('x');
    ylabel('y');
    hold off;
    f=inline(f);f1=inline(f1);f2=inline(f2);
        V=input('Observe la grafica. \n Si la grafica corta al eje X, pulse 1. \n Si la gráfica no corta al eje X, pulse diferente de 1. \n');
        if V==1
            a0=input('Ingrese el extremo izquierdo \n');
            b0=input('Ingrese el extremo derecho \n');
            if a0==b0
                fprintf('ERROR. Los extremos deben ser diferentes. \n');
            else
                if a0>b0
                    c=a0;a0=b0;b0=c;
                end
                h=input('Ingrese el incremento \n');
                A=a0;B=A+h;
                while f(A)*f(B)>0 & B<=b0
                    A=B;B=A+h;
                end
                if f(A)*f(B)==0
                   fprintf('La solución es %5.2f \n',B); 
                else
                    if B>b0
                        fprintf('No exist solución entre %5.2f y %5.2f \n',a0,b0);
                    else
                    end
                        fprintf('Existe solución entre %5.2f y %5.2f \n',A,B);
                end
                C=(A+B)/2;
            end
            fprintf('La solución es %5.12f \n',C);
        end
        Q=input('Para continuar pulse 1. \n Para salir pulse diferente de 1 \n');
    clc;
end