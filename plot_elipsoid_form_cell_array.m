function [output,r_inside]=plot_elipsoid_form_cell_array(Cell_array)
%plot_elipsoid_form_cell_array use scatter plot for plot node of elipsoid
%plot_elipsoid_form_cell_array must be N*1 cell array

[r,c]=size(Cell_array);
[r_inside,c_inside]=size(Cell_array{1});
output=zeros(r*r_inside,3);
counter=1;
for i=1:r
    for j=1:r_inside
        output(counter,:)=Cell_array{i}(j,:);
        counter=counter+1;
    end
end



    