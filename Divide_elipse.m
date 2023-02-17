function output=Divide_elipse(number_of_divition,major_diameter,minor_diameter)
%Divide_elipse divide elipse to desireable number of divition
%format of call Divide_elipse(number_of_divition,major_diameter,minor_diameter)

x=linspace(-major_diameter,major_diameter,number_of_divition);
f=@(x)sqrt((1-x.^2/major_diameter.^2).*minor_diameter.^2);
output=[x' f(x)'];

%this part is optional
% plot(output(:,1),output(:,2))
