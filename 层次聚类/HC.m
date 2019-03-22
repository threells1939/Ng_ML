clear ; close all; clc

% ��������
load('ex7data2.mat');
Y = X(:,2);
X = X(:,1);
m = length(X);
Data = [X Y];
 
% ����ǰ�ߵ����ߵ����
disVector = pdist(Data);  % pdist֮���Y��һ����������15��Ԫ�طֱ����X �ĵ�1����2-6�㡢��2����3-6��,......�����ľ���
 
% ת���ɷ���
disMatrix = squareform(disVector);
 
% ȷ����ξ����� 
treeCluster = linkage(disMatrix);
 
% ���ӻ�������
dendrogram(treeCluster);
 
% �����±�
idx = cluster(treeCluster,'maxclust',3); %���־���Ϊ3��
 
% ��ͼ
figure
axis equal
hold on;
 
% ��ͬ�ఴ�ղ�ͬ��ɫ���Ƴ���
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
