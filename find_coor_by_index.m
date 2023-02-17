function output=find_coor_by_index(M,index)
% find_coordinate of point by index
% dimetion of M is n*3
% dimention of index n*1 
% all M element muset be integer and must be smaller than n
% format of call:find_coor_by_index(coordinate matrix,index)
[r_index,c_index]=size(index);
output=zeros(r_index,3);
for i=1:r_index
    output(i,:)=M(index(i),:);
end

