function output=find_centroid_of_triangel_with_3_point(Mother_coordinate,M)
% find_centroid_of_triangel_with_3_point return centroid of triangel
% output is 3*1 vector and M is (sequence of triagel ___ vortexs of
% triangle)
% coordinate of this point must read from diffret matrix it mean when user
% seen 18 must look another matrix and find coordinate corosponding to 18
%format of call:find_centroid_of_triangel_with_3_point(M)
point_1=find_coor_by_index(Mother_coordinate,M(1));
point_2=find_coor_by_index(Mother_coordinate,M(2));
point_3=find_coor_by_index(Mother_coordinate,M(3));
x=mean([point_1(1),point_2(1),point_3(1)]);
y=mean([point_1(2),point_2(2),point_3(2)]);
z=mean([point_1(3),point_2(3),point_3(3)]);
output=[x,y,z];
