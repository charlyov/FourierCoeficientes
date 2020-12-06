//COEFICIENTES DE FOURIER POR INTEGRACIÓN NUMÉRICA
//La siguiente función devuelve los coeficientes de Fourier,'a0', 'Ak' & 'Bk' y a0_num, ak_num, bk_num
//El usuario debe ingresar los siguientes argumentos:

//L= Periodicidad de la función f que será aproximada mediante series de Fourier.
//n= número de Coeficientes de Fourier que se quieren calcular
//f= función a ser aproximada mediante series de Fourier
//M = número de dt en los que dividir el intervalo

//Consultado en:  https://www.bragitoff.com/2016/03/calculating-fourier-series-and-plotting-it-scilab/
//PARA FIJAR NUESTRA FUNCION INTRODUCIMOS EN CONSOLA: deff("a=f(x)","a= (x^2)*cos(48*x)")

funcprot(0);
//function [a0,A,B,a0_num,A_num,B_num]=T1B_fourierplot(L,k,f,M) //cuando esté lista la función de integración numérica
function [a0,A,B]=T1B_fourierplot(L,k,f) 
    clf(); //Limpia los gráficos https ://help.scilab.org/docs/5.3.3/en_US/clf.html
    for i=1:k
        function ak=f1(x,f)
            ak=f(x)*cos(i*%pi*x/L);
        endfunction
        function bk=f2(x,f)
            bk=f(x)*sin(i*%pi*x/L);
        endfunction
        a0=1/L*intg(-L,L,f,.000000001); //CAMBIAR POR INTEGRACION NUMERICA
        A(i)=1/L*intg(-L,L,f1,.000000001);//CAMBIAR POR INTEGRACION NUMERICA
        B(i)=1/L*intg(-L,L,f2,.000000001);//CAMBIAR POR INTEGRACION NUMERICA
        
        //HACER AQUI LA FUNCIÓN DE INTEGRACIÓN NUMÉRICA PARA a0_num,A_num,B_num
        
//function [a0_num, A_num, B_num]=trapecios(L, k, f, M)
//    Tmin = -L; //límite inferior del intervalo de trabajo, 
//    Tmax = L;// Límite superior
//    dt = (Tmax-Tmin)/(M-1); //diferencial de t ¿PORQUE -1?
//    t=zeros(M,1);//  vector para los M valores en los que evaluar t
//    t2=zeros(M,1);//
//    g = zeros (M,1);//vector para los M valores izq que tendrá f(t)
//    h = zeros(M,1);//vector para los M valores der que tendrá f(t)
//    for m=1:M
//        t(m)=Tmin+(m-1)*dt; // vector con límites inferiores de dt
//        t2(m)=Tmin+(m)*dt; // vector con límites inferiores de dt
//        g(m)= (t(m)^2)*cos(48*t(m)); // función evaluada en límite izq del intervalo dt
//        h(m)= (t2(m)^2)*cos(48*t2(m));//función evaluada en límite der del intervalo dt
//    end
//        a0_num = 
//        A_num =
//        B_num =
////---- Integración Trapezoidal para a0
////https: //www.computerscienceai.com/2019/04/scilab-program-trapezoidal-rule.html 
//
//    sum=0;
//    for i=1:M
//    	a0_num = (dt/2)*(g(i)+ h(i))+sum);
//    end
//        disp(a0_num)
//    
//    //----suma de riemann:
//    
//    a0_num = (1/L)*(sum(f(m))*dt); 
//    disp(a0_num)
//
//endfunction        
        
     
        
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


