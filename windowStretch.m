function newCtx = windowStretch(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = uint16(lastRow{1});

        for x = 1:size(lastIamge,1)
           
            for y = 1:size(lastIamge,2)
                if lastIamge(x,y) < 76 & lastIamge(x,y) > 27 
                    lastIamge(x,y) = ((227 * lastIamge(x,y)) - 5040)/47 ;
                end
                
            end
        end
        
        newCtx = [ctx; {uint8(lastIamge), 'show',"window sretch Rule"}];
    catch
        newCtx = ctx;
    end


end