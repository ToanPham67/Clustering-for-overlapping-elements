clc
clear all
load 200point
zt = data(:,1:2);
%     [U, centers]=kmeans(data(:,1:2),4);
    [centers,Umo,obj_fcn]=fcm2(data(:,1:2),4);
    line([1:length(obj_fcn)],obj_fcn)
    
     [md,U]=max(Umo', [], 2);
    act=[ones(1,50),ones(1,50)*2,ones(1,50)*3,ones(1,50)*4];
    [CR, RI,MI, HI]=RandIndex(U,act)
% PC=sum(sum(Umo.^2))/size(Umo,2)
% PE=-sum(sum(Umo.*log(Umo)))/size(Umo,2)