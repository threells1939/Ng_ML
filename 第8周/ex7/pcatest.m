%% === Part 8(b): Optional (ungraded) Exercise: PCA for Visualization ===
% Use PCA to project this cloud to 2D for visualization
close all; close all; clc
load('X.mat');
X = fillmissing(X,'linear');

K = 3; %聚类数量
max_iters = 10; %迭代次数
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

% Subtract the mean to use PCA
[X_norm, mu, sigma] = featureNormalize(X);

% PCA and project the data to 2D
[U, S] = pca(X_norm);
Z = projectData(X_norm, U, 2);

% Plot in 2D
figure;
plotDataPoints(Z, idx, K);
title('Pixel dataset plotted in 2D, using PCA for dimensionality reduction');

%  Visualize the data and centroid memberships in 3D
Z3 = projectData(X_norm, U, 3);
figure;
scatter3(Z3(:, 1), X(:, 2), X(:, 3));
title('Pixel dataset plotted in 3D. Color shows centroid memberships');

X = Z(:,1);
Y = Z(:,2);
m = length(Z);
Data = [X Y];
 
% 计算前边点与后边点距离
disVector = pdist(Data);  % pdist之后的Y是一个行向量，15个元素分别代表X 的第1点与2-6点、第2点与3-6点,......这样的距离
 
% 转换成方阵
disMatrix = squareform(disVector);
 
% 确定层次聚类树 
treeCluster = linkage(disMatrix);
 
% 可视化聚类树
% dendrogram(treeCluster);
 
% 聚类下标
idx = cluster(treeCluster,'maxclust',3); %划分聚类为3类
 
% 画图
figure
axis equal
hold on;
 
% 不同类按照不同颜色绘制出来
for i = 1:m
   switch(idx(i))
       case 1
           scatter(X(i),Y(i),'r');
       case 2
           scatter(X(i),Y(i),'g');
       case 3
           scatter(X(i),Y(i),'b');
       case 4
           scatter(X(i),Y(i),'y');
       case 5
           scatter(X(i),Y(i),'k');
       otherwise;
   end
end
