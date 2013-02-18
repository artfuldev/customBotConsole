%run this script,No need to pre run anything.all functions included to
%obtain split and merge.
scan=load('df.mat');
scan=scan.scan;
i=26;
thres=300;
[L]=splitAndMerge(scan(i).globalPoses(1:2,:),thres);
scatter(scan(i).globalPoses(1,:),scan(i).globalPoses(2,:));
figure(2);
scatter(L(:,1),L(:,2));