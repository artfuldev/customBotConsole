%Clear the workspace
clear;

%Load the required data file
load researchroomdata;

%Read the number of scans
N=size(scan);
N=N(2);

%Add Polar Values for the N scans
%Create dummy variables for X and Y
x=0;
y=0;
%Calculate and write the polar values to scan for all scans
for n=1:N
    scan(n).polarValues=ones(3,541);
    for j=1:541
        x=scan(n).localPoses(1,j);
        y=scan(n).localPoses(2,j);
        scan(n).polarValues(1,j)=hypot(x,y);
        scan(n).polarValues(2,j)=atand(y/x);
    end;
end;

%Clear unnecessary variables
clearvars N j n x y;

%Save workspace to MAT data file
save('researchroomdata');