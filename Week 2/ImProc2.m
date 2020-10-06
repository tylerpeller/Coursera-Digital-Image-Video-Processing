pic = imread('pic1.gif');



pic = im2double(pic);
LPF = ones(3,3)*1/9
imshow(pic);


new = imfilter(pic,LPF,'replicate');

Max1 = max(new);
Max2 = max(Max1)

MSE1 = sum(sum((pic - new).^2))/(256^2)
PSNR = 10*log10(1/MSE1)
figure(2);
% new = im2uint8(new);
% imshow((new));


LPF2 = ones(5,5)*(1/25)
figure(3);
new2 = imfilter(pic,LPF2,'replicate');
imwrite (new2, 'pout2.png');
% imshow(new2);
Max3 = max(new2);
Max4 = max(Max3)

MSE2 = sum(sum((pic - new2).^2))/(256^2)
PSNR2 = 10*log10(1/MSE2)
% PSNR__2 = psnr(new,pic,1) 
