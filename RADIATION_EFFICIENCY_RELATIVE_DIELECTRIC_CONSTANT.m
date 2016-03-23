%% AE PROJECT %%
clc
clear all
close all
fr=input('Enter the value of resonant frequency: ');
fr1=input('Enter the lower limit of the operating frequency :');
fr2=input('Enter the upper limit of the operating frequency :');
h=input( 'Enter the HIGHT of the substrate:');
disp(' ')
i1=input('Enter the lower limit of the Relative dielectric constant :');
i2=input('Enter the upper limit of the Relative dielectric constant :');
er=i1:.01:i2;
k=(2*pi*fr).*(sqrt((8.854e-12)*(pi*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./er)+(2./(5.*er.^2)));
x0=1+( 0.5.* ((er-1).*k.*h./er).^2 );
X0=(x0.^2)-1;
Psur=((30.*pi.*k.^2).*(er.*((x0.^2)-1)))./((er.*( (1./sqrt(X0))+(sqrt(X0)./er-x0.^2)))+((k.*h).*(1+ ((X0.*er.^2)./(er-x0.^2)))));
Er=Pr./(Pr+Psur);
figure(1)
er13=i1:.01:i2;
plot(er13,Er)
xlabel('Relative dielectric constant (er)')
ylabel('Radiation efficiency (er)')
grid on
title('Radiation efficiency Vs Relative dielectric constant')
k=(2*pi*fr).*(sqrt((8.854e-12)*(pi*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./4.5)+(2./(5.*4.5.^2)));
x0=1+( 0.5.* ((4.5-1).*k.*h./4.5).^2 );
X0=(x0.^2)-1;
Psur1=((30.*pi.*k.^2).*(4.5.*((x0.^2)-1)))./((4.5.*((1./sqrt(X0))+(sqrt(X0)./4.5-x0.^2)))+((k.*h).*(1+((X0.*4.5.^2)./(4.5-x0.^2)))));
Ef1=Pr./(Pr+Psur1);
text(4.5,Ef1,...
'\bullet\leftarrow\fontname{times}Er at {er} = 4.5 [Rogers TMM4] ',...
'FontSize',12)
k=(2*pi*fr).*(sqrt((8.854e-12)*(pi*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./2.32)+(2./(5.*2.32.^2)));
x0=1+( 0.5.* ((2.32-1).*k.*h./2.32).^2 );
X0=(x0.^2)-1;
Psur2=((30.*pi.*k.^2).*(2.32.*((x0.^2)-1)))./((2.32.*((1./sqrt(X0))+(sqrt(X0)./2.32-x0.^2)))+((k.*h).*(1+((X0.*2.32.^2)./(2.32-x0.^2)))));
Ef2=Pr./(Pr+Psur2);
text(2.32,Ef2,...
'\bullet\leftarrow\fontname{times}Er at {er} = 2.32 [Duroid]',...
'FontSize',12)
%% Radiation efficiency Vs Operating Frequency (f) [Duroid] 
figure(2)
f=fr1:1e9:fr2;
er=2.32;
k=(2*pi*f).*(sqrt((8.854e-12)*(pi*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./er)+(2./(5.*er.^2)));
x0=1+( 0.5.* ((er-1).*k.*h./er).^2 );
X0=(x0.^2)-1;
Psur=((30.*pi.*k.^2).*(er.*((x0.^2)-1)))./((er.*( (1./sqrt(X0))+(sqrt(X0)./er-x0.^2)))+((k.*h).*(1+ ((X0.*er.^2)./(er-x0.^2)))));
Er=Pr./(Pr+Psur);
plot(f,Er)
xlabel('Operating Frequency')
ylabel('Radiation efficiency (Er)')
grid on
title('Radiation efficiency Vs Operating Frequency (f)')
text(2e9,Ef1,...
'\bullet\leftarrow\fontname{times}Er at {f} = 2Ghz [Duroid]',...
'FontSize',12)
%% Radiation efficiency Vs Operating Frequency (f) [Rogers TMM4]
figure(3)
f=fr1:1e9:fr2;
er=4.5;
k=(2*pi*f).*(sqrt((8.854e-12)*(pi*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./er)+(2./(5.*er.^2)));
x0=1+( 0.5.* ((er-1).*k.*h./er).^2 );
X0=(x0.^2)-1;
Psur=((30.*pi.*k.^2).*(er.*((x0.^2)-1)))./((er.*( (1./sqrt(X0))+(sqrt(X0)./er-x0.^2)))+((k.*h).*(1+ ((X0.*er.^2)./(er-x0.^2)))));
Er=Pr./(Pr+Psur);
plot(f,Er)
xlabel('Operating Frequency')
ylabel('Radiation efficiency (Er)')
grid on
title('Radiation efficiency Vs Operating Frequency (f)')
text(2e9,Ef2,...
'\bullet\leftarrow\fontname{times}Er at {f} = 2Ghz [Rogers TMM4] ',...
'FontSize',12)
%% patch length variation
figure(4)
c=3e8;
er=i1:.01:i2;
w=(c/(2*fr)).*sqrt((2./(er+1)));
plot(er,w)
xlabel('Relative Dielectric Constant (er)')
ylabel('Width of patch antenna (w)')
grid on
er=2.32;
w1=(c/(2*fr)).*sqrt((2./(er+1)));
text(2.32,w1,'\bullet\leftarrow\fontname{times}w at {er} = 2.32 [Duroid]','FontSize',12)
er=4.5;
w2=(c/(2*fr)).*sqrt((2./(er+1)));
text(4.5,w2,'\bullet\leftarrow\fontname{times}w at {er} =4.5 [Rogers TMM4]','FontSize',12)
%% Bandwidth calculation
lambda=c/fr;
% Width of patch
w=(c/(2*fr))*sqrt((2/(er+1)));
ef= (er+1)/2 + ((er-1)/2)*(1/sqrt(1+(12*h/w)));
lef=c/(2*fr*sqrt(ef));
delL=0.412*h*((ef+0.3)/(ef-0.258))*(((w/h)+0.264)/((w/h)+0.8));
l=lef-2*delL;
BW=(3.77*((er-1)/(er*er))*(w/l)*(h/lambda))*100;
disp(BW)
