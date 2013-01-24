function returnMatrix = calcWindow(scan)
    xMin=Inf;
    xMax=-Inf;
    yMin=Inf;
    yMax=-Inf;
    for i=1:541
        if(scan.globalPoses(1,i)>xMax)
            xMax=scan.globalPoses(1,i);
        end;
        if(scan.globalPoses(1,i)<xMin)
            xMin=scan.globalPoses(1,i);
        end;
        if(scan.globalPoses(2,i)>yMax)
            yMax=scan.globalPoses(2,i);
        end;
        if(scan.globalPoses(2,i)<yMin)
            yMin=scan.globalPoses(2,i);
        end;
    end;
    returnMatrix=[xMin,xMax;yMin,yMax];
end