function newCtx = toNegative(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        newCtx = [ctx; { 255 - lastIamge, 'show', "Negative Image"}];
    catch
        newCtx = ctx;
    end


end