Q=1;
while Q==1
    x=sym('x');
    f=input('MÉTODO BUSCA SWITCH CASE \n Ingresa la ecuación \n');
    f1=diff(f);f2=diff(f,2);
    f=inline(f);f1=inline(f1);f2=inline(f2);
    fprintf('¿En qué intervalo quiere graficar \n');
    x1=input('Ingresa el extremo izquierdo \n');
    x2=input('ngrese el extremo derecho \n');
    if x1==x2
        fprintf('ERROR. Los extremos del intervalo deben ser diferentes \n');
    else
        if x1>x2
            x3=x1;x1=x2;x2=x3;
        end
        x=linspace(x1,x2,1000);y=f(x);y1=min(y);y2=max(y);
        a=linspace(x1,x2,2);b=0.*a;d=linspace(y1,y2,2);c=0.*d;
        plot(x,y,a,b,c,d,'b','linewidth',1.5)
        V=input('Observe la grafica. \n Si la grafica corta al eje X, pulse 1. \n Si la gráfica no corta al eje X, pulse diferente de 1. \n');
        while V==1
            x4=input('Ingrese el extremo izquierdo \n');
            x5=input('Ingrese el extremo derecho \n');
            if x4==x5
                fprintf('ERROR. Los extremos deben ser diferentes. \n');
            else
                if x4>x5
                    x6=x4;x4=x5;x5=x6;
                end
                h=input('Ingrese el incremento \n');
                A=x4;B=A+h;
                while f(A)*f(B)>0 & B<=x5
                    A=B;B=A+h;
                end
                if f(A)*f(B)==0
                   fprintf('La solución es %5.2f \n',B); 
                else
                    if B>x5
                        fprintf('No exist solución entre %5.2f y %5.2f \n',x4,x5);
                    else
                        fprintf('Existe solución entre %5.2f y %5.2f \n',A,B);
                        fprintf('Elige el métod de solución \n');
                        R=input('Punto Fijo Iterativo, pulse 1. \n Método de la Derivada Parcial, pulse 2. \n s, pulse 3. Serie Taylor\n');
                        switch R
                            case 1
                                C=(A+B)/2;
            while abs(f(C))>10^(-12)
                if f(A)*f(C)>0
                    A=C;
                else
                    B=C;
                end
                C=(A+B)/2;
            end
            fprintf('La solución es %5.12f \n',C);
                            case 2
                            case 3
                            otherwise
                                R=7;
                                fprintf('ERROR \n');
                        end
                    end
                end
            end
            V=9;
        end
        
    end
    Q=input('Para contnuar pulse 1. \n Para salir pulse diferente de 1 \n');
    clc;
end