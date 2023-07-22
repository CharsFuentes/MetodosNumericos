J=1;
while J==1
    fprintf('BIENVENIDOS A LA CALCULADORA BASICA \n');
    a=input('Ingrese el primer valor a operar \n');
    b=input('Ingrese el segundo valor a operar \n');
    fprintf('Ingrese la operación que desea realizar \n');
    op=input('1.Suma, 2.Resta, 3.Multiplicación, 4.Division \n');
    switch op
        case 1
            c=a+b;
            fprintf('La respuesta es: %1f \n',c);
        case 2
            d=a-b;
            fprintf('La respuesta es: %1f \n',d);
        case 3
            e=a*b;
            fprintf('La respuesta es: %1f \n',e);
        case 4
            r=a/b;
            fprintf('La respuesta es: %1f \n',r);
    end
    J=input('Para continuar pulse 1 \npara salir pulse diferente de uno \n');
    clc;
end