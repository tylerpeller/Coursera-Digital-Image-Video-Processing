Im1 = [1,-1,1;-1,1,-1;1,-1,1];
FT1=fft2(Im1);

Im2= [1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];
FT2 = fft2(Im2);

Im3 = [2,1,0,1;1,0,0,0;1,0,0,0];
FT3 = fft2(Im3);

pic = im2double(imread('imweek3.jpg'));
LPF = ones(3,3)*1/9;
filtered = imfilter(pic,LPF,"replicate");

% filtered(:,2:2:end)=0;
% filtered(2:2:end,:)=0;

downsampled = filtered(1:2:end,1:2:end);

newIm=zeros(359,479);
newIm(1:2:end,1:2:end) = downsampled(:,:);
Filter2 =  [0.25, 0.5, 0.25; 0.5, 1, 0.5; 0.25, 0.5, 0.25];
Interpolation = imfilter(newIm,Filter2);

MSE = sum(sum((pic - Interpolation).^2))/(359*479);
PSNR = 10*log10(1/MSE);