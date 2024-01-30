function newCtx = toPeaceWiseRule(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        for x = 1:size(lastIamge,1)
           
            for y = 1:size(lastIamge,2)
                
                if lastIamge(x,y) < 101
                    lastIamge(x,y) = 2 * lastIamge(x,y);
                elseif lastIamge(x,y) > 200
                     lastIamge(x,y) = 255;
                end
                
            end
        end
        
        newCtx = [ctx; {lastIamge, 'show',"Peace Wise Rule"}];
    catch
        newCtx = ctx;
    end


end