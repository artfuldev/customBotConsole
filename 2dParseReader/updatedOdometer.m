function [updatedGlobalPoses] = updatedOdometer(r,t,localPoses,globalPose,origin)
%updatedOdometer updates the globalPose values to correct errors.
%   Detailed explanation goes here
X=(r/2)-135;
if(X>0)
    X=X-90;
end
updatedPose(1,1)=globalPose(1,1)-(t*cosd(X));
updatedPose(1,2)=globalPose(1,2)-(t*sind(X));
updatedPose(1,3)=globalPose(1,3)-X;
 for m=1:541
        updatedGlobalPoses(:,m)=toGlobal(localPoses(:,m),updatedPose,origin);
  end
end

