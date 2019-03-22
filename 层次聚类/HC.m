clear ; close all; clc

% 载入数据
load('ex7data2.mat');
Y = X(:,2);
X = X(:,1);
m = length(X);
Data = [X Y];
 
% 计算前边点与后边点距离
disVector = pdist(Data);  % pdist之后的Y是一个行向量，15个元素分别代表X 的第1点与2-6点、第2点与3-6点,......这样的距离
 
% 转换成方阵
disMatrix = squareform(disVector);
 
% 确定层次聚类树 
treeCluster = linkage(disMatrix);
 
% 可视化聚类树
dendrogram(treeCluster);
 
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
