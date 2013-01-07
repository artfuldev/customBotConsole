function [G] = toGlobal(LP,GP,CP)
%Returns a global pose based on local pose, global pose and a correction
%pose
    mulA=eye(3,3);
    mulB=mulA;
    mulC=mulA;
    mulD=mulA;
    mulB(1,3)=GP(1,1);
    mulB(2,3)=GP(1,2);
    mulC(1,3)=CP(1,1);
    mulC(2,3)=CP(1,2);
    theta=GP(1,3)/180*pi;
    mulA(1,1)=cos(theta);
    mulA(2,1)=sin(theta);
    mulA(1,2)=-mulA(2,1);
    mulA(2,2)=mulA(1,1);
    beta=CP(1,3)/180*pi;
    mulD(1,1)=cos(beta);
    mulD(2,1)=sin(beta);
    mulD(1,2)=-mulA(2,1);
    mulD(2,2)=mulA(1,1);
    G=mulA\LP;
    G=mulB\G;
    G=mulC*G;
    G=mulD*G;
end