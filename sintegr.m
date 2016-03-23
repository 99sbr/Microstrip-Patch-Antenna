function [G1,G12]=sintegr(W,L,ko)
th=0:1:180; t=th.*pi/180;
ARG=cos(t).*(ko*W/2);
res1=sum(sinc(ARG./pi).^2.*sin(t).^2.*sin(t).*((pi/180)*(ko*W/2)^2));
res12=sum(sinc(ARG./pi).^2.*sin(t).^2.*besselj(0,sin(t).*(ko*L)).*sin(t).*((pi/180)*(ko*W/2)^2));
G1=res1./(120*pi^2); G12=res12./(120*pi^2);
