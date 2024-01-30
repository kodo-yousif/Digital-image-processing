function newCtx = logTransform(ctx,c)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        doubleValue = im2double(lastIamge);
        
        newCtx = [ctx; {c * (log(doubleValue + 1)), 'show',"Log Transform Image"}];
    catch
        newCtx = ctx;
    end


end