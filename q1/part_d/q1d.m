[labels_train,train_matrix] = libsvmread('q1d_data/features_train.txt');
[labels_test,test_matrix] = libsvmread('q1d_data/features_test.txt');
[labels_train_small,train_matrix_small] = libsvmread('q1d_data/features_train_small.txt');

% for liner kernel

model_linear_train = svmtrain(labels_train,train_matrix,'-t 0 -c 1');
[pred1,accuracy1,dv1] = svmpredict(labels_test,test_matrix,model_linear_train);

model_linear_train_small = svmtrain(labels_train_small,train_matrix_small,'-t 0 -c 1');
[pred2,accuracy2,dv2] = svmpredict(labels_test,test_matrix,model_linear_train_small);


% for gaussian kernel
model_gaussian_train = svmtrain(labels_train,train_matrix,'-t 2 -g 0.00025 -c 1');
[pred3,accuracy3,dv3] = svmpredict(labels_test,test_matrix,model_gaussian_train);

model_gaussian_train_small = svmtrain(labels_train_small,train_matrix_small,'-t 2 -g 0.00025 -c 1');
[pred4,accuracy4,dv4] = svmpredict(labels_test,test_matrix,model_gaussian_train_small);


