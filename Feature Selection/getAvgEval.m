function Avg = getAvgEval(evals)
   Avg = struct;
   Avg.accuracy = 0;
   Avg.sensitivity = 0;
   Avg.specificity = 0;
   Avg.precision = 0;
   Avg.recall = 0;
   Avg.f_measure = 0;
   Avg.gmean = 0;
   Avg.accuracy = 0;
   Avg.balance = 0; 
   
   len = length(evals);
for i=1:len
   Avg.accuracy = Avg.accuracy + evals{i}.accuracy;
   Avg.sensitivity = Avg.sensitivity + evals{i}.sensitivity;
   Avg.specificity = Avg.specificity + evals{i}.specificity;
   Avg.precision = Avg.precision + evals{i}.precision;
   Avg.recall = Avg.recall + evals{i}.recall;
   Avg.f_measure = Avg.f_measure + evals{i}.f_measure;
   Avg.gmean = Avg.gmean + evals{i}.gmean ;
   Avg.balance = Avg.balance + evals{i}.balance; 
end

   Avg.accuracy = Avg.accuracy / len;
   Avg.sensitivity = Avg.sensitivity / len;
   Avg.specificity = Avg.specificity / len;
   Avg.precision = Avg.precision / len;
   Avg.recall = Avg.recall / len;
   Avg.f_measure = Avg.f_measure / len;
   Avg.gmean = Avg.gmean / len;
   Avg.balance = Avg.balance / len;

end