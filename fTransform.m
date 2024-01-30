function newCtx = fTransform(ctx)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};

        f = fft2(lastImage);
        
        shift = fftshift(f);
        
        im = log(1 + abs(shift));
        
        im = im - min(im(:)); 
        im = im / max(im(:)); 

        im_uint8 = uint8(255 * im);
        
        newCtx = [ctx;{ f , 'show', "fourier Transform"}];
        
        newCtx = [newCtx;{ shift , 'show', "shifted fourier Transform"}];
        
        newCtx = [newCtx;{ im_uint8 , 'show', "magnatiud fourier Transform"}];
        
        newCtx = [newCtx;{ lastImage , 'skip', "skip"}];
        
    catch 
        newCtx = ctx;
    end


end