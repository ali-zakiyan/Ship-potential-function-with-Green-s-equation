function output=H(h)
%H function create a tensor
%each element of tensor is corosponding to coordinate of each point

[X,Y]=meshgrid(1:10,1:12)
[row,col]=size(X);
output=zeros(row,col,3);
for i=1:row
    for j=1:col
        output(i,j,1)=X(i,j);
        output(i,j,2)=Y(i,j);
        output(i,j,3)=h;
    end
end
