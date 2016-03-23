function [Ethval,Eth]=E_th(phir,h,ko,Leff,Emax)
ARG=cos(phir).*h.*ko./2;
Ethval=(sinc(ARG./pi).*cos(sin(phir).*ko*Leff./2))./Emax;
Eth=20*log10(abs(Ethval));
Eth(phir>pi/2&phir<3*pi/2)=-60;
Eth(Eth<=-60)=-60;