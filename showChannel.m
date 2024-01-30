function newCtx = showChannel(ctx, channel, isColored)

    chan = 0 ;
    
    if channel == 'r'
      chan = 1;  
      channel = "red channel";
    end
    
    if channel == 'g'
      chan = 2;  
      channel = "green channel";
    end
    
    if channel == 'b'
      chan = 3;  
      channel = "blue channel";
    end

    try
        lastRow = ctx(end,:);

        lastIamge = lastRow{1};

        im = lastIamge(:,:,chan);
        
        if isColored
           
            if channel == "red channel"
                redChannel = lastIamge(:, :, 1);
                redImage = cat(3, redChannel, zeros(size(redChannel)), zeros(size(redChannel)));
                im = redImage;
            end
            
            if channel == "green channel"
                greenChannel = lastIamge(:, :, 2);
                greenImage = cat(3, zeros(size(greenChannel)), greenChannel, zeros(size(greenChannel)));
                im = greenImage;
            end
            
            if channel == "blue channel"
                blueChannel = lastIamge(:, :, 3);
                blueImage = cat(3, zeros(size(blueChannel)), zeros(size(blueChannel)), blueChannel);
                im = blueImage;
            end
            
            channel = channel + " colored";
            
        end
        
        
        addedImage  = [ctx; {im, 'show', channel}];
        
        if isColored
          addedImage =  [addedImage; {lastIamge, 'skip', "skip"}];
        end
        
        newCtx = addedImage;
    catch
        newCtx = ctx;
    end


end