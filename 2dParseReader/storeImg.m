function storeImg(A)
%stores images as jpg for further processing(feature mapping)
sze=size(A);
num=sze(1,3);
%store path here as a string
path=sprintf('f:/robotics/p3at/matlab/2DParseReader/scans');
for i=1:num
    name=sprintf('%s/image%d.jpg',path,i);
    imwrite(A(:,:,i),name,'jpg');
end