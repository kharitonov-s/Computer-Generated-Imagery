%  y=0.5.*cos(3.*Vx).*exp(2.*Vx/5)+4.*sin(3.5.*Vx).*exp(-3.*Vx)+3.*Vx
%вывод значений квадратурной суммы от н=2 до н=20
hold on;
points=8;
accuracy=zeros(1,points);
for n=2:points;

syms x;
a = 1.1;
b = 2.3;
alpha = 2/5;
beta = 0;

                                         

%весовая функция
p = (x-a).^(-1.*alpha)*(b-x).^(-1.*(1.*beta));

%узлы
Vx = (linspace (a,b,n)).'


%вычисление моментов
moments = zeros(1, n)';
for k = 0:1:n-1
    moments(k+1) = int(p.*(x-a)^k, x, a, b)
end


%вычисление моментов 
% k=10000;
% h=(b-a)/k;
% x=a:h:b;
% moments = zeros(1, n)';
% for q=0:1:n-1
%     s=0;
%     
%     for i=2:k 
%         s=s+((x(i)-a).^(-1.*alpha).*(b-x(i)).^(-1.*(1.*beta))).*x(i)^q;
%     end
%     moments(q+1)=s*h;
% end

%левая часть СЛАУ
NewX=zeros(n);
for i=0:1:n-1
    for j=1:1:n
    NewX(i+1,j)=Vx(j)^i;
    end
end
% disp(NewX);

%решение СЛАУ
kA=Gauss(NewX,moments)

% kA = rref([NewX, moments])

summ=0;
summkA=0;
Vx
NewVx=zeros(1,n)
for l=1:1:n
%     NewX
%     NewX(n,l)
%     NewX(l)
%     Vx
%     Vx.^n
%     Vx(l)^n
%     kA
    kA(l)
%     kA(l)^n
   %NewVx(l) =(0.5.*cos(3.*Vx(l)).*exp(2.*Vx(l)/5)+4.*sin(3.5.*Vx(l)).*exp(-3.*Vx(l))+3.*Vx(l))
    summ=kA(l)*(0.5.*cos(3.*Vx(l)).*exp(2.*Vx(l)./5)+4.*sin(3.5.*Vx(l)).*exp(-3.*Vx(l))+3.*Vx(l));
    summkA=summkA+abs(kA(l));
%     if kA(l)<0
%         n
%     end
    
end 
% summ=NewVx*kA
NewVx
kA
if n==2
accuracy(1)=log10(abs(summ - 8.56553));
end
hold on
subplot(3, 1, 1), plot (n,summkA,'*-g')
hold on
subplot(3, 1, 2), plot (n,summ,'*-b')
%  plot (n,summkA,'*-g')
%  plot (n,summ,'*-b')
% %n=2:0.01:7;

%plot(n,log10(abs(summ-8.6630)),'o-r')
abs(summ - 8.56553);
accuracy(n)=log10(abs(summ - 8.56553));
end
accuracy;
subplot(3, 1, 3), plot(2:points+1,accuracy,'o-r');

%kA = rref([NewX, m])
%disp(kA);

% syms k n; symsum(kA(k).^(n)*y(Vx(k).^n),1,n)
%  lim=0;
%  Vx
%  Vx=Vx.^n 
%  y=0.5.*cos(3.*Vx).*exp(2.*Vx/5)+4.*sin(3.5.*Vx).*exp(-3.*Vx)+3.*Vx
%  for k=1:1:n
%      lim=lim+kA(k)^n*y(k);
%      vpa(lim);
%  end
% 
%  S=vpa(lim)
%  syms x, int((1/(x - 11/10)^(2/5))*(0.5*cos(3*x)*exp(2*x/5)+4*sin(3.5*x)*exp(-3*x)+3*x), 1.1, 2.3)

