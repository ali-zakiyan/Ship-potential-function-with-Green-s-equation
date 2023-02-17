function [area,normal_vector,C]=remove_NaN(area,C,normal_vector)
% remove NaN row 
%format of call:remove_NaN(area,C,normal_vector)

index=[];
[row,col]=size(normal_vector);
for i=1:row
    if isnan(normal_vector(i,1))
       index=[index i];
    end
end
area(index)=[];
C(index,:)=[];
normal_vector(index,:)=[];
end

        