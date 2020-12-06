//Fourier Series Coefficients
//The following function returns the fourier coefficients,'a0', 'An' & 'Bn'
//
//User needs to provide the following arguments:
//
//l=periodicity of the function f which is to be approximated by Fourier Series
//n=no. of Fourier Coefficients you want to calculate
//f=function which is to be approximated by Fourier Series
//
//*Some necessary guidelines for defining f:
//*The program integrates the function f from -l to l so make sure you define the function f correctly in the interval -l to l.
//
//for more information on Fourier Series visit: https://en.wikipedia.org/wiki/Fourier_series
//
//Written by: Manas Sharma(manassharma07@live.com)
//For more useful toolboxes and tutorials on Scilab visit: https://www.bragitoff.com/category/compu-geek/scilab/
funcprot(0);
function [a0, A, B]=fourier(l, n, f)
    a0=1/l*intg(-l,l,f,1e-2);
    for i=1:n
        function b=f1(x, f)
            b=f(x)*cos(i*%pi*x/l);
        endfunction
        function c=f2(x, f)
            c=f(x)*sin(i*%pi*x/l);
        endfunction
        A(i)=1/l*intg(-l,l,f1,1e-2);
        B(i)=1/l*intg(-l,l,f2,1e-2);
    end
endfunction
