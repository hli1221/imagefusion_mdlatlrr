function metrics = analysis_Reference(image_f,image_l,image_r)

[s1,s2] = size(image_l);
imgSeq = zeros(s1, s2, 2);
imgSeq(:, :, 1) = image_l;
imgSeq(:, :, 2) = image_r;

image1 = im2double(image_l);
image2 = im2double(image_r);
image_fused = im2double(image_f);

metrics.EN = entropy(image_fused);
metrics.MI = analysis_MI(image_l,image_r,image_f);
metrics.SD = analysis_sd(image_fused);
metrics.Qabf = analysis_Qabf(image1,image2,image_fused);
metrics.FMI_pixel = analysis_fmi(image1,image2,image_fused);
metrics.FMI_w = analysis_fmi(image1,image2,image_fused,'wavelet');
SSIM1 = ssim(image_fused,image1);
SSIM2 = ssim(image_fused,image2);
metrics.SSIM = (SSIM1+SSIM2)/2;
[MS_SSIM,t1,t2]= analysis_ms_ssim(imgSeq, image_f);
metrics.MS_SSIM = MS_SSIM;
metrics.VIF = (vifvec(image1, image_fused)+vifvec(image2, image_fused))/2;
metrics.EPI = (analysis_EPI(image1, image_fused)+analysis_EPI(image2, image_fused))/2;

end







