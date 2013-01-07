%initialize points
x=[0 1 2 3 4 6 6 7 7 7 7];
y=[7 7 7 7 6 6 4 3 2 1 0];
%make xy matrix
xy(1,:)=x;
xy(2,:)=y;
%test splitAndMerge
splitAndMergeReturn=splitAndMerge(xy,1);
%modify results to suit sort order
n=size(splitAndMergeReturn);
nR = n(1);
nC = n(2);
%-----have to post code here-----
%plot split and merge results
figure(1);
plot(splitAndMergeReturn(:,1),splitAndMergeReturn(:,2));
hold on;
scatter(splitAndMergeReturn(:,1),splitAndMergeReturn(:,2));
%plotting original for comparison
figure(2);
scatter(x,y);