function [ segs ] = lineSeg(pts,thres,lnt,min)
%lineSeg line segmentation using euclidean distance.
%   Detailed explanation goes here
tSegs=struct('tempSegs',[]);
segs=struct('lSeg',[]);
cnt=1;
noLSegs=1;
sze=size(pts);
j=1;
k=1;
for i=1:(sze(2)-1)
d=sqrt(((pts(2,i+1)-pts(2,i))^2)+((pts(1,i+1)-pts(1,i))^2));
if(d<thres&&cnt<lnt)
    tSegs(j).tempSegs(1,k)=pts(1,i+1);
    tSegs(j).tempSegs(2,k)=pts(2,i+1);
    k=k+1;
    cnt=cnt+1;
else
    j=j+1;
    k=1;
    cnt=1;
end
end

sze=size(tSegs);

for n=1:sze(2)
    m=size(tSegs(n).tempSegs(:,:));
    if (m(2)>min)
    segs(noLSegs).lSeg(1,:)=tSegs(n).tempSegs(1,:);
    segs(noLSegs).lSeg(2,:)=tSegs(n).tempSegs(2,:);
    scatter(segs(noLSegs).lSeg(1,:),segs(noLSegs).lSeg(2,:));
    hold on;
    noLSegs=noLSegs+1;
    end
end
end

