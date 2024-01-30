function newCtx = phase(ctx)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};

        f = fft2(lastImage);
        
        phase = angle(f);
        
        phaseOnlyImage = ifft2(exp(1i*phase));
        
        normalizedImage = mat2gray(real(phaseOnlyImage));
        
        uintImage = im2uint8(normalizedImage);
        
        newCtx = [ctx;{ uintImage , 'show', "Phase-Only Image"}];
        
        
    catch         
        newCtx = ctx;
    end


end