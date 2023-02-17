function output=squence_of_element(number_of_divitin_in_each_section,M)
% squence_of_element return cell Array 
% M is n*3 matrix (coordinate matrix)
%format of call : squence_of_element(number_of_divitin_in_each_section,M)

[r,c]=size(M);
output=cell(((r/number_of_divitin_in_each_section)-1)*(number_of_divitin_in_each_section-1),1);
N_O_D=number_of_divitin_in_each_section;
for i=1:(r/number_of_divitin_in_each_section)-1
    for j=1:number_of_divitin_in_each_section
        if j~=number_of_divitin_in_each_section
             number=(i-1)*number_of_divitin_in_each_section+j;
        output{number}={[(i-1)*N_O_D+j,(i)*N_O_D+j,(i)*N_O_D+j+1],[(i-1)*N_O_D+j (i-1)*N_O_D+j+1 (i)*N_O_D+j+1]};
        else 
            number=(i-1)*number_of_divitin_in_each_section+j;
        output{number}={[(i-1)*N_O_D+j (i-1)*N_O_D+j+1 i],[(i-1)*N_O_D+j (i)*N_O_D+j (i-1)*N_O_D+j+1]}
        end
    
    end
end
        