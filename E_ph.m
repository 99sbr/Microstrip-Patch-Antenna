function [Ephval,Eph1]=E_ph(thr,h,ko,W,Emax)
ARG1=sin(thr).*h.*ko./2;
ARG2=cos(thr).*W.*ko./2;
Ephval=sin(thr).*sinc(ARG1./pi).*sinc(ARG2./pi)./Emax;
Eph1=20.0*log10(abs(Ephval));
Eph1(Eph1<=-60)=-60;