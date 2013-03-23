#FinalYearProject
A MATLAB project folder to read and process the .2dparse files created by the [testParse2d application](testParse2d) to generate odometer-independant SLAM maps. This project depends on the following main files (as of now):

##Scripts
###TwoDParser
is the MATLAB script file which is the main file of the project. It reads the .2dparse file created and stores the values in appropriate struct array called scan. The scan array has as many scan elements as there are number of scans in the .2dparse file.
###CartesianToPolar
is the MATLAB script file which takes the scan data and converts the localPoses from Cartesian to Polar form and stores it in a new array called polarValues.
###ConstructPose
is the MATLAB script file used to construct poses from the scans. Still being worked on.

##Important Variables
###scan(i)
consists of the following variables:
* count, the scan number
* time, the time in seconds taken to record the scan, from start  of operation of the robot (from time t=0)
* localPoses, a 3x541 matrix, containing all the relative laser readings as [X; Y; 1]. (2D Homogenous representation)
* polarValues, a 3x541 matrix, containing the polar form of the cartesian coordinates in the *localPoses* matrix.

##Files
###df.2dparse
is the 2DParse file containing the LRF data for 1055 scans of the Mechatronics Laboratory at out university.
###rr.2dparse
is the 2DParse file containing the LRF data for 321 scans of the Research Room 2's special room at out university.
###mctlabdata.mat
is the MAT Data File which contains latest scan data of the df.2dparse file at all times (with all recent modifications).
###researchroomdata.mat
is the MAT Data File which contains latest scan data of the rr.2dparse file at all times (with all recent modifications).