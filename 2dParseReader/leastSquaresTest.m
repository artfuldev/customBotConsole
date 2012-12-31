x=[1 3 5 7 9];
y=(4*x)+5;
disp(x);
disp(y);
x0=zeros(3,4);
x0(1:2,:)=[x(1,1:4);y(1,1:4)];
x0(3:3,:)=ones(size(x),size(y));
x0(2,4)=10;
x1=x0;
x1(1:2,1:4)=[x(1,2:5);y(1,2:5)];
x1(2,3)=11;
disp(x0);
a=60*pi/180;
b=30*pi/180;
tA=[cos(a),-sin(a),0;sin(a),cos(a),0;0,0,1];
tB=[cos(b),-sin(b),0;sin(b),cos(b),0;0,0,1];
txA=eye(3,3);
txA(1,3)=2;
txA(2,3)=1;
txB=eye(3,3);
txB(1,3)=1;
txB(2,3)=2;
xA=txA*x0;
xA=tA*xA;
xB=txB*x1;
xB=tB*xB;
minVal=Inf;
lsQ=0;
txC=eye(3,3);
txC(3,3)=1;
for t=-45:45
    theta=(t+(a*180/pi))*pi/180;
    tC=[cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1];
    for i=-5:5
        for j=-5:5
            txC(1,3)=i;
            txC(2,3)=j;
            xC=txC*x0;
            xC=tC*xC;
            lsQ=0;
            for k=1:4
                for l=1:4
                    lsQ=lsQ+((xB(1,k)-xC(1,l))^2)+((xB(2,k)-xC(2,l))^2);
                end;
            end;
            if(lsQ<minVal)
                minVal=lsQ;
                xLS=xC;
                lsT=theta*180/pi;
                lsX=i;
                lsY=j;
            end;
        end;
    end;
end;
plot(xB(1,:),xB(2,:),xLS(1,:),xLS(2,:));