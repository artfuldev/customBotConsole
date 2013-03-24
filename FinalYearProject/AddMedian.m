function AddMedian(fileName,medianStrength)
%Applies a median filter of strength m to the RT Values.

    %Load the required data file
    loadString=['load ' fileName];
    eval(loadString);
    
    %Suppress error messages
    %#ok<*NODEF>
    
    %Get the number of scans
    N=size(scan);
    N=N(2);
    
    %Add median filter of strength m
    for n=1:N
        scan(n).medianRT=scan(n).localRT;
        scan(n).medianRT(1,:)=medfilt1(scan(n).localRT(1,:),medianStrength);
    end;
    
    %check the applied median
    figure(1);
    scatter(scan(1).medianRT(2,:),scan(1).medianRT(1,:));
    figure(2);
    scatter(scan(1).localRT(2,:),scan(1).localRT(1,:));
    
    %Save Scan data back to file
    save(fileName,'scan');
    
    %Clear workspace
    clear;

end