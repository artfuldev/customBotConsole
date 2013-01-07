function plotGlobal(N,scan)
hold off;
hold on;
%plot scatter plot for n scans
for i=1:N
    figure(1);
    scatter(scan(i).globalPoses(1,:),scan(i).globalPoses(2,:));
    hold on;
end;
%rotate camera for debug 
%view(70,90);
%plot coordinate graph for n scans
for i=1:N
    figure(2);
    plot(scan(i).globalPoses(1,:),scan(i).globalPoses(2,:));
    hold on;
end;
%rotate camera for debug
%view(70,90);
end