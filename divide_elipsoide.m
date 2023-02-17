function output=divide_elipsoide(major_diameter,minor_diameter,N_D_V,N_D_U)
%divide elipsoid with constat circular cross section to desir able numebr
%of divition
%format of call:divide_elipsoide(major_diameter,minor_diameter,N_D_V,N_D_U)

x=Divide_elipse(N_D_U,major_diameter,minor_diameter)

% find size of x
[r,c]=size(x);
output=cell(N_D_U,1);
for i=1:r
for j=1:N_D_V
 temp(j)=x(i,1)
end
output{i}=[temp',divide_circle(x(i,2),N_D_V)];
end
end




