% Edge preservation index created on 28-11-2017, R.Sudhakar
% equation through paper from Farook Sataar, IEEE transactions on IP vol 6 no 6 June 1997

function epi = analysis_EPI(o, f)
% input:
%   o - original image
%   f - fused image
% output:
%   epi - Edge preservation index

% a high pass laplacian filter is created
H = fspecial('laplacian',0.5) ;
% input image is highpass filtered with laplacian filter
deltas=imfilter(o,H);
meandeltas=mean2(deltas);

% Restored Image is highpass filtered with laplacian filter
deltascap=imfilter(f,H);
meandeltascap=mean2(deltascap);

% computation of EPI
p1=deltas-meandeltas;
p2=deltascap-meandeltascap;

num=sum(sum(p1.*p2));
den=(sum(sum(p1.^2)))*(sum(sum(p2.^2)));
epi=num/sqrt(den);

end


