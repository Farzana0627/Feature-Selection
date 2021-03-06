function h = mutualinfo(vec1,vec2,qua)
%=========================================================
%
%This is a prog in the MutualInfo 0.9 package written by 
% Hanchuan Peng.
%
%Disclaimer: The author of program is Hanchuan Peng
%      at <penghanchuan@yahoo.com> and <phc@cbmv.jhu.edu>.
%
%The CopyRight is reserved by the author.
%
%Last modification: April/19/2002
%
%========================================================
%
% h = mutualinfo(vec1,vec2)
% calculate the mutual information of two vectors
% By Hanchuan Peng, April/2002
%
% edges = cell(size(vec1,2),1);
% 
% for ii=1:size(edges,1)
%     edges{ii}=zeros(qu(ii)+1,1);
% end
% 
% % Compute feature-specific quantization bins so that each bin has approximately equal number of
% % samples in the training set
% for k = 1:size(vec1,2)
%     
%     minval = min(vec1(:,k));
%     maxval = max(vec1(:,k));
%     if minval==maxval
%         continue;
%     end
%     
%     quantlevels = minval:(maxval-minval)/500:maxval;
%     
%     N = histc(vec1(:,k),quantlevels);
%     
%     totsamples = size(vec1,1);
%     
%     N_cum = cumsum(N);
%     
% %     edges(k,1) = -Inf;
% edges{k}(1) = -Inf;
%     
% %     stepsize = totsamples/Q;
%     stepsize = totsamples/qua(k);
%     
% %     for j = 1:Q-1
% for j = 1:qua(k)-1
%         a = find(N_cum > j.*stepsize,1);
%         edges{k}(j+1) = quantlevels(a);
%     end
%     
%     edges{k}(j+2) = Inf;
% end
% 
% % Quantize data according to the obtained bins
% S = zeros(size(vec1));
% for k = 1:size(S,2)
% %     S(:,k) = quantize(features(:,k),edges(k,:))+1;   
%     S(:,k) = quantize(vec1(:,k),edges{k}')+1;   
% end
% 
% ss= length(unique(vec2));
% [m n] = size(vec1);
% correction = (ss-1)(qua-1)/ 2*m*log
[p12, p1, p2] = estpab(vec1,vec2);
if sum(sum(p12)>0)< size(p12,2)|sum(sum(p12,2)>0)< size(p12,1)
    sum(sum(p12)>0)<size(p12,2)
    end
h = estmutualinfo(p12,p1,p2);


