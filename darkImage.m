function newCtx = darkImage(ctx)

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        desired_max_intensity = 120;
        
        scaling_factor = double(desired_max_intensity) / double(max(lastIamge(:)));
        
        stretched_image = uint8(double(lastIamge) * scaling_factor);
        
        newCtx = [ctx;{ stretched_image, 'show',"Dark Image"}];
    catch 
        newCtx = ctx;
    end


end