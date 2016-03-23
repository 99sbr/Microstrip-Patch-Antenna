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
% width of patch
w=(c/(2*fr))*sqrt((2/(er+1)));
ef= (er+1)/2 + ((er-1)/2)*(1/sqrt(1+(12*h/w)));
lef=c/(2*fr*sqrt(ef));
dell=0.412*h*((ef+0.3)/(ef-0.258))*(((w/h)+0.264)/((w/h)+0.8));
l=lef-2*dell;
Bw=3.77*((er-1)/(er*er))*(w/l)*(h/lambda);
% feed co-ordinates
yf=w/2;
xf=l/(2*sqrt(ef));

lambda_o=c/fr;
lambda=30.0/(fr*sqrt(ef));
ko=2.0*pi/lambda_o;
Emax=sinc(h*ko/2.0/pi);
% Normalized radiated field
%         E-plane pattern : 0 < phi < 90    ;    270 < phi < 360
%         H-plane pattern : 0 < th < 180 

phi=0:360; phir=phi.*pi./180; [Ethval,Eth]=E_th(phir,h,ko,lef,Emax);

th=0:180; thr=th.*pi/180.0;    [Ephval,Eph1]=E_ph(thr,h,ko,w,Emax);
Eph(1:91)=Eph1(91:181); Eph(91:270)=Eph1(181); Eph(271:361)=Eph1(1:91);

% Plots of Radiation Patterns
% Figure 1
% ********
Etheta=[Eth(271:361),Eth(2:91)];
xs=[0 20 40 60 80 90 100 120 140 160 180];
xsl=[270 290 310 330 350 0 10 30 50 70 90];
hli1=plot(Etheta,'b-'); 
set(gca,'Xtick',xs);
set(gca,'Xticklabel',xsl);
set(gca,'position',[0.13 0.11 0.775 0.8]);
h1=gca; h2=copyobj(h1,gcf);
xlim([0 180]);ylim([-60 0]);
set(h1,'xcolor',[0 0 1]); set(hli1,'erasemode','xor'); hx=xlabel('\phi (degrees)','fontsize',12);

axes(h2); hli2=plot(Eph1,'r:'); axis([0 180 -60 0]); 
set(h2,'xaxislocation','top','xcolor',[1 0 0]); 
legend([hli1 hli2],{'E_{\phi} (E-plane)','E_{\phi} (H-plane)'},4); 
xlabel('\theta (degrees)','fontsize',12); 

set([hli1 hli2],'linewidth',2); set(hx,'erasemode','xor');
ylabel('Radiation patterns (in dB)','fontsize',12); 
% title('E- and H-plane Patterns of Rectangular Microstrip Antenna','fontsize',[12]);



% E-plane HPBw and  H-plane HPBw
% ******************************
an=phi(Eth>-3);
an(an>90)=[];

EHPBw=2*abs(max(an));
HHPBw=2*abs(90-min(th(Eph1>-3)));

% Directivity 
[D,DdB]=dir_rect(w,h,lef,l,ko);

% Input Impedance at Y=0 and Y=Yo
[G1,G12]=sintegr(w,l,ko);
Rin0=(2.*(G1+G12))^-1;

% Display (rectangular)
clc;


disp(sprintf('\nRESONANT FREQUENCY (in GHz) = %4.4f',fr));
disp(sprintf('DIElECTRIC CONSTANT OF THE SUBSTRATE = %4.4f',er));
disp(sprintf('HEIGHT OF THE SUBSTRATE (in cm) = %4.4f',h));

disp(w)
disp(l)
disp(yf)
disp(xf)









