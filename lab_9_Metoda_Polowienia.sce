clear;
clc;

a=-4;
b=-2;
r=15;
nmax=30;
h=0.001;
function y=f(x);
    y=(x^2-3)*sin(x);
endfunction

function y=fp(x,h);
    y=(f(x+h)-f(x))/h;
endfunction;
function y=fpp(x,h);
    y=(fp(x+h,h)-fp(x,h))/h;
endfunction;

//sztuczne rozwiązanie początkowe
wi=1;
xr(wi)=a;  //a = rozwiązanie

kw=0;  // kod wyjścia
if f(a)*f(b)<0 then
//    założenia metody połowienia są spełnione
    while ~fp(a,h)*fp(b,h)>0 && fpp(a,h)*fpp(b,h)>0 then
        //metoda połowienia
        if ~(wi<nmax) then
            kw=1;
            break;
        end;
        wi=wi+1;
        xr(wi)=a+b/2;
        if abs(xr(wi)-xr(wi-1))<10^(-r) then
            kw=2;
            break;
        end;
        if f(a)*f(x(wi))<0 then
            b=xr(wi);
        else
            a=xr(wi)
        end;
        
    end;
    //warunkowa realizacja metody reguła falsi
    if kw==0 then
        //metoda regulu falsi
        wi=wi+1;
        if fp(a,h)*fpp(a,h)<0 then
            c=a;
            xr(wi)=b;
        else
            c=b;
            xr(wi)=a;
        end;
        kw=1;
        while wi<nmax then
            wi=wi+1;
            xr(wi)=xr(wi-1)-f(xr(wi-1))*(c-xr(wi-1))/(f(c)-f(xr(wi-1)));
            if abs(xr(wi)-xr(wi-1))<10^(-r) then
                kw=2;
                break;
            end;
        end;
    end;
    
else
//    założenia metody połowienia nie są spełnione- więc nie można 
    kw=3;
    
end;

//metoda kończąca kw
select kw
case 1 then
    disp("Osiągnięto max ilość iteracji nmax= "+string(nmax));
    disp("x("+string(wi)+")="+string(xr(wi)));
    disp("Osiągnięto dokładność rzędu "+string(abs(xr(wi)-xr(wi-1))));
case 2 then
    disp("Osiągnięto żądaną dokładność rzędu "+string(r)+" miejsc po przecinku");
    disp("x("+string(wi)+")="+string(xr));
case 3 then
    disp("Założenia metody nie były spełnione");
end;
    
    

