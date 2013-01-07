#2dParseReader
A MATLAB project to read and process the .2dparse files created by the [testParse2d application](http://www.github.com/kenshinthebattosai/customBotConsole/tree/master/testParse2d). This project depends on the following main files (as of now):

##TwoDParseReader
is the MATLAB (.m) file which is the main file of the project. It reads the .2dparse file created and stores the values in appropriate struct array called scan. The scan array has as many scan elements as there are number of scans in the .2dparse file.
###scan(i)
consists of the following variables:
* count, the scan number
* time, the time in seconds taken to record the scan, from start  of operation of the robot (from time t=0)
* velo, a 1x3 matrix containing the velocities when the readings were taken
* robotPose, a 1x3 matrix , the local robot pose as X Y Theta
* globalPose, a 1x3 matrix, the pseudo-corrected global robot pose
* localPoses, a 3x541 matrix, containing all the relative laser readings as X Y 1 (2D Homogenous representation)
* globalPoses, a 3x541 matrix, containing the calculated absolute laser readings

##Functions
The MATLAB project makes use of the following functions
###toGlobal
converts the local points(relative co-ordinates) into global points(absolute co-ordinates).
###plotGlobal
plots the global poses of the number of scans specified.
###getUnion
plots the union of the global poses of the number of scans specified.
###mergeScans
merges the scans such that no value is repeated and least error is present in the aligning or the scans. Not yet implemented fully.
###leastSquaresTest
was used to test least squares fit of lines to points. Not used as of now.
###iFit
is used to Incremental-Fit lines to the points of global poses in a scan.
###toImg
is used to convert the existing scans to downsized binary (or grayscale in future editions) images representing the scans.
###storeImg
is used to store the image data processed from the scans into images.
###splitAndMerge
is used to fit lines to the laser readings. Not very efficient as of now. Needs segmentation.
###testSplitAndMerge
is used to test the split and merge function with test inputs.
###lsFit
is the least squares method scan matching function. Has to be improved a bit. Being worked on.