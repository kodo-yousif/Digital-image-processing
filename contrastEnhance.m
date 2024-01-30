function newCtx = contrastEnhance(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};
        
        newCtx = [ctx;{ imadjust(lastIamge), 'show',"Contrast Enhance"}];
    catch 
        newCtx = ctx;
    end


end