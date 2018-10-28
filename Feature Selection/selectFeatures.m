function [selectedFeatures, quantization,finalgain]= selectFeatures(tr_fea, tr_label, max_qua_level)
    [m, n] = size(tr_fea);
combination =1;

    info = getInfoOfPairs(tr_fea, tr_label, max_qua_level, combination);
%comment this part for running for only MI feature_STart
        helinger=[]; 
        helinger = extractfield(info, 'tfidf');
        helinger(isnan(helinger))=0;
        helinger(isinf(helinger))=0;
        scaled_helinger= (helinger-min(helinger))/(max(helinger)-min(helinger));
        
        t = num2cell(scaled_helinger);
        [info.tfidf] = t{:};   

        mahals= [];
        mahals = extractfield(info, 'tfidf2');  
        mahals(isnan(mahals))=0;
        mahals(isinf(mahals))=0;
        scaled_mahals=[];
        scaled_mahals=(mahals-min(mahals))/(max(mahals)-min(mahals));
        t = num2cell(scaled_mahals);
        [info.tfidf2] = t{:};
%comment this part for running for only MI feature_End
    Acell = struct2cell(info);
    sz = size(Acell);            
    % Convert to a matrix
    Acell = reshape(Acell, sz(1), []);      % Px(MxN)
    % Make each field a column
    Acell = Acell';    
    B=cell2mat(Acell);
    B(find(B(:,end)==0),:)=[];
%     C=[B(:,1) -B(:,2) -B(:,3)];
    C= -B(:,1:end-1);
%     C=[-B(:,1) -B(:,2)];

    [A membership]=prtp(C);
    
% % % % % % % % % 
   x=1:size(membership,2);
  figure;
  plot(x,B(membership,1),'>',x,B(membership,2),'--',x,B(membership,3), '-o', x, B(membership,4),'-s');
%   figure;plot(B(:,2));

    selectedFeatures = [];
    quantization = [];
    quantization = B(membership,1);          
    selectedFeatures = B(membership,end);
    finalgain=0;

end
