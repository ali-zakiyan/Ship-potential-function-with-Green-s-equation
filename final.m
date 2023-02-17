clc 
clear
length_of_ship=214.18;
Beam_of_ship=28.56;
N_D_V=13;
N_D_U=13;
[EA,NV,C]=all_together(length_of_ship,Beam_of_ship,N_D_V,N_D_U);
%%%%%%%% output of the meshing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NV is the abbreviation of NormalVector
%C is the abbreviation of Center
%LE is the abbreviation of LengthArea
N= 2*10+(N_D_V-3)* 2*N_D_U;
%for i=1:N
%EA(i)=5; %arbitrary
%end
totalarea=0;
for i=1:N
    totalarea=totalarea+EA(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%for Image body%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=2;

%CoI is the abbreviation of centerOfImage
CoI=C;
CoI(:,3)=CoI(:,3)+2*h;

%NVoI is the abbreviation of NormalVectorOfImage.
NVoI=NV;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% defining free stream velocity%%%%%
velocityFreeStream= [1 0 0];
%%%%%%%%%%%finding phi_n%%%%%%%%%%%%%%%%%%%%%%

for  i=1:N
    phi_n(i)=dot(velocityFreeStream,NV(i,:));
end

%%%%%%%%%%%%%%%%%%%Finding G Matrix%%%%%%%%%%%%

for i=1:N
    for j=1:N
        CV=C(j,:)-C(i,:);
        %CV is abbreviation of ConnectingVector
        VoCV(i,j)= sqrt(dot(CV,CV));
        %VoCV is abbreviation of valuOfConnectingVector
    end
end

for i=1:N
    for j=1:N
        CVfI = C(j,:)-CoI(i,:);
        %CVfI is abbreviation of ConnectingVectorForImage
        VoCVfI(i,j) = sqrt(dot(CVfI,CVfI));
        %VoCVfI is abbreviation of valueOfConnectingVectorForImage
    end
end

for i=1:N
    for j=1:N
        G(i,j)=1/VoCV(i,j)+1/VoCVfI(i,j);
        if i==j
            G(i,j)=1/VoCVfI(i,j);
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%defining Gn Matrix%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:N
        Gn(i,j)= ( -1/2*( VoCVfI(i,j) )^(-3/2) ) *  (2*( C(j,1)-C(i,1) )*NV(j,1))+ (2* (C(j,2)-C(i,2) )*NV(j,2) )+(2* (C(j,3)-C(i,3) )*NV(j,3) );
        Gn(i,j)=Gn(i,j)+( -1/2*( VoCVfI(i,j) )^(-3/2) ) *  (2*( CoI(j,1)-CoI(i,1) )*NVoI(j,1))+ (2* (CoI(j,2)-CoI(i,2) )*NVoI(j,2) )+(2* (CoI(j,3)-CoI(i,3) )*NVoI(j,3) );
        if i==j
            Gn(i,j)=( -1/2*( VoCVfI(i,j) )^(-3/2) ) *  (2*( CoI(j,1)-CoI(i,1) )*NVoI(j,1))+ (2* (CoI(j,2)-CoI(i,2) )*NVoI(j,2) )+(2* (CoI(j,3)-CoI(i,3) )*NVoI(j,3) );
        end
    end
end

for j=1:N
    G(:,j)=G(:,j)*EA(j);
end

for j=1:N
    Gn(:,j)=Gn(:,j)*EA(j);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%finding phi on body%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:N
        if i==j
           m(i,j)=2*pi;
        end   
    end    
end        
        
A=m-Gn;
phi_n=phi_n';
B=-G*phi_n;
phi=inv(A)*B;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for m=1:2
%     for n=1:2
%         for i=1:3
%             P(m,n,i)=m*n*i;
%         end
%     end
% end
P=H(h);
[s,f,y]=size(P);
for o=1:1
    test=0;
   
    for m=1:s
        for n=1:f
            for i=1:N
                LPy(m,n,i)= -(C(i,2)-P(m,n,2))/ ( 2*pi* ((C(i,1)-P(m,n,1))^2+(C(i,2)-P(m,n,2))^2+(C(i,3)-P(m,n,3))^2) ) * EA(i);
            end
        end
    end

    for m=1:s
        for n=1:f
            for i=1:N
                Y= NV(i,2)*((C(i,2)-P(m,n,2))^2-(C(i,1)-P(m,n,1))^2 );
                X= 2*NV(i,1)*( C(i,1)-P(m,n,1) )*(C(i,2)-P(m,n,2));
                HPy(m,n,i)= (X+Y)/(2*pi*((C(i,1)-P(m,n,1))^2+(C(i,2)-P(m,n,2))^2+(C(i,3)-P(m,n,3))^2)^2)*EA(i);
            end
        end
    end

    for m=1:s
        for n=1:f
            for k=1:N
                LP(i)=LPy(m,n,k);
                HP(i)=HPy(m,n,k);
            end
            phi_y(m,n) = -LP*phi_n +HP*phi;
            if abs(phi_y(m,n))>=0.01
                test=test+1;
            end
        end
    end
    if test<1
        m=o;
        break
    end

    for m=1:s
        for n=1:f
            if abs(phi_y(m,n))>0.01
                P(m,n,3) = P(m,n,3)+phi_y(m,n)*0.01;
            end
          %  B= P(m,n,2);
        end
    end
   % i=o
   % phi_y
end
