function [rot,trans,cH] = scanMatchV2(prevScan,scan1,range,medianValue)
%scanMatchV2 attempted to correct rotatiopn error in orginal scans.
%   Detailed explanation goes here
prevScan=rangeConvert(prevScan,range,medianValue);
scan1=rangeConvert(scan1,range,medianValue);
scanCopy=scan1;
%pSze=size(prevScan);
sze=size(scan1);
%pSze=pSze(2);
sze=sze(2);
max=range/2;
rot=0;
pDist=inf;
for i=1:sze
    j=0; 
    while(j<max)
        dist=0;
        for I=1:sze
        d=abs(prevScan(1,I)-(scan1(1,I)+j));
        dist=d+dist;
        end
    if(dist<pDist)
        pDist=dist;
        rot=i;
        trans=j;
    end
    j=j+100;
    end
    %figure(3),scatter(i,pDist);
    %hold on;
    scan1=circshift(scan1,[0 1]);
end
[cH]=errorCorrection(scanCopy,rot,trans);
figure(4),plot(prevScan);
hold on;
plot(scanCopy,'red')
plot(cH,'green');
hold off;
end


