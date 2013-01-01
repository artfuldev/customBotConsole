function writeFil(strctImgs)
%Not used as its a very long process.storeImg is used.    
%function to write imgs to a .dat to retreive for future use.
    sze=size(strctImgs);
    fid=fopen('twoImgdata.dat','w');
    for i=1:(sze(1,3))
        fprintf(fid,'\n i %d \n',i);
        for j=1:(sze(1,2))
            fprintf(fid,'\n c %d \n',j);
            for k=1:(sze(1,1))
                fprintf(fid,'\n r %d\n',k);
                fprintf(fid,'%d \n',strctImgs(k,j,i));
            end
        end
    end
    fclose(fid);
    
     
    
    
        