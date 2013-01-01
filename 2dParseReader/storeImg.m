function storeImg(A)
%stores images as jpg for further processing(feature mapping)
sze=size(A);
num=sze(1,3);
for i=1:num
    name=sprintf('f:/robotics/p3at/matlab/2DParseReader/scans/image%d.jpg',i);
    imwrite(A(:,:,i),name,'jpg');
end

