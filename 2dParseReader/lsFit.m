function [lsResult] = lsFit(scan,n1,n2)
%returns the least square error, x,y,t errors
    Txy=eye(3,3);
    Txy(1,3)=scan(1).globalPose(1,1);
    Txy(2,3)=scan(1).globalPose(1,2);
    alpha=scan(1).globalPose(1,3)*pi/180;
    Tr=[cos(alpha),-sin(alpha),0;sin(alpha),cos(alpha),0;0,0,1];
    xB=scan(n2).globalPoses(:,:);
    xA=scan(n1).globalPoses(:,:);
    xBMin=scan(n2).window(1,1);
    xBMax=scan(n2).window(1,2);
    yBMin=scan(n2).window(2,1);
    yBMax=scan(n2).window(2,2);
    xyt=scan(n1).globalPose;
    revR=eye(3,3);
    revXY=revR;
    revXY(1,3)=xyt(1,1);
    revXY(2,3)=xyt(1,2);
    gamma=xyt(1,3)*pi/180;
    revR(1,1)=cos(gamma);
    revR(1,2)=-sin(gamma);
    revR(2,1)=-revR(1,2);
    revR(2,2)=revR(1,1);
    x1=scan(n1).globalPose(1,1);
    y1=scan(n1).globalPose(1,2);
    a1=scan(n1).globalPose(1,3);
    x2=scan(n2).globalPose(1,1);
    y2=scan(n2).globalPose(1,2);
    a2=scan(n2).globalPose(1,3);
    txC=eye(3,3);
    minVal=Inf;
    lsT=0;
    lsX=0;
    lsY=0;
    xLS=eye(3,3);
    %x,y tolerances
    %10mm/meter error
    xTolerance=round(abs((x2-x1)/10));
    if(xTolerance==0)
        xTolerance=1;
    end;
    yTolerance=round(abs((y2-y1)/10));
    if(yTolerance==0)
        yTolerance=1;
    end;
    %timeDone=scan(n2).time-scan(n1).time;
    %xTolerance=xTolerance+round((timeDone*(scan(n1).velo(1,1)+scan(n2).velo(1,1)))/2);
    %yTolerance=yTolerance+round((timeDone*(scan(n1).velo(1,1)+scan(n2).velo(1,1)))/2);
    if(xTolerance==0)
        xTolerance=1;
    end;
    if(yTolerance==0)
        yTolerance=1;
    end;
    %--commented out--%
    %theta tolerances
    %1 degree per meter travelled
    thetaTolerance=round(sqrt(xTolerance^2+yTolerance^2)/100);
    %also, 2 degrees per rotation
    thetaTolerance=thetaTolerance+round(2*abs(a2-a1));
    %also, theta tolerance is propertional to rotational velocity
    %thetaTolerance=thetaTolerance+round((timeDone*(scan(n1).velo(1,2)+scan(n2).velo(1,2)))/2);
    while(thetaTolerance>180)
        thetaTolerance=thetaTolerance-180;
    end;
    fprintf('%d,%d,%d\n\n',xTolerance,yTolerance,thetaTolerance);
    for t=-thetaTolerance:thetaTolerance
        theta=(t+a1)*pi/180;
        tC=[cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1];
        for i=-xTolerance:xTolerance
            for j=-yTolerance:yTolerance
                txC(1,3)=i+x1;
                txC(2,3)=j+y1;
                xC=Tr\scan(n1).globalPoses(:,:);
                xC=Txy\xC;
                xC=revXY*xC;
                xC=revR*xC;
                xC=tC\xC;
                xC=txC\xC;
                xC=Txy*xC;
                xC=Tr*xC;
                lsQ=0;
                noOfSamePoints=0;
                for k=1:541
                    for l=1:541
                        if((xB(1,k)==xC(1,k))&&(xB(2,k)==xC(2,l)))
                            noOfSamePoints=noOfSamePoints+1;
                        end;
                        lsQ=lsQ+((xB(1,k)-xC(1,l))^2)+((xB(2,k)-xC(2,l))^2);
                    end;
                end;
                lsQ=lsQ-(noOfSamePoints*(10^12));
                if(lsQ<minVal)
                    minVal=lsQ;
                    xLS=xC;
                    lsT=t;
                    lsX=i;
                    lsY=j;
                    fprintf('Updated lsQ %d,%d,%d,%g\n',i,j,t,lsQ);
                end;
            end;
        end;
    end;
    figure(3);
    plot(xB(1,:),xB(2,:),xA(1,:),xA(2,:));
    figure(4);
    plot(xB(1,:),xB(2,:),xLS(1,:),xLS(2,:));
    lsResult=[minVal,lsX,lsY,lsT];
end