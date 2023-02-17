 function [Area,Normal_vector,Centroid]=all_together(major_diameter,minor_diameter,N_D_V,N_D_U)
 output=divide_elipsoide(major_diameter,minor_diameter,N_D_V,N_D_U);
 mother_matrix=cell2mat(output);
 squence=squence_of_element(N_D_V,mother_matrix);
[area,normalVector,C]=find_area_normalVector_and_centorid_for_cell_array(squence,mother_matrix);


area=cell2mat(area);
[r,c]=size(area);
area=mat2cell(area,[r],[1 1]);
area=reshape(area,2,1);
area=cell2mat(area);

C=cell2mat(C);
[r,c]=size(C);
C=mat2cell(C,[r],[3 3]);
C=reshape(C,2,1);
C=cell2mat(C);


normalVector=cell2mat(normalVector);
[r,c]=size(normalVector);
normalVector=mat2cell(normalVector,[r],[3 3]);
normalVector=reshape(normalVector,2,1);
normalVector=cell2mat(normalVector);

[Area,Normal_vector,Centroid]=remove_NaN(area,C,normalVector)

    