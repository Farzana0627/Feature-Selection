function [t,m,rr] = GetConfusionMatrix(aVector1, aVector2, aNClass)
    m = zeros(aNClass, aNClass);
    rr= zeros(aNClass,3);
    nItems = length(aVector1);
    for i=1:nItems
        m(aVector1(i), aVector2(i)) = m(aVector1(i), aVector2(i)) + 1;
    end;
    
    A=m(1,1);
    C=m(1,2);
    B=m(2,1);
    D=m(2,2);
    pd=A/(A+C);
    pf=B/(B+D);
    p=A/(A+B);
    r=A/(A+C);
    bal=(1-sqrt((1- pd^2)+pf^2)/2^0.5)* 100;
    fscore=(2*(p*r)/(p+r))* 100;
%     fid = fopen('editor accuracy.txt', 'a');
%     fprintf(fid,'balance: %d %f \n', bal);
%      for i = 1:aNClass
% %         sum(m(i, :))
% %         m(i, :)
%     end;
    t=m;
    m
    for i = 1:aNClass
        
        pr=m(i, i)/sum(m(i, :));
        if sum(m(:, i))==0
        r=m(i, i)/(sum(m(:, i))+1);
        else
            r=m(i, i)/(sum(m(:, i)));
        end
        if pr==0 & r ==0
            fscore=0;
        else
        fscore=2*pr*r/(pr+r);
        end
        rr(i,1)=pr;
        rr(i,2)=r;
        rr(i,3)=fscore;
%         m(i, :) = m(i, :)/sum(m(i, :));
        
    end; 
    for i = 1:aNClass
        
        m(i, :) = m(i, :)/sum(m(i, :));
        
    end;
    
   
end