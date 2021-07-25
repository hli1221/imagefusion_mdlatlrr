% function analysis_main_infrared_average
clear all
clc

disp('----------analysis_main_infrared_average testing dataset------------');
addpath('./vif');

fileName_source_l = 'IR image path'; % IR image
fileName_source_r = 'VIS image path'; % VIS image

fileName_fused = 'fused image path';

% 融合结果
fused_image = imread(fileName_fused);
% 输入图
sourceTestImage1 = imread(fileName_source_l);
sourceTestImage2 = imread(fileName_source_r);
if size(sourceTestImage1,3)>1
    sourceTestImage1 = rgb2gray(sourceTestImage1);
end
if size(sourceTestImage2,3)>1
    sourceTestImage2 = rgb2gray(sourceTestImage2);
end
tic

metrics = analysis_Reference(fused_image,sourceTestImage1,sourceTestImage2);
matrix_images = [metrics.EN, metrics.MI, metrics.SD, metrics.Qabf, metrics.FMI_pixel,...
    metrics.FMI_w, metrics.SSIM, metrics.MS_SSIM, metrics.VIF, metrics.EPI];
str_temp2 = ['Metrics values:', str(matrix_images)];
disp(str_temp2);

















