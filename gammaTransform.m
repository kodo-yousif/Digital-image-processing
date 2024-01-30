function newCtx = gammaTransform(ctx,c,y)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        doubleValue = im2double(lastIamge);
        
        im = c * (doubleValue .^ y);

        im = im - min(im(:));
        im = im / max(im(:));

        im_uint8 = uint8(255 * im);

        
        newCtx = [ctx; {im_uint8, 'show',"Gamma transform Image"}];
    catch
        
        newCtx = ctx;
    end


end