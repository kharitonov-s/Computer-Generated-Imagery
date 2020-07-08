syms x;
a = 1.1;
b = 2.3;
n = 10;
eps = 10.^(-6);
alpha = 2/5;
beta = 0;
integ = [0 0];
koord = [a];
NewkA=NaN(3, 1);
p = (x-a).^(-1.*alpha)*(b-x).^(-1.*(1.*beta));

for z = 1:1:2
for k = 1:1:n
    el = a + k.*(b-a)./n; %длина составного отрезка
    koord = [koord el]
end
for i = 1:1:3
   
   %m = zeros(1, n)';
    m = [0; 0; 0];
    Vx = [koord(i) (koord(i)+koord(i+1))./2 koord(i+1)];
    for k = 0:1:2
        m(k+1) = int(p.*x.^k, x, koord(i), koord(i+1));
    end
    %вычисление моментов 
k=100000;
h=(koord(i+1)-koord(i))/k;
x=koord(i):h:koord(i+1);
moments = zeros(1, 3)';
for q=0:1:3-1
    s=0;
    
    for i=2:k 
        s=s+((x(i)-a).^(-1.*alpha).*(b-x(i)).^(-1.*(1.*beta)))*x(i)^q;
    end
    moments(q+1)=s*h;
end
disp(m)
disp(moments)
    NewX = [1 1 1; Vx(1).^1 Vx(2).^1 Vx(3).^1; Vx(1).^2 Vx(2).^2 Vx(3).^2];
    kA = rref([NewX, m])
    ikfkA=Gauss(NewX,m)
    kA1 = [kA(1,4); kA(2,4); kA(3,4)]
    integ(z) = integ(z) + kA(1,4).*untitled(Vx(1)) + kA(2,4).*untitled(Vx(2)) + kA(3,4).*untitled(Vx(3));
    if i == 1
    NewkA = [kA1]; else
    NewkA = [NewkA kA1];end
end
disp(integ);
n = n*2;
koord = [a];
end
disp(integ(1)-integ(2));

disp(integ);










