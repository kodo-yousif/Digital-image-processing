function newCtx = fPass(ctx, filterType, type, D0)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};
        
        F = fft2(double(lastImage));
        F_centered = fftshift(F);

        [M, N] = size(F_centered);

        filter = zeros(M, N);

        
   
                
        if type == "ideal"
            for u = 1:M
                for v = 1:N
                    D = sqrt((u-M/2)^2 + (v-N/2)^2);
                    if D <= D0
                        filter(u, v) = 1;
                    end
                end
            end
        end
        
        if type == "butter"
            n = 2;  
            for u = 1:M
                for v = 1:N
                    D = sqrt((u-M/2)^2 + (v-N/2)^2);
                    filter(u, v) = 1 / (1 + (D/D0)^(2*n));
                end
            end
        end
        
        
        if type == "gaussian"
            for u = 1:M
                for v = 1:N
                    D = sqrt((u-M/2)^2 + (v-N/2)^2);
                    filter(u, v) = exp(-(D^2) / (2 * (D0^2)));
                end
            end
            
        end
        


        if filterType == "high-pass"
           filter = 1 - filter; 
        else
            filterType = "low-pass";
        end

        
        
        
        F_filtered = F_centered .* filter;

        F_final = ifftshift(F_filtered);
        img_filtered = ifft2(F_final);
        

        normalizedImage = mat2gray(real(img_filtered));

        uintImage = im2uint8(normalizedImage);

        
        newCtx = [ctx ;{ filter , 'surf', "Filter 2D"}];
        
        newCtx = [newCtx ;{ filter , 'show', "Filter 3D"}];
        
        newCtx = [newCtx;{ uintImage , 'show', filterType + " Filter D0:" + D0}];
        
    catch 
        newCtx = ctx;
    end


end