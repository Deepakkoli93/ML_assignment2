load('mnist_all.mat');
input_layer_size = 784;
hidden_layer_size = 100;
output_layer_size = 10;

X = [train0;train1;train2;train3;train4;train5;train6;train7;train8;train9];

y0 = zeros(size(train0, 1),1 );
y0 = y0 + 0;

y1 = zeros(size(train1, 1),1 );
y1 = y1 + 1;


y2 = zeros(size(train2, 1),1 );
y2 = y2 + 2;

y3 = zeros(size(train3, 1),1 );
y3 = y3 + 3;

y4 = zeros(size(train4, 1),1 );
y4 = y4 + 4;

y5 = zeros(size(train5, 1),1 );
y5 = y5 + 5;

y6 = zeros(size(train6, 1),1 );
y6 = y6 + 6;

y7 = zeros(size(train7, 1),1 );
y7 = y7 + 7;

y8 = zeros(size(train8, 1),1 );
y8 = y8 + 8;

y9 = zeros(size(train9, 1),1 );
y9 = y9 + 9;

y = [y0;y1;y2;y3;y4;y5;y6;y7;y8;y9];

Xy = [X y];
shuffledArray = Xy(randperm(size(Xy,1)),:);

X = shuffledArray(:,(1:784));
y = shuffledArray(:,785);

%theta1 = zeros(hidden_layer_size, input_layer_size + 1);
%theta2 = zeros(output_layer_size, hidden_layer_size + 1);

%somehow initialze thetas
initial_Theta1 = init_weights(input_layer_size, hidden_layer_size);
initial_Theta2 = init_weights(hidden_layer_size, output_layer_size);
theta1 = initial_Theta1;
theta2 = initial_Theta2;


totalcost=100;
min_cost=10000000;
epsilon=0.1;
num_iter = 20;
alpha = 1;
j=1;
for j=1:num_iter
alpha = (1/sqrt(j));
j
totalcost
%if (totalcost < min_cost)
%min_cost = totalcost
%nn_params = thetas;
%end  
for i=1:60
	shuffledArray = Xy(randperm(size(Xy,1)),:);
%i
	Xmod = shuffledArray((1:1000),(1:784));
	ymod = shuffledArray((1:1000),785); 
  [J grad1 grad2] = cost(theta1,theta2, input_layer_size, hidden_layer_size, output_layer_size, Xmod, ymod);
  theta1 = theta1 - alpha*grad1;
  theta2 = theta2 - alpha*grad2;


  totalcost = J;
  %J

  %grad
  %pause;
  end


  end


pred = predict(theta1, theta2, X);

%fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

ytest0 =  zeros(size(test0, 1),1 );
ytest0 = ytest0 + 0;
ytest1 =  zeros(size(test1, 1),1 );
ytest1 = ytest1 + 1;
ytest2 =  zeros(size(test2, 1),1 );
ytest2 = ytest2 + 2;
ytest3 =  zeros(size(test3, 1),1 );
ytest3 = ytest3 + 3;
ytest4 =  zeros(size(test4, 1),1 );
ytest4 = ytest4 + 4;
ytest5 =  zeros(size(test5, 1),1 );
ytest5 = ytest5 + 5;
ytest6 =  zeros(size(test6, 1),1 );
ytest6 = ytest6 + 6;
ytest7 =  zeros(size(test7, 1),1 );
ytest7 = ytest7 + 7;
ytest8 =  zeros(size(test8, 1),1 );
ytest8 = ytest8 + 8;
ytest9 =  zeros(size(test9, 1),1 );
ytest9 = ytest9 + 9;
ytest = [ytest0;ytest1;ytest2;ytest3;ytest4;ytest5;ytest6;ytest7;ytest8;ytest9];
xtest = [test0;test1;test2;test3;test4;test5;test6;test7;test8;test9];

Xy_test = [xtest ytest];
Xy_test = Xy_test(randperm(size(Xy_test,1)),:);

X_test = Xy_test(:,(1:784));
y_test = Xy_test(:,785);

pred = predict(theta1, theta2, X_test);
count1 = 0;
count2 = 0;
for i=1:length(pred)
  count1 = count1 + 1;
if(pred(i) == y_test(i))
  count2 = count2+1;
end
end

accuracy = (count2/count1)*100;

















