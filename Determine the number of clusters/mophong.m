clear all
clc
mu1 = [0 1];
SIGMA1 = [.1 0; 0 .1];
r1 = mvnrnd(mu1,SIGMA1,50);
r1new=[r1 ones(50,1)];
plot(r1(:,1),r1(:,2),'o')
hold on
mu2 = [1 2];
SIGMA2 = [.1 .05; .05 .1];
r2 = mvnrnd(mu2,SIGMA2,50);
r2new=[r2 ones(50,1)*2];
plot(r2(:,1),r2(:,2),'ko')
mu3 = [0 2];
SIGMA3 = [.1 -.05; -.05 .1];
r3 = mvnrnd(mu3,SIGMA3,50);
r3new=[r3 ones(50,1)*3];
plot(r3(:,1),r3(:,2),'ro')

mu4 = [2 2];
SIGMA4 = [.1 -.01; -.01 .1];
r4 = mvnrnd(mu4,SIGMA4,50);
r4new=[r4 ones(50,1)*4];
plot(r4(:,1),r4(:,2),'go')
hold off
 data=[r1new;r2new;r3new;r4new]
  save('200point.mat','data');
% scatter(zt(1:50,1),zt(1:50,2),'bo','LineWidth',2)
% hold on
% scatter(zt(51:100,1),zt(51:100,2),'kd','LineWidth',2)
% scatter(zt(101:150,1),zt(101:150,2),'r^','LineWidth',2)
% hold off
% save('kq2728.mat','dataa');