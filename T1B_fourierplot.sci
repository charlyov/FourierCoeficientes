//COEFICIENTES DE FOURIER POR INTEGRACIÓN NUMÉRICA
//La siguiente función devuelve los coeficientes de Fourier,'a0', 'An' & 'Bn'
//El usuario debe ingresar los siguientes argumentos:

//L= Periodicidad de la función f que será aproximada mediante series de Fourier.
//n= número de Coeficientes de Fourier que se quieren calcular
//f= función a ser aproximada mediante series de Fourier
//M = número de dt en los que dividir el intervalo

//Consultado en:  https://www.bragitoff.com/2016/03/calculating-fourier-series-and-plotting-it-scilab/
//PARA FIJAR NUESTRA FUNCION INTRODUCIMOS EN CONSOLA: deff("a=f(x)","a= (x^2)*cos(48*x)")

funcprot(0);
function [a0,A,B]=T1B_fourierplot(L,k,f)
    clf(); //Limpia los gráficos https://help.scilab.org/docs/5.3.3/en_US/clf.html
    a0=1/L*intg(-L,L,f,.000000001); //CAMBIAR POR INTEGRACION NUMERICA
    for i=1:k
        function ak=f1(x,f)
            ak=f(x)*cos(i*%pi*x/L);
        endfunction
        function bk=f2(x,f)
            bk=f(x)*sin(i*%pi*x/L);
        endfunction
        A(i)=1/L*intg(-L,L,f1,.000000001);//CAMBIAR POR INTEGRACION NUMERICA
        B(i)=1/L*intg(-L,L,f2,.000000001);//CAMBIAR POR INTEGRACION NUMERICA
    end
    function series=solution(x)
        series= a0/2;
        for i=1:k
            series=series+A(i)*cos(i*%pi*x/L)+B(i)*sin(i*%pi*x/L);
        end
    endfunction
    x=-L:0.1:L;
    plot(x,solution(x));

endfunction

//a).- Con M = 300 en el ejemplo de g(t), obtenga a0, ak y bk para k = 1; 2... 7.
//b).- Con M = 300 en el ejemplo de g(t), obtenga a0, ak y bk para k = 1; 2...7.
//c).- Con M = 400, grafique el par de funciones{g(t),g7(T)}, el par {g(t),g14(T)},
//el par {g(t),g28(T)},{g(t),g60(T)}
//d).- Con M = 300 en el ejemplo de f(t), del ejercicio 2, grafique el par de funciones el par de funciones{f(t),f7(T)}, el par {f(t),f17(T)}, el par {f(t),f50(T)},{f(t),f100(T)}
//e) con M =200 en el ejemplo de f(t) del ejercicio 2, obtenga los CF. aproximados de a´0,a´k, b´k calculados con integración numérica, los CF exactos a0,ak y bk obtenidos en el mismo ejercicio 2 y los errores absolutos [a0-a´0], [ak-a´k],[bk-b´k].


