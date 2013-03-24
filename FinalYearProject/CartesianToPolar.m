function CartesianToPolar(fileName)    
%Converts the Cartesian co-ordinates to Polar in the scans
%and creates an additional entry in the scan structure.

    %Load the required data file
    loadString=['load ' fileName];
    eval(loadString);
    
    %Suppress error messages
    %#ok<*NODEF>
    
    %Read the number of scans
    N=size(scan);
    N=N(2);
    
    %Add Polar Values for the N scans
    %Calculate and write the polar values to scan for all scans
    for n=1:N
        scan(n).localRT=ones(3,541);
        for j=1:541
            x=scan(n).localXY(1,j);
            y=scan(n).localXY(2,j);
            scan(n).localRT(1,j)=hypot(x,y);
            scan(n).localRT(2,j)=atand(y/x);
            scan(n).localRT(2,j)=-scan(n).localRT(2,j)-180;
            if(j>91)
                scan(n).localRT(2,j)=scan(n).localRT(2,j)+180;
            end;
            if(j>450)
                scan(n).localRT(2,j)=scan(n).localRT(2,j)+180;
            end;
        end;
    end;
    
    %Save data to MAT data file
    save(fileName,'scan');
    
    %Clear the workspace
    clear;
end