function [area,normalVector,centroid]=find_area_normalVector_and_centorid_for_cell_array(cell_array,Mother_coordinate)
% find_area_normalVector_and_centorid_for_cell_array use some user define
% function to calculate area ,normal_vector,and centorid for each triangel
% mesh 
%format of call:find_area_normalVector_and_centorid_for_cell_array(cell_array)
[r_outter,c_inner]=size(cell_array)
[r_inner,c_inner]=size(cell2mat(cell_array{1}))
area_outter=cell(r_outter,r_inner)
% area_inner=cell(r_inner,c_inner)
for i=1:r_outter
   if not(isempty(cell2mat(cell_array{i})))

    area_outter{i}(1)=find_area_of_triangel_with_3_point(Mother_coordinate,(cell2mat(cell_array{i}(1)))')
    area_outter{i}(2)=find_area_of_triangel_with_3_point(Mother_coordinate,(cell2mat(cell_array{i}(2)))');
 

   end
end
%
normalVector_outter=cell(r_outter,2)
% normalVector_inner=cell(r_inner,c_inner)
for i=1:r_outter
if  not(isempty(cell2mat(cell_array{i})))
    normalVector_outter{i,1}=find_normal_of_triangel_with_3_point(Mother_coordinate,(cell2mat(cell_array{i}(1)))');
    normalVector_outter{i,2}=find_normal_of_triangel_with_3_point(Mother_coordinate,(cell2mat(cell_array{i}(2)))');
 
    end
end

%
centroid_outter=cell(r_outter,2)
% centroid_inner=cell(r_inner,c_inner)
for i=1:r_outter
    if not(isempty(cell2mat(cell_array{i})))
   centroid_outter{i,1}=find_centroid_of_triangel_with_3_point(Mother_coordinate,(cell2mat(cell_array{i}(1)))');
    centroid_outter{i,2}=find_centroid_of_triangel_with_3_point(Mother_coordinate,(cell2mat(cell_array{i}(2)))');
   end
end
area=area_outter;
normalVector=normalVector_outter;
centroid=centroid_outter;