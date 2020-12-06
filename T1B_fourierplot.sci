funcprot(0);
function [a0,A,B]=T1B_fourierplot(L,k,f)
    clf();
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

