clc
clear all
% Generate some example discrete data (replace with your own data)
load 200point.mat
data = data(:,[1:2]);

% Initialize an array to store the sum of squared distances (SSD)
SSD = zeros(1, 10);  % Assume a maximum of 10 clusters

for k = 1:10
    % Perform k-means clustering
    [idx, ~, sumd] = kmeans(data, k, 'MaxIter', 1000);
    
    % Compute the sum of squared distances (WCSS)
    SSD(k) = sum(sumd);
end

% Plot the SSD for different numbers of clusters
figure;
plot(1:10, SSD, 'o-');
xlabel('Number of Clusters (k)');
ylabel('Sum of Squared Distances (WCSS)');
title('Elbow Method for Optimal Cluster Number');
grid on;

% Find the elbow point using a heuristic (e.g., derivative analysis)
diffSSD = diff(SSD);
[~, optimalK] = max(diffSSD);
disp(['Optimal number of clusters (elbow point): ', num2str(optimalK)]);
