function newCtx = grayLevelReselution(ctx,bit)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        quantized_image = uint8(floor(double(lastIamge) / 2^(8-bit)));
        
        newCtx = [ctx;{ uint8(quantized_image * 2^(8-bit)) , 'show',"gray level reselution bits: " + bit}];
    catch 
        newCtx = ctx;
    end


end