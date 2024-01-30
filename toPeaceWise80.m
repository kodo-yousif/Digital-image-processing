function newCtx = toPeaceWise80(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        for x = 1:size(lastIamge,1)
           
            for y = 1:size(lastIamge,2)
        
                if lastIamge(x,y) < 80
                    lastIamge(x,y) = 0;
                end
            end
        end
        
        newCtx = [ctx; {lastIamge, 'show',"Peace Wise 80"}];
    catch
        newCtx = ctx;
    end


end