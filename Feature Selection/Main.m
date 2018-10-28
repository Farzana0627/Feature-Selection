clear all; close all; clc;
fclose('all');

addpath('Libsvm/matlab');   % Libsvm package is used 
addpath('mi');
cc = power(2,-5); 
number_neighbours=5;
LOO=1;
%paramteres
max_qua_level = 50;
no_of_fold=10;
ts_num_max = 5000;
% tr_num=7;

nclass = 6;
clabel = [1 2 3 4 5 6];
data = dlmread('dermatology_formatted.txt');
% max_qua_level = (size(data,1)-1)/(3*nclass);
% max_qua_level = (size(data,1)-1)/((size(data,2)-1)/2*nclass);

% if max_qua_level<10
%     max_qua_level=10;
% end
% paramteres end

% nclass = 2;
% clabel = [1 2];
% data = dlmread('sonar data lebel first10fold.txt');
% max_qua_level = (size(data,1)-1)/(3*nclass);
% if max_qua_level<10
%     max_qua_level=10;
% end
% % 
% nclass = 6;
% clabel = [1 2 3 4 5 6];
% data = dlmread('glass.txt');
% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=13 ;%
% nclass = 3;
% clabel = [1 2 3];
% data = dlmread('wine.data');
% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=14 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('australian.dat');
% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=9 ;%
% nclass = 6;
% clabel = [1 2 3 4 5 6];
% data = dlmread('BreastTissue.txt');
% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=8 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('pima-indians-diabetes.data');
% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=6 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('bupa.data');

% dim=34 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('ionosphere.data');

% dim=4 ;%
% nclass = 3;
% clabel = [1 2 3];
% data = dlmread('balance-scalev1.txt');
% 
% dim=8 ;%
% nclass = 10;
% clabel = [1 2 3 4 5 6 7 8 9 10];
% data = dlmread('yeast.data');
% max_qua_level = (size(data,1)-1)/(3*nclass);
% if max_qua_level<10
%     max_qua_level=20;
% end


% dim=90 ;%
% nclass = 15;
% clabel = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
% data = dlmread('movement_libras.data');
% max_qua_level = (size(data,1)-1)/(3*nclass);
% if max_qua_level<10
%     max_qua_level=10;
% end
% 
% dim=10 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('magic04.data');
% 
% dim=4 ;%
% nclass = 3;
% clabel = [1 2 3];
% data = dlmread('iris.data');
% % 
% dim=7 ;%
% nclass = 8;
% clabel = [1 2 3 4 5 6 7 8];
% % [xapp,Sapp,total] = adareadFeaturesNEW('ecoli.data',dim); %size
% data = dlmread('ecoli.data');



% dim=21 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('cm1_updated.arff');
% max_qua_level = ceil(size(data,1)-1)/(3*nclass);
% 
% dim=22 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('Parkinsons.txt');

 
% dim=20 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('German.txt');

% dim=278 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('arrhythmia_formatted.txt');

% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=6 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('Liver.txt');

% dim=56 ;%
% nclass = 3;
% clabel = [1 2 3];
% data = dlmread('Lung.txt');
% max_qua_level = (size(data,1)-1)/(3*nclass);


% dim=2400 ;%
% nclass = 10;
% clabel = [1 2 3 4 5 6 7 8 9 10];
% data = dlmread('AR10P.txt');

% dim=9703 ;%
% nclass = 9;
% clabel = [1 2 3 4 5 6 7 8 9];
% data = dlmread('nci.txt');
% max_qua_level = (size(data,1)-1)/(3*nclass);

% dim=57 ;%
% nclass = 2;
% clabel = [1 2];
% data = dlmread('Spambase.txt');




% nclass = 2;
% clabel = [1 2];
% data = dlmread('breast.txt');

% nclass = 2;
% clabel = [1 2];
% data = dlmread('congress(missing_value).txt');

% nclass = 2;
% clabel = [1 2];
% data = dlmread('heart.txt');

% nclass = 6;
% clabel = [1 2 3 4 5 6];% data = dlmread('landsat_train.txt');



% nclass = 2;
% clabel = [1 2];
% data = dlmread('SPECT_train.txt');

% nclass = 4;
% clabel = [1 2 3 4];
% data = dlmread('soybean.txt');

% nclass = 10;
% clabel = [1 2 3 4 5 6 7 8 9 10];
% data = dlmread('splice(unprocessed).txt');

% nclass = 2;
% clabel = [1 2];
% data = dlmread('gisette_train(tab_separated).txt');

% nclass = 2;
% clabel = [1 2];
% data = dlmread('madelon.txt');
% 
% nclass = 7;
% clabel = [1 2 3 4 5 6 7];
% data = dlmread('steel.txt');

% nclass = 10;
% clabel = [1 2 3 4 5 6 7 8 9 10];
% data = dlmread('Semeion.txt');

% nclass = 3;
% clabel = [1 2 3];
% data = dlmread('waveform.txt');

% nclass = 2;%LOO
% clabel = [1 2];
% data = dlmread('dbworld_subjects.txt');
% 
% nclass = 2; %LOO
% clabel = [1 2];
% data = dlmread('dbworld_bodies.txt');

% nclass = 9;
% clabel = [1 2 3 4 5 6 7 8 9];
% data = dlmread('CNAE-9.txt');

% nclass = 10;
% clabel = [1 2 3 4 5 6 7 8 9 10];
% data = dlmread('Cardio.txt');

% nclass = 9; %LOO
% clabel = [1 2 3 4 5 6 7 8 9];
% data = dlmread('lymphoma.txt');

% nclass = 7;
% clabel = [1 2 3 4 5 6 7];
% data = dlmread('Segment.txt');

% nclass = 2;
% clabel = [1 2];
% data = dlmread('musk.txt');





% nclass = 2;
% clabel = [1 2];
% data = dlmread('German.txt');

% Sapp = data(:, 1);
[m, dim] = size(data(:, 2:end));

xa = data(:, 2:end);
Sapp = data(:, 1);
[m, dim] = size(xa);

opts= struct;
opts.att_1split= 2;
opts.quaztization_level= 5;
opts.dim= dim; 

bal=zeros(nclass,3);
t=zeros(nclass,nclass);

for kk=1:no_of_fold 


    
    tr_idx = [];        
    ts_idx = [];
    	for jj = 1:nclass,
        
        idx_label = find(Sapp == clabel(jj));
        num = length(idx_label);
        rng(kk+jj);
        idx_rand = randperm(num);
        tr_num=size(idx_label,1)-ceil(size(idx_label,1)/no_of_fold);
        if num > tr_num + ts_num_max
            tr_idx = [tr_idx; idx_label(idx_rand(1:tr_num))];
            ts_idx = [ts_idx; idx_label(idx_rand(tr_num+1:tr_num+ts_num_max))];
        else
            tr_idx = [tr_idx; idx_label(idx_rand(1:tr_num))];
            ts_idx = [ts_idx; idx_label(idx_rand(tr_num+1:end))];
        end    
    end
    tr_fea1 = zeros(length(tr_idx), dim);
    tr_label = zeros(length(tr_idx), 1);
    ts_fea1 = zeros(length(ts_idx), dim);
    ts_label = zeros(length(ts_idx), 1);
        
     
    tr_fea1 = xa(tr_idx,:);
    tr_label = Sapp(tr_idx);
    ts_fea1 = xa(ts_idx,:);
    ts_label = Sapp(ts_idx);
% tic
%     [selectedFeatures, qua,finalgain]= selectFeatures(data(tr_idx, 2:end), data(tr_idx, 1), max_qua_level);

%     save('kk.mat','selectedFeatures');
% idx=sum(tr_fea1)<=20;
% tr_fea1(:,idx)=[];
    [selectedFeatures, qua,finalgain]= selectFeatures(tr_fea1, tr_label, max_qua_level);

    tr_fea = zeros(length(tr_idx), size(selectedFeatures,1));
    ts_fea = zeros(length(ts_idx),size(selectedFeatures,1));

%         for j = 1:length(selectedFeatures)
%         [tr_fea(:, j)] = data(tr_idx, selectedFeatures(j)+1);
%          ts_fea(:, j) = data(ts_idx, selectedFeatures(j)+1);
%         end
        for j = 1:length(selectedFeatures)
         [tr_fea(:, j)] = tr_fea1(:, selectedFeatures(j));
         ts_fea(:, j) = ts_fea1(:, selectedFeatures(j));
        end


% % %     decision tree
% % % %     model = fitctree(newtr_fea, tr_label);
% % % %     pred_val = predict(model, newts_fea);
% 
model = fitctree(tr_fea, tr_label);
    pred_val = predict(model, ts_fea);
%  model = fitctree(tr_fea, tr_label);
%     pred_val = predict(model, ts_fea);
% % %     decision tree
% % KNN
%     model = fitcknn(tr_fea,tr_label,'NumNeighbors',5);
%     pred_val = predict(model,ts_fea);
% % % % 
% % %     SVM







% % 
%     c_chosen(1) = 1;
% %     options = [ '-s 0 -t 0 ' '-g ' num2str(power(2, -7)) ' -c ' num2str(cc(c_chosen(1)))];      % Libsvm parameter setting (linear SVM is used)
%     options = [ '-t 0 '  ' -c 1' ];      % Libsvm parameter setting (linear SVM is used)
% 
%     model = svmtrain(double(tr_label), sparse(tr_fea), options);                                      
%     clear tr_fea;
%     
%         [C, Acc, d2p] = svmpredict(double(ts_label), sparse(ts_fea), model);                % svm test 
%         clear ts_fea;
%         pred_val=C;
% %     
% % %     SVM     
    

% % % % ds

%             [gamm,alpha] = knndsinit(tr_fea,tr_label);
%             [gamm,alpha,err] = knndsfit(tr_fea,tr_label,number_neighbours,gamm,1); 
%             [med,Led] = knndsval( tr_fea,tr_label,number_neighbours,gamm,alpha,0,ts_fea);
% %             mmmm= ts_label(:,1); 
% % [conf,bal] = GetConfusionMatrix(mmmm,Led,nclass)
%  pred_val=Led;
%%%%




    accuracy = sum(eq(pred_val,ts_label(:,1)))/size(ts_label,1);

    EVAL = EvalMetric(ts_label,pred_val);
% EVAL.balance
    evals{kk} = EVAL;
    accuracies(kk)= accuracy;
    feature(kk) = size(selectedFeatures,1);
[t1,conf,bal1] = GetConfusionMatrix(ts_label,pred_val,nclass);
    fid = fopen('result_new.txt', 'a');
    fprintf('Iter---> %d : accu: %f \n', kk, accuracy);
    fprintf(fid, 'Iter---> %d : accu: %f sel: %d\n', kk, accuracy,size(selectedFeatures,1));
    fclose(fid);
    bal=bal+bal1;
     t=t+t1;
end
% S = kuncheva_stability(featidx,dim)
bal./10
[conf,bal1] = GetConfusionMatrixbug(t,nclass)

Avg = getAvgEval(evals);
fid = fopen('result_new.txt', 'a');
fprintf('avg accu: %f selected: %f\n', mean(accuracies),mean(feature));
fprintf(fid, 'avg accu: %f selected: %f\n', mean(accuracies),mean(feature));
fclose(fid);



fclose('all');