 clc
clear all
tic
load 200point
zt=data(:,1:2);
l=5;
d=[];
d = pdist2(zt, zt,'euclidean');
d;
d1=triu(d,1);
cn=(size(zt,1)*(size(zt,1)-1))/2;
mu=(sum(sum(d1)))/(cn);
for i=1:size(zt,1)
   for j=1:size(zt,1)
     tong(i,j)=(d(i,j)-mu).^2;
    end
end
tt=triu(tong,1);
sigma=((sum(sum(tt)))/cn)^0.5;
f=[];
alp=ones(size(zt,1),size(zt,1));
for i=1:size(zt,1)
    for j=1:size(zt,1)
        if d(i,j)>mu*alp(i,j)
             f(i,j)=0;
        else
              f(i,j)=exp(-d(i,j)/(sigma/l)); 
        end
    end
end
f;
for i=1:size(zt,1)
    tu=0;
    mau=0;
    for j=1:size(zt,1)
        tu=tu+zt(j,:)*f(i,j);
        mau=mau+f(i,j);
    end
  ztmoi(i,:)=tu./mau;
end
ztmoi;
hoitu=ztmoi;
iter=0;
exilanh=0.0001;
while max(max(abs(ztmoi-zt)))>exilanh 
   % figure
  zt=ztmoi;
%         figure('color','white');
%         scatter(zt(1:50,1),zt(1:50,2),'k^','LineWidth',2)
%         hold on 
%         scatter(zt(51:100,1),zt(51:100,2),'r^','LineWidth',2)
%         scatter(zt(101:150,1),zt(101:150,2),'b^','LineWidth',2)
%         % scatter(zt(151:200,1),zt(151:200,2),'g^','LineWidth',2)
%         xlabel('Chi?u d�i')
%         ylabel('Chi?u r?ng')
%         lgd =legend('Nh�m 1','Nh�m 2','Nh�m 3','Nh�m 4');
%         lgd.NumColumns = 4;
iter=iter+1
d=[];
 d = pdist2(zt, zt,'euclidean');
d;
d1=triu(d,1);
cn=(size(zt,1)*(size(zt,1)-1))/2;
mu=(sum(sum(d1)))/(cn);
tong=[];
for i=1:size(zt,1)
    for j=1:size(zt,1)
      tong(i,j)=(d(i,j)-mu).^2;
    end
end
tt=triu(tong,1);
sigma=((sum(sum(tt)))/cn)^0.5;
alp=alpha1(alp,f);
f=[];
for i=1:size(zt,1)
for j=1:size(zt,1)
         if d(i,j)>mu*alp(i,j)
           f(i,j)=0;  
         else
            f(i,j)=exp(-d(i,j)/(sigma/l)); 
        end
end
end
f;
for i=1:size(zt,1)
    tu=0;
    mau=0;
    for j=1:size(zt,1)
        tu=tu+zt(j,:)*f(i,j);
        mau=mau+f(i,j);
    end
  ztmoi(i,:)=tu/mau;
end
ztmoi;
hoitu=[hoitu;ztmoi];

end
kq=ztmoi  
[dmin, Uj]=kmeans(kq,4);
 figure('color','white');
        scatter(data(1:200,1),data(1:200,2),'b^','LineWidth',2)
        hold on
        plot(kq(1:200,1),kq(1:200,2),'r^','LineWidth',8)