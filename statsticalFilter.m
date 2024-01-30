function newCtx = statsticalFilter(ctx,type,size)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};

        kernal = ones(size,size);
        
        filtered = lastImage;
        
        if type == "min"
            filtered = ordfilt2(lastImage, 1, kernal);
        end
        
        if type == "max"
            filtered = ordfilt2(lastImage, 9, kernal);
        end
        
        if type == "median"
            filtered = ordfilt2(lastImage, 5, kernal);
        end
        
        newCtx = [ctx;{ filtered , 'show', type + " Noise"}];
    catch 
        newCtx = ctx;
    end


end