clc
clear all
close all
% Design of Antenna
% fo=input('operating frequency: ');
% er=input('relative permeability: ');
% h=input('thickness of substrate: ');  %Should not be much smaller than 0.025 of a wavelength (1/40th of a wavelength)
fr=2e9;
er=2.2;
h=1.57e-3;
c=3e8;
lambda=c/fr;
% Width of patch
w=(c/(2*fr))*sqrt((2/(er+1)));
ef= (er+1)/2 + ((er-1)/2)*(1/sqrt(1+(12*h/w)));
lef=c/(2*fr*sqrt(ef));
delL=0.412*h*((ef+0.3)/(ef-0.258))*(((w/h)+0.264)/((w/h)+0.8));
l=lef-2*delL;
BW=3.77*((er-1)/(er*er))*(w/l)*(h/lambda);
% feed co-ordinates
yf=w/2;
xf=l/(2*sqrt(ef));
disp(w)
disp(l)
disp(yf)
disp(xf)