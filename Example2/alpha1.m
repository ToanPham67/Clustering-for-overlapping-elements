function kq=alpha1(alphacu,kcu);
for i=1:length(kcu)
    for j=1:length(kcu)
   alphamoi(i,j)=alphacu(i,j)/(1+alphacu(i,j)*kcu(i,j));
    end
    end
kq=alphamoi';



