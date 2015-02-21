function p = predict(Theta1, Theta2, X)

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

h1 = sigmoid(double([ones(m, 1) X]) * double(Theta1'));
h2 = sigmoid(double([ones(m, 1) h1]) * double(Theta2'));
[dummy_var, p] = max(h2, [], 2);
%for i=1:length(h2)
%if(h2(i,1)>0.5)
%p(i)=3;
%else
%p(i)=8;
%end;
%end;

p = p-1;
end
