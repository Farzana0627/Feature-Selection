
function info = getInfoOfPairs(tr_fea, tr_label, max_qua_level, combination)

[m,n] = size(tr_fea);
info = [];
tot=sum(sum(tr_fea));
nclass=length(unique(tr_label));
C=unique(tr_label);
size_d=2;
td= [0 1 ]; 
tf=zeros(m,n);
idf=zeros(m,n);
for ii=1:size(tr_fea,1)
    tf(ii,:)=tr_fea(ii,:)./sum(tr_fea(ii,:));
end


for ii=1:size(tr_fea,2)
    idf(:,ii)=log(m/sum(tr_fea(:,ii)>0));
end
% all=tf.*idf;
all1=tf;
all2= idf;
for i=1:n
    mi =  -inf;
    distor= inf;
    temp(1)=0;
    info(i).qua = 0;
     info(i).tfidf = 0;
%      info(i).tfidf3 = 0;
     info(i).tfidf2 = 0;
    info(i).mi = 0;
    info(i).feature = 0;
    no_cls=length(unique(tr_label));
    vCAIM=0;
    
%     disp(i);
    for j=2:2
    [p12, p1, p2] = estpab(tr_fea(:, i),tr_label);
     MI = estmutualinfo(p12,p1,p2);
% % % % % % % % % % % % % % % % % % % % % % % %     

cont_data=[tr_fea(:, i) tr_label];
% if any(cont_data(1,:) > 1);
% start pairwise bhattacharyya, mahalanobis, helinger distance
% bd=0;
% md=0;
% hel=0;
a=(tr_fea(:, i)-min(tr_fea(:, i)))/(max(tr_fea(:, i))-min(tr_fea(:, i)));
cont_data=[a tr_label];
% classA_indices=find(cont_data(:,2)==C(1));
% classA =cont_data((classA_indices));
% mA=mean(classA);
% vA= var(classA);
% sA = sqrt(vA);
% classProbA=length(classA_indices)/length(cont_data);
%                      for mx=2:nclass                                  
%                          
%                          classB_indices=find(cont_data(:,2)== C(mx));
%                          classB =cont_data((classB_indices));                        
%                          mB=mean(classB);                     
%                          vB= var(classB);
%                          sB = sqrt(vB);                        
% %                          BofAB = ((mB-mA)^2)/(sB+sA)/4 + log((sB+sA)/sqrt(sB*sA)/2)/2; 
%                          BofAB = ((mB-mA).^2)./(sB+sA)/4 + log(abs(sB+sA)./sqrt(abs(sB).*abs(sA))/2)/2;
%                          classProbB=length(classB_indices)/length(cont_data);
% %                          z=classProbA*classProbB*BofAB;
%                          MdofAB=mahal(classA,classB);
% %                          X=transpose(classA);
% %                          Y=transpose(classB);
% %                          HelofAB= sqrt(sum ((sqrt(X) - sqrt(Y)) .^ 2))/ sqrt(2);
%                          HelofAB =distHell(classA,classB);
%                          bd = bd+BofAB; 
%                          md = md+sqrt(sum(MdofAB));
%                          hel=hel+sum(HelofAB);
%                          hel= sum(hel);
%                          classProbA=classProbB;
%                          classA=classB;
%                          mA=mB;
%                          vA=vB;
%                          sA=sB;
%                      end
                     
                      for mx=1:nclass                 
                        
                         classA_indices=find(cont_data(:,2)==C(mx));
                         classA =cont_data((classA_indices));
                         mA=mean(classA);
                         vA= var(classA);
                         sA = sqrt(vA);
                         if sA==0
                             sA=1;
                         end
                         if mA==0
                             mA=1;
                         end
                         other_classes=(1:nclass);
                         other_classes(mx)=[];
                         bd_class=0;
                         md_class=0;
                         hel_class=0;
                         for nx=1:nclass-1
                             class_index=other_classes(nx);                          
                             classB_indices=find(cont_data(:,2)== C(class_index));
                             classB =cont_data((classB_indices));                        
                             mB=mean(classB);                     
                             vB= var(classB);
                             sB = sqrt(vB); 
                             if sB==0
                                sB=1;
                             end
                             if mB==0
                                mB=1;
                             end
%                            BofAB = ((mB-mA)^2)/(sB+sA)/4 + log((sB+sA)/sqrt(sB*sA)/2)/2; 
                             BofAB = ((mB-mA).^2)./(sB+sA)/4 + log(abs(sB+sA)./sqrt(abs(sB).*abs(sA))/2)/2;                    
                             MdofAB=mahal(classA,classB);
%                            HelofAB= sqrt(sum ((sqrt(X) - sqrt(Y)) .^ 2))/ sqrt(2);
                             HelofAB =distHell(classA,classB);
                             bd_class = bd_class+BofAB; 
                             md_class = md_class+sqrt(sum(MdofAB));
                             hel_class=hel_class+sum(sum(HelofAB));
                                                                     
                         end
                         bd=bd_class;                       
                         md=md_class;
                         hel=hel_class;
                      end 
                         

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
tfidf= hel;

tfidf1=bd;%%%ok;
tfidf2=md;

        I1= MI;
%         I1 =   I1 -((no_cls-1)*(length(unique(tr_fea(:, i)))-1)/(2*m*log(2)));

        temp_mi_with_class_NORMA =I1;
        
        if temp_mi_with_class_NORMA>mi           
            mi = temp_mi_with_class_NORMA;
        end



%comment this part for running for only MI feature_Start
              info(i).qua = tfidf1; %bhattacharyya               
              info(i).tfidf = tfidf; %helinger
              info(i).tfidf2 = tfidf2; %mahalanobis
%comment this part for running for only MI feature_end
                info(i).mi = temp_mi_with_class_NORMA;
                info(i).feature = i;

        end
    end
    clear F size_F d GlobalCAIM k di_max_caim vCAIM  tabla_q;
    clearvars temp;
end

% 
