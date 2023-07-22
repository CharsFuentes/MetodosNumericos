Q=1;
while Q==1
    fprintf('Método Busca \n');
    f=input('Ingrese la ecuación \n');
    f=inline(f);
    fprintf('Ingrese el dominio \n');
    x1=input('Ingrese el extremo izquierdo del dominio \n');
    x2=input('Ingrese el extremo derecho del dominio \n');
    if x1==x2
        fprintf('Error, ingrese un intervalo \n');
    else
        if x1>x2
            x3=x1;x1=x2;x2=x3;
        end
        x=linspace(x1,x2,2000);y=f(x);plot(x,y,'b')
        hold on
        a=linspace(x1,x2,2);b=0.*a;plot(a,b,'k')
        hold off
        fprintf('De la gráfica entre qué valores busca la solución \n');
        m=input('Ingrese el extremo izquierdo \n');
        n=input('Ingrese el extremo derecho \n');
        h=1;A=m;B=A+h;
        while f(A)*f(B)>0 & B<=n
            A=B;B=A+h;
        end
        if f(A)*f(B)<0
            fprintf('Existe solución entre %5.2f y %5.2f \n',A,B);
        else
            if f(A)*f(B)==0
                fprintf('La solución es %5.2f \n',B);
            else
                fprintf('No existe solución entre %5.2f y %5.2f \n',m,n);
            end
        end
    end
    Q=input('Para continuar pulse 1. \n Para salir pulse diferente de 1. \n');
    clc;
end