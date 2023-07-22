Q=1;
while Q==1
    x=sym('x');
    f=input('Método del incremento: Ingrese la ecuación F(x)=0 \n');
    f1=diff(f);f2=diff(f,2);
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
                while subs(f, {x}, {A})*subs(f, {x}, {B})>0 & B<=x5
                    A=B;B=A+h;
                end
                if subs(f, {x}, {A})*subs(f, {x}, {B})==0
                   fprintf('La solución es %5.2f \n',B); 
                else
                    if B>x5
                        fprintf('No exist solución entre %5.2f y %5.2f \n',x4,x5);
                    else
                    end
                        fprintf('Existe solución entre %5.2f y %5.2f \n',A,B);
                    for n=1:1:12
                        h= h/10^n;
                        while subs(f, {x}, {A})*subs(f, {x}, {B})>0
                            A=B; B=A+h;
                        end
                    end
                end
                C=(A+B)/2;
            end
            fprintf('La solución es %5.12f \n',C);
        Q=input('Para continuar pulse 1. \n Para salir pulse diferente de 1 \n');
    clc;
end