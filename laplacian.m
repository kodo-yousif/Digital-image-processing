function newCtx = laplacian(ctx)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};

        kernal = fspecial('laplacian');

        mask = uint8(imfilter(lastImage, kernal));
        
        newCtx = [ctx;{ mask , 'show', "Laplcian Filter"}];
        
        newCtx = [newCtx;{ lastImage-mask , 'show', "Laplcian Enhanced"}];
    catch 
        newCtx = ctx;
    end


end