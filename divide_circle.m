function output=divide_circle(r,numebr_of_divition)
%divide_circle divie a circle to desirabel numebr of divition
%format of call:divide_circle(r,numebr_of_divition)

x=linspace(0,2*pi,numebr_of_divition)';
[x,y]=pol2cart(x,r);
output=[x,y];