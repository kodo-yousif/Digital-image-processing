function newCtx = catStretch(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = uint16(lastRow{1});

        for x = 1:size(lastIamge,1)
           
            for y = 1:size(lastIamge,2)
                if lastIamge(x,y) < 80
                    lastIamge(x,y) = 0 ;
                elseif lastIamge(x,y) < 180
                    lastIamge(x,y) = 255 ;
                else
                    lastIamge(x,y) = ( (lastIamge(x,y) - 80) * 255 ) / 100 ;
                end
                
            end
        end
        
        newCtx = [ctx; {uint8(lastIamge), 'show',"cat sretch Rule"}];
    catch
        newCtx = ctx;
    end


end