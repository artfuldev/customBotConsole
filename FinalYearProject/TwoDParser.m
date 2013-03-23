%Clear workspace
clear;

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
scan=struct('count',c,'time',timE,'localPoses',localP);

%Open the specified file
filename = 'rr.2dparse';
fid = fopen(filename);
%No of scans to read count, time and localPoses
N=321;
%Read required values from the file
for n = 1:N
    scan(n).count = fscanf(fid, '\nScan %d', 1);
    scan(n).time = fscanf(fid, '%f', [1,1]);
    garbage = fscanf(fid, '%f', [1,3]);
    garbage = fscanf(fid, '%f', [1,3]);
    garbage = fscanf(fid, '%f', [1,3]);
    localP = fscanf(fid, '\n%f', [2,541]);
    scan(n).localPoses=localP';
    scan(n).localPoses(:,3:3)=onesM;
    scan(n).localPoses=scan(n).localPoses';
end
%Close the file
fclose(fid);

%Clear unwanted variables
clearvars c timE localP onesM filename fid N ans garbage n;

%Save the data in MAT file
save('researchroomdata');