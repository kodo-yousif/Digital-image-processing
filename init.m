ctx = cell(0,4);

image3 = imread('t3.png');


ctx = [ctx;{ image3, 'show', "skip"}];


ctx = gammaTransform(ctx,1,3);

showCtx(ctx);