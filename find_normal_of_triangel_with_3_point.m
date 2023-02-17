function output=find_normal_of_triangel_with_3_point(Mother_coordinate,M)
% find_normal_of_triangel_with_3_point return normal_vector of triangel
% output is 3*1 vector and M is (sequence of triagel ___ vortexs of
% triangle)
% coordinate of this point must read from diffret matrix it mean when user
% seen 18 must look another matrix and find coordinate corosponding to 18
%format of call:find_normal_of_triangel_with_3_point(M)
point_1=find_coor_by_index(Mother_coordinate,M(1));
point_2=find_coor_by_index(Mother_coordinate,M(2));
point_3=find_coor_by_index(Mother_coordinate,M(3));
first_line=point_3-point_1;
second_line=point_2-point_1;
output=cross(first_line,second_line);
output=output/norm(output);



