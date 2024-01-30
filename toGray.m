function newCtx = toGray(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        newCtx = [ctx; {rgb2gray(lastIamge), 'show',"Gray Image"}];
    catch
        newCtx = ctx;
    end


end