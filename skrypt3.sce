clear;
clc;
//clf;

n=3;
a=-0.5;
b=2*%pi;
x0=0;
xw=[0;%pi/4;%pi/2;3*%pi/2];
xb=9*%pi/10;
r=2
function y=f(x);
    y=sin(x);
endfunction;
function y=fp(x);
    y=sin(x);
endfunction;
function y=omega(x,n,xi);
    y=1;
    for i=0:n;
        y=y*(x-xi(i+1));
    end;
endfunction;
