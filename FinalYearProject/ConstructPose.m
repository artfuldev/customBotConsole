%Clear workspace
clear;

%Load required data file for scan structure
load mctlabdata;

%Get the number of scans
N=size(scan);
N=N(2);