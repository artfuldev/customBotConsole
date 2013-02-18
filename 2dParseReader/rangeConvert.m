function [ rangeHist ] = rangeConvert(globalPoses,range,medianValue)
%rangeConvert converts globalPoses to a range graph
%   scan(n) must be given as input.
centre=zeros(3);
sze=size(globalPoses);
sze=sze(2);
x1=centre(2);
y1=centre(1);
for i=1:sze
    x2=globalPoses(1,i);
    y2=globalPoses(2,i);
    dist=sqrt((x1-x2)^2+(y1-y2)^2);
    %if (i<45||i>180)
   %     rangeHist(i)=-dist;
   % else 
   if (dist>range)
       dist=range;
   end
        rangeHist(i)=dist;
    %end
end
rangeHist=medfilt1(rangeHist,medianValue);
  
end

