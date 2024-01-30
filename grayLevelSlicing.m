function newCtx = grayLevelSlicing(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        for x = 1:size(lastIamge,1)
           
            for y = 1:size(lastIamge,2)
        
                if lastIamge(x,y) < 76 & lastIamge(x,y) > 27
                    lastIamge(x,y) = 255;
                end
            end
        end
        
        newCtx = [ctx; {lastIamge, 'show',"Gray Level Slicing"}];
    catch
        newCtx = ctx;
    end


end