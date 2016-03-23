clc 
clear
er=input('Enter the Dielectric Constant of the Patch:'); 
h=input( 'Enter the HIGHT of the substrate:'); 
c=3e8 ; 
fr1=input('Enter the lower limit of the operating frequency :');
fr2=input('Enter the upper limit of the operating frequency :');
fr=fr1:1000000:fr2;
k=(2.*pi.*fr).*(sqrt((8.854e-12).*(pi.*4e-7))); 
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./er)+(2./(5.*er.^2))); 
x0=1+( 0.5.* ((er-1).*k.*h./er).^2 );
X0=(x0.^2)-1;
Psur=((30.*pi.*k.^2).*(er.*((x0.^2)-1)))./((er.*( (1./sqrt(X0))+(sqrt(X0)./er-x0.^2)))+((k.*h).*(1+ ((X0.*er.^2)./(er-x0.^2)))));
Ef=Pr./(Pr+Psur); 
figure(1) 
fr11=fr1:1000000:fr2;
plot(fr11,Ef) 
xlabel('Operating frequency (fr)') 
ylabel('Radiation efficiency (Er)') 
grid on 
title('Radiation efficiency Vs Operating frequency')
k=(2.*pi.*2e9).*(sqrt((8.854e-12).*(pi.*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./er)+(2./(5.*er.^2)));
x0=1+( 0.5.* ((er-1).*k.*h./er).^2 );
X0=(x0.^2)-1;
Psur1=((30.*pi.*k.^2).*(er.*((x0.^2)-1)))./((er.*( (1./sqrt(X0))+(sqrt(X0)./er-x0.^2)))+((k.*h).*(1+ ((X0.*er.^2)./(er-x0.^2)))));
Ef1=Pr./(Pr+Psur1);

k=(2.*pi.*10e9).*(sqrt((8.854e-12).*(pi.*4e-7)));
Pr=40.*(k.^2).*((k.*h).^2).*(1-(1./er)+(2./(5.*er.^2)));
x0=1+( 0.5.* ((er-1).*k.*h./er).^2 );
X0=(x0.^2)-1; 
Psur2=((30.*pi.*k.^2).*(er.*((x0.^2)-1)))./((er.*( (1./sqrt(X0))+(sqrt(X0)./er-x0.^2)))+ ((k.*h).*(1+ ((X0.*er.^2)./(er-x0.^2)))));
Ef2=Pr./(Pr+Psur2);
