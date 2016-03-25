%% Impedance calculation
clc
clear all
close all
w=20.45e-2;
c=3e8;
l=13.97e-2;
h=0.1588e-2;
do=0.127e-2;
er=2.59;
eo=8.854e-12;
ee=eo*er;
tandel=0.003;
xo=0.635e-2;
fo=2e9;
lambda_o=c/fo;
e_eff= (er+1)/2 + ((er-1)/2)*(1/sqrt(1+(12*h/w)));
del_l=0.412*h*((e_eff+0.3)/(e_eff-0.258))*(((w/h)+0.264)/((w/h)+0.8));
le=l+2*del_l;
fr=c/(2*le*sqrt(ee));
X_l= (377/c)*fo*h*log(c/(pi*fo*do*sqrt(er)));
C=((ee*eo*w*l)/(2*h))*(acos(pi*xo/l))^2;
Qr=(c*sqrt(ee)/(4*h*fr))-(ee*del_l/h);
Rc=0.00027*sqrt(fr)*(l/w)*Qr^2;
Rd=(30*tandel/er)*((h*lambda_o)/(l*w))*Qr^2;
Rr=Qr/(2*pi*fr*C);
R=Rr+Rc+Rd;
Qt=Qr*(R/Rr);
Z=(R/(1+(Qt)^2*((fo/fr)-(fr/fo))^2))+1i*(X_l-((R*Qt*((fo/fr)-(fr/fo)))/(1+Qt^2*((fo/fr)-(fr/fo))^2)));
disp(Z)
%% Directivity
ko=(2*pi)/lambda_o;
th=0:180; phi=[0:90 270:360];
[t,p]=meshgrid(th.*pi/180,phi.*pi/180);
X=ko*h/2*sin(t).*cos(p);
Z=ko*w/2*cos(t);
Et=sin(t).*sinc(X/pi).*sinc(Z/pi).*cos(ko*le/2*sin(t).*sin(p));
U=Et.^2;
dt=(th(2)-th(1))*pi/180;
dp=(phi(2)-phi(1))*pi/180;
Prad=sum(sum(U.*sin(t)))*dt*dp;
D=4.*pi.*max(max(U))./Prad;
DdB=10.*log10(D);
disp(D)
disp(DdB)