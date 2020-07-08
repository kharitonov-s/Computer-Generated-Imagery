% 0.5.*cos(3.*x).*exp(2.*x/5)+4.*sin(3.5.*x).*exp(-3.*x)+3.*x
syms x;
a = 1.1;
b = 2.3;
alpha = 2/5;
beta = 0;

p = (x-a).^(-1.*alpha)*(b-x).^(-1.*(1.*beta))

Vx = [a; (a+b)./2; b];
m = [0; 0; 0];
for k = 0:1:2
    m(k+1) = int(p.*x^k, x, a, b)
end
NewX = [1 1 1; Vx(1).^1 Vx(2).^1 Vx(3).^1; Vx(1).^2 Vx(2).^2 Vx(3).^2]
kA = rref([NewX, m])
disp(kA);
kA=[kA(1,4); kA(2,4); kA(3,4)]
summ=0;
summkA=0;
for l=1:1:3
   %(0.5.*cos(3.*Vx(l)).*exp(2.*Vx(l)/5)+4.*sin(3.5.*Vx(l)).*exp(-3.*Vx(l))+3.*Vx(l));
    summ=summ+kA(l)*(0.5.*cos(3.*NewX(l)).*exp(2.*NewX(l)./5)+4.*sin(3.5.*NewX(l)).*exp(-3.*NewX(l))+3.*NewX(l));
    summkA=summkA+abs(kA(l));
end 
summ




