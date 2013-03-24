%clear workspace
clear;

%Get filename;
message='Enter filename: ';
fileName=input(message,'s');

%Process scan data
TwoDParser(fileName);
CartesianToPolar(fileName);

%Get median filter strength
message='Enter strength of median filter: ';
medianStrength=input(message);
AddMedian(fileName,medianStrength);

%Clear workspace
clear;