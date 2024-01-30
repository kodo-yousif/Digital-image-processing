function newCtx = showHist(ctx)

    try
        last = size(ctx, 1);
        
        lastRow = ctx(last,:);
        
        for i = size(ctx, 1):-1:1
            
            lastRow = ctx(i,:);
            
            if lastRow{2} == "skip"
                continue;
            end
            
            break;
        
        end
        


        lastLabel = lastRow{3};
        lastIamge = lastRow{1};

        newCtx = [ctx; {lastIamge, 'histogram', lastLabel + " histogram" }];
    catch
        newCtx = ctx;
    end


end