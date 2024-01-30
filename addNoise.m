function newCtx = addNoise(ctx,type)


    try
        lastRow = ctx(end,:);

        lastImage = lastRow{1};
        
        [M, N] = size(lastImage);
        
        noisy_img = lastImage;
        
        if type == "rayleigh"
            b = 0.5;
            noise = b * sqrt(-2 * log(1 - rand(M, N)));
            noisy_img = im2double(lastImage) + noise;
            noisy_img(noisy_img > 1) = 1;
            noisy_img(noisy_img < 0) = 0;
        elseif type == "gamma"
            theta = 0.5;
            k = 2;
            noise = gamrnd(k, theta, M, N);
            noisy_img = im2double(lastImage) + noise;
            noisy_img = max(min(noisy_img, 1), 0);
        elseif type == "exp"
            lambda = 0.5;
            noise = exprnd(1/lambda, M, N);
            noisy_img = im2double(lastImage) + noise;
            noisy_img = max(min(noisy_img, 1), 0);
        elseif type == "uniform"
            minVal = -0.5;
            maxVal = 0.5;
            noise = minVal + (maxVal - minVal) .* rand(M, N);
            noisy_img = im2double(lastImage) + noise;
            noisy_img = max(min(noisy_img, 1), 0);
        else
            noisy_img = imnoise(lastImage,type);
        end
    
        newCtx = [ctx;{ im2uint8(noisy_img) , 'show', type + " Noise"}];
    catch 
        newCtx = ctx;
    end

end