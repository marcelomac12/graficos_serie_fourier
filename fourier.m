clc
clear

fs = 10000;        %passo 10E4
t = [0:1/fs:0.2];  %tempo e passo 'pontos no tempo'
f = 20;            %frequencia em hz
A = 600;           %amplitude

acc = 0;           %acumulador
acc1 = 0;

for i=1:2:20 %n
  v = (A/i) * sin(2*pi*f*i*t);
  acc = acc + v;

endfor

figure(1);
clf(1);
plot(t,acc);

Ns = 30;                  %n
t1 = linspace(-5,5,1000); %pontos no tempo
T = max(t1);              %perído
w1 = (2*pi)/T;            %frequencia angular
A1 = 1;                   %amplitude
f1 = 0;                   %inicializa função

for n=1:Ns
  an = ( (4*A1*sin(2*pi*n)/(2*pi*n)) + (4*A1*cos(2*pi*n)/(2*pi*n)^2) - (4*A1/(2*pi*n)^2) );
  bn = ( (4*A1*sin(2*pi*n)/(2*pi*n)^2) + (cos(2*pi*n)/(2*pi*n)) );
  f1 += ( (an*cos(n*w1*t1)) - bn*sin(n*w1*t1) );
endfor

figure(2);
clf(2);
plot(t1,f1);
xlabel('Tempo');
ylabel('Amplitude');
title('Onda dente de serra');
