function showCtx(ctx)
    skip = 0;
    image = 1;
    action = 2;
    label = 3;
    for i = 1:size(ctx, 1)
        row = ctx(i, :); 
        
        if row{action} == "skip"
            skip = skip + 1;
            continue;
        end
        
        if row{action} == "show"
           subplot(3, 4, i-skip);
           imshow(row{image});
           title(row{label}); 
        end
        
        if row{action} == "histogram"
           subplot(3, 4, i-skip);
           imhist(row{image});
           title(row{label}); 
        end
        
        if row{action} == "magnitude"
           subplot(3, 4, i-skip);
           imshow(row{image},[]);
           title(row{label}); 
        end
        
        if row{action} == "surf"
           subplot(3, 4, i-skip);
           surf(row{image});
           shading interp;
           title(row{label}); 
        end

    end
end