function [J, grad1, grad2] = cost(theta1,theta2, input_layer_size, hidden_layer_size, output_layer_size, X, y)

m = size(X, 1);

%theta1 = reshape(thetas(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

%theta2 = reshape(thetas((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
Theta1_grad = zeros(size(theta1));
Theta2_grad = zeros(size(theta2));

X = [ones(m, 1) X];
X = double(X);
theta1 = double(theta1);
theta2 = double(theta2);
temp1 = sigmoid(X * transpose(theta1));


temp1 = [ones(m, 1) temp1];
hypothesis = sigmoid(temp1 * transpose(theta2));
sum=0;
for i=1:m
	y_i=transpose((1:output_layer_size))==(y(i)+1);
%if(y(i)==3)
%		y_i = 1;
%	else 
%		y_i = 0;
%	end
	for k=1:output_layer_size
		%sum=sum+(-y_i(k)*log(hypothesis(i,k)))-((1-y_i(k))*log(1-hypothesis(i,k)));
		sum = sum + (0.5)*norm(y_i - hypothesis(i,k))^2;

	end
end

sum = sum/m;


J=sum;



temp1 = X * transpose(theta1);
gz_2 = transpose(siggrad(temp1));

for i=1:m

	a_1 = transpose(X(i,:));
	%a_1 = [1;a_1];
	z_2 = theta1 * a_1;
	a_2 = sigmoid(z_2);
	a_2 = [1;a_2];
	z_3 = theta2 * a_2;
	a_3 = sigmoid(z_3);

	%y_k = y_i;
	y_k = [1:output_layer_size]==(y(i)+1);
	y_k = transpose(y_k);
	%if(y(i)==3)
	%	%y_k = [1;0];
	%	y_k = 1;
	%else 
	%	%y_k = [0;1];
	%	y_k = 0;
	%end
	delta_3 = a_3 - y_k;

	delta_2 = (transpose(theta2)*delta_3) .* (siggrad([1;z_2]));
	delta_2 = delta_2(2:end);

	Theta1_grad = Theta1_grad + delta_2*transpose(a_1);
	Theta2_grad = Theta2_grad + delta_3*transpose(a_2);

end
Theta1_grad = Theta1_grad ./ m;
Theta2_grad = Theta2_grad ./ m;


grad1 = Theta1_grad;
grad2 = Theta2_grad;
end
