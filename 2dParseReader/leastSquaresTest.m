x=[1 3 5 7 9];
y=(4*x)+5;
disp(x);
disp(y);
x0(1:2,:)=[x;y];
x0(3:3,:)=ones(size(x),size(y));
disp(x0);
a=pi/4;
b=pi/3;
tA=[cos(a),-sin(a),0;sin(a),cos(a),0;0,0,1];
tB=[cos(b),-sin(b),0;sin(b),cos(b),0;0,0,1];
xA=tA*x0;
xB=tB*x0;
minVal=Inf;
lsQ=0;
for t=-180:180
    theta=t*pi/180;
    lsQ=0;
    tC=[cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1];
    xC=tC*x0;
    for i=1:5
      lsQ=lsQ+(xB(i)-xC(i))^2;
    end;
    if(lsQ<minVal)
        minVal=lsQ;
        xLS=xC;
    end;
end;
plot(xB(1,:),xB(2,:),xLS(1,:),xLS(2,:));