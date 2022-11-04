clear;
clc;

M = [1 2
     1 1];
E = [0 0
     0 0];
b = [4.653
     3.428];
     
function y=wz2(C);
    y=C(1,1)*C(1,2)-C(2,1)*C(2,2);    
endfunction;

function C=msum(A,B);
    C=A+B;
endfunction;         

function Wk = Csk(A,w,k);
    Wk=k;
    Wk(:,k)=w;
endfunction

ME=msum(M,E);
dME=wz2(ME);
if dME<>0 then
    x(1,1) = wz2(Csk(ME,b,1)/dME);
    x(1,2) = wz2(Csk(ME,b,2)/dME);
    disp("x=",x);
else
    disp("Wyznacznik jest zerowy");    
end
