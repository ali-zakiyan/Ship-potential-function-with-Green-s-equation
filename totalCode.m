clc
clear
major_diameter = 10;
minor_diameter = 5;
N_D_V = 3;
N_D_U = 3;
output1 = divide_elipsoide(major_diameter,minor_diameter,N_D_V,N_D_U);
output1 = cell2mat(output1);
output2 = squence_of_element(N_D_V,output1);
[area,normalVector,centroid] = find_area_normalVector_and_centorid_for_cell_array(output2,output1)


