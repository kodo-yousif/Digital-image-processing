function newCtx = histogramMatching(ctx)

    try
        firstRow = ctx(1,:);
        lastRow = ctx(end,:);

        firstImage = firstRow{1};
        lastImage = lastRow{1};
        
        if size(firstImage,3) == 3
           firstImage = rgb2gray(firstImage);
        end
        
        newCtx = [ctx;{ imhistmatch(lastImage,firstImage), 'show',"Histogram Equalization"}];
    catch 
        newCtx = ctx;
    end


end