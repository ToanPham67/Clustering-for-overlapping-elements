function [U_new, center, obj_fcn] = stepfcm2(data, U, cluster_n, expo)
%STEPFCM One step in fuzzy c-mean clustering.
%   [U_NEW, CENTER, ERR] = STEPFCM(DATA, U, CLUSTER_N, EXPO)
%   performs one iteration of fuzzy c-mean clustering, where
%
%   DATA: matrix of data to be clustered. (Each row is a data point.)
%   U: partition matrix. (U(i,j) is the MF value of data j in cluster j.)
%   CLUSTER_N: number of clusters.
%   EXPO: exponent (> 1) for the partition matrix.
%   U_NEW: new partition matrix.
%   CENTER: center of clusters. (Each row is a center.)
%   ERR: objective function for partition U.
%
%   Note that the situation of "singularity" (one of the data points is
%   exactly the same as one of the cluster centers) is not checked.
%   However, it hardly occurs in practice.
%
%       See also DISTFCM, INITFCM, IRISFCM, FCMDEMO, FCM.

%   Copyright 1994-2014 The MathWorks, Inc. 

mf = U.^expo;       % MF matrix after exponential modification
%  figure('color','white');
% subplot(4,1,1)
% bar(1:200,mf(1,:))
% xlabel('Cluster 1');
% ylabel('Probability');
% hold on
% subplot(4,1,2)
% bar(1:200,mf(2,:))
% xlabel('Cluster 2');
% ylabel('Probability');
% hold on
% subplot(4,1,3)
% bar(1:200,mf(3,:))
% xlabel('Cluster 3');
% ylabel('Probability');
% hold on
% subplot(4,1,4)
% bar(1:200,mf(4,:))
% xlabel('Cluster 4');
% ylabel('Probability');
% hold off

% center = mf*data./(sum(mf,2)*ones(1,size(data,2))); %new center
% dist = distfcm(center, data);       % fill the distance matrix
% V=mean(data);
% d=distfcm(center, V);
% g = distfcm(center, center);
% 
% obj_fcn = (1/length(data))*sum(sum(d.*mf))/((sum(sum((dist.^2).*mf))/(length(data)-expo))+mean(mean(g))/length(data)) ; % objective function
center = mf*data./(sum(mf,2)*ones(1,size(data,2))); %new center
dist = distfcm(center, data);       % fill the distance matrix
V=mean(data);
d=distfcm(center, V);
% g = distfcm(center, center);
SEE=sum(sum((dist.^2).*mf))/(length(data)-size(center,1));
DDC=sum(d'*mf);
obj_fcn = (DDC/(size(center,1)-1))/SEE;
tmp = dist.^(-2/(expo-1));      % calculate new U, suppose expo != 1
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));



% 
% 
% fm=mean(data,1);
% fv=[];
% for i=1:3
%     fv(i,:)=mean(Z(:,utam ==i),2);
%     Nk(i,:)=(sum(utam ==i));
% end
% size(fv)%=[3;14001]
% size(fm)%=[1;14001]

