function newCtx = morph(ctx, type)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};
        
        img = im2bw(lastImage);
        
        se = strel('disk', 5);
        
        if type == "dilation"
            res = imdilate(img, se);
        elseif  type == "erosion"
            res = imerode(img, se);
        end
        
        newCtx = [ctx;{ img , 'show', "black and white image"}];
        
        newCtx = [newCtx;{ res , 'show', "eroded image"}];
        
        newCtx = [newCtx;{ lastImage , 'skip', "skip"}];
        
    catch e
        e
        newCtx = ctx;
    end


end