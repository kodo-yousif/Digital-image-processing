function newCtx = histogramEqualization(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};
        
        newCtx = [ctx;{ histeq(lastIamge), 'show',"Histogram Equalization"}];
    catch 
        newCtx = ctx;
    end


end