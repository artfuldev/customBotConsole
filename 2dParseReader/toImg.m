function [imgMat]= toImg(scan,N)
%if N>500 and N<1100 and if you have only 4 GB ram close other applications
%and run this function.It uses lot of RAM but less CPU(10% max) 
    cGP=zeros(3,541);
    cGP(3,:)=1;
    %rX=0;
    %rY=0;
    imgSum=zeros;
    mGP=zeros;
    %structure correctGP has values of GPoses downsized for image creation
    %and processing. 'correctedGPoses' has the downsampled values of
    %globalPoses. 'minGP' has the smallest value of X and Y of all the
    %scans(to make all the values positive this minGP is added).
    correctGP=struct('correctedGPoses',cGP,'minGP',mGP);
    for j=1:N
        correctGP(1).minGP(1,j)=min(scan(j).globalPoses(1,:));
        correctGP(1).minGP(2,j)=min(scan(j).globalPoses(2,:));
    end
     overallMinX=min(correctGP(1).minGP(1,:));
     overallMinY=min(correctGP(1).minGP(2,:));
    for j=1:N
        for i=1:541
            correctGP(j).correctedGPoses(1,i)=int16((scan(j).globalPoses(1,i)+scan(1).globalPose(1,1)-(overallMinX))/100);
            correctGP(j).correctedGPoses(2,i)=int16((scan(j).globalPoses(2,i)+scan(1).globalPose(1,2)-(overallMinY))/100);
            imgMat(correctGP(j).correctedGPoses(1,i),correctGP(j).correctedGPoses(2,i),j)=1;
        end
    end
   %res=size(imgMat);
    %rX=res(1,1);
    %rY=res(1,2);
    %for i=1:rX
     %   for j=1:rY
      %      imgSum(i,j)=sum(imgMat(i,j,:));
       % end
    %end       