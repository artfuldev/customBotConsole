function TwoDParser(fileName)
%Parses the .2dparse file and stores the relevant data from the scans.
    
    %Declare necessary variables/structure templates
    c=1;
    timE=1;
    localP=zeros(2,541);
    onesM=ones(541,1);
    
    %Garbage values of odometer
    %Suppress errors in value assignment to this variable
    %#ok<*NASGU>
    garbage=zeros(3,1);

    %Declare structure "scan"
    scan=struct('count',c,'time',timE,'localXY',localP);
    
    %Open the specified file
    fileExtension='.2dparse';
    fullFileName=strcat(fileName,fileExtension);
    %open the respective file
    fid=fopen(fullFileName);
    %get the number of lines
    N=0;
    while(fgets(fid)~=-1),
        N=N+1;
    end;
    fclose(fid);
    N=N/546;
    %Re-open file, now that we know how many scans to read
    fid=fopen(fullFileName);
    %Read required values from the file
    for n = 1:N
        scan(n).count=fscanf(fid,'\nScan %d',1);
        scan(n).time=fscanf(fid,'%f',[1,1]);
        garbage=fscanf(fid,'%f',[1,3]);
        garbage=fscanf(fid,'%f',[1,3]);
        garbage=fscanf(fid,'%f',[1,3]);
        localP=fscanf(fid,'\n%f',[2,541]);
        scan(n).localXY=localP';
        scan(n).localXY(:,3:3)=onesM;
        scan(n).localXY=scan(n).localXY';
    end;
    %Close the file
    fclose(fid);
    
    %Save the data in MAT file
    save(fileName,'scan');
    
    %clear workspace
    clear;
end