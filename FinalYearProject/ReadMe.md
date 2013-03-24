#FinalYearProject
A MATLAB project folder to read and process the .2dparse files created by the [testParse2d application](testParse2d) to generate odometer-independant SLAM maps. This project depends on the following main files (as of now):

##Scripts
###ProcessScanData
is the MATLAB script file which is the main file of this project. It calls all the other user-defined helper functions in the project directory.
###TwoDParser
is the MATLAB function file which parses the .2dparse file. It reads the .2dparse file created and stores the values in appropriate struct array called scan. The scan array has as many scan elements as there are number of scans in the .2dparse file.
###CartesianToPolar
is the MATLAB function file which takes the scan data and converts the localXY from Cartesian to Polar form and stores it in a new array called localRT.
###AddMedian
is the MATLAB function file used to apply the median filter to the calculated polar coordinate values. The strength of the applied median filter can be fed as an input to the function.

##Important Variables
###scan(i)
consists of the following variables:
* count, the scan number
* time, the time in seconds taken to record the scan, from start  of operation of the robot (from time t=0)
* localXY, a 3x541 matrix, containing all the relative laser readings as [X; Y; 1]. (2D Homogenous representation)
* localRT, a 3x541 matrix, containing the polar form of the cartesian coordinates in the *localXY* matrix.
* medianRT, a 3x541 matrix, containing the median-filtered polar coordinates. This should be used in scan matching.

##Files
###mctlab.2dparse
is the 2DParse file containing the LRF data for 1055 scans of the Mechatronics Laboratory at out university.
###mctlab.mat
is the MAT Data File which contains latest scan data of the df.2dparse file at all times (with all recent modifications).