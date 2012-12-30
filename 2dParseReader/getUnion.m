function getUnion(N,scan)
globalXY=zeros(1,2);
figure(1);
for i=1:N
    globalXY=union(globalXY,scan(i).globalPoses(1:2,:)','rows');
end;
scatter(globalXY(:,1),globalXY(:,2));
figure(2);
plot(globalXY(:,1),globalXY(:,2));
end