function [lineStack] = iFit(data)
    x0=data(1,:);
    y0=data(2,:);
    sizeData=size(data);
    N=2;
    lineStack=zeros(1,1,2);
    lineCount=1;
    i=2;
    setFlag=0;
    lineDetails=zeros(1,2);
    while(i<=N)
        M=sizeData(2)-N;
        x1=x0(i-1);
        x2=x0(i);
        y1=y0(i-1);
        y2=y0(i);
        m=(y2-y1)/(x2-x1);
        c=(-x1*m)+y1;
        lineStack(lineCount,1,1:2)=[x1;y1];
        lineStack(lineCount,2,1:2)=[x2;y2];
        j=1;
        while(j<=M)
            x3=x0(i+j);
            y3=y0(i+j);
            if(round(round(y3)/10)~=round(round(((m*x3)+c))/10))
                N=N+j;
                i=i+j;
                if(j~=1)
                    lineCount=lineCount+1;
                end;
                break;
            else
                lineStack(lineCount,2+j,:)=[x3;y3];
                lineDetails(lineCount,:,:)=[m;c];
            end;
            j=j+1;
            if(j==M+1)
                setFlag=1;
            end;
        end;
        fprintf('%d,%d\n',i,j);
        if(i==sizeData(2))
            setFlag=1;
        end;
        if(setFlag==1)
            i=i+1;
        end;
    end;
    figure(1);
    hold on;
    for i=1:lineCount
        plot(lineStack(i,:,1),lineStack(i,:,2));
    end;
    figure(2);
    hold on;
    plot(x0,y0);
    figure(3);
    hold on;
    for i=1:lineCount
        plot(lineDetails(i,:));
    end;
end
