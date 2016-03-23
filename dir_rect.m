function [D,DdB]=dir_rect(W,h,Leff,L,ko)
th=0:180; phi=[0:90 270:360];
[t,p]=meshgrid(th.*pi/180,phi.*pi/180);
X=ko*h/2*sin(t).*cos(p);
Z=ko*W/2*cos(t);
Et=sin(t).*sinc(X/pi).*sinc(Z/pi).*cos(ko*Leff/2*sin(t).*sin(p));
U=Et.^2;
dt=(th(2)-th(1))*pi/180;
dp=(phi(2)-phi(1))*pi/180;
Prad=sum(sum(U.*sin(t)))*dt*dp;
D=4.*pi.*max(max(U))./Prad;
DdB=10.*log10(D);