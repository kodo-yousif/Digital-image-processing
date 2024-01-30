function newCtx = averageFilter(ctx,size)

    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};

        filter = 1/(size*size) * ones(size, size);

        newCtx = [ctx;{ uint8(conv2(double(lastImage), filter, 'same')), 'show',"average Filter: " + size}];
    catch 
        newCtx = ctx;
    end


end