% Hui Li, Xiao-Jun Wu. 
% Infrared and visible image fusion based on a deep decomposition method.

% load models
load('./models/L_8.mat');
load('./models/L_16.mat');

% 0 - distinct, 1 - overlapping
is_overlap = 1;

% fusion strategy with different norms - l1, nu
% norm = 'l1';
norm = 'nu';

% different project matriices
% image patch - 8*8, the size of L is 64*64
L = L_8;
unit = 8; 
% image patch - 16*16, the size of L is 256*256
% L = L_16;
% unit = 16;

% jj - the level of decomposition, in our paper is 1 to 4
for jj=1:4
    str_t = ['L',num2str(unit),'- level ',num2str(jj)];
    disp(str_t);
    de_level = jj;

    index = 2;
    path1 = ['./IV_images/IR',num2str(index),'.png'];
    path2 = ['./IV_images/VIS',num2str(index),'.png'];
    fuse_path = ['./fused/fused',num2str(index),'_latlrr_L',num2str(unit),'_level_',num2str(de_level),'_',norm,'_vector_overlap.png'];

    % Fusion
    tic
    F = fusion_method(path1, path2, L, unit, de_level, norm, is_overlap);
    toc
    % figure;imshow(F);
    imwrite(F,fuse_path,'png');

end
