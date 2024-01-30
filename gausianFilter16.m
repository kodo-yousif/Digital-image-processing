function newCtx = gausianFilter16(ctx)

    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};

        filter = 1/16 * [1 2 1; 2 4 2; 1 2 1];

        newCtx = [ctx;{ uint8(conv2(double(lastImage), filter, 'same')), 'show',"Gausian Filter 16"}];
    catch 
        newCtx = ctx;
    end


end