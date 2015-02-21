load('mnist_all.mat');
input_layer_size = 784;
hidden_layer_size = 100;
output_layer_size = 1;

X = [train3;train8];


y3 = zeros(size(train3, 1),1 );
y3 = y3 + 3;



y8 = zeros(size(train8, 1),1 );
y8 = y8 + 8;



y = [y3;y8];

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
%end  
for i=1:25
	shuffledArray = Xy(randperm(size(Xy,1)),:);
%i
	Xmod = shuffledArray((1:500),(1:784));
	ymod = shuffledArray((1:500),785); 
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

ytest3 =  zeros(size(test3, 1),1 );
ytest3 = ytest3 + 3;
ytest8 =  zeros(size(test8, 1),1 );
ytest8 = ytest8 + 8;
ytest = [ytest3;ytest8];
xtest = [test3;test8];

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



