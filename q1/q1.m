Xy = load('features.txt');
y = Xy(:,1);
X = Xy(:,2:997);

m = size(X,1);

Q = zeros(m,m); 

for i=1:m
	for j=1:m
		Q(i,j) = y(i)*y(j)*X(i,:)*transpose(X(j,:));
	end
end

a1 = ones(m,1);
a1 = -1*a1;
c = ones(m,1);
fprintf('beginning cvx');
pause;


cvx_begin
variable al_new(m,1);
minimize ((0.5)*(transpose(al_new))*Q*al_new + transpose(a1)*al_new);
subject to 
transpose(y)*al_new == 0;
0 <= al_new <=c ;
cvx_end



al_thresholded = al_new;
%al_thresholded = al_new;
%for i=1:length(al_new)
%if(al_new(i)<0.0004)
%	count =count+1;
%	al_thresholded(i)=0;
	
%end
%end

sv=0;
for i=1:length(al_thresholded)
if(not(al_thresholded(i)==0))
	sv = sv + 1;
end
end


temp = al_thresholded.*y;
temp = repmat(temp, 1, size(X,2));
w = sum(temp.*X);



[max_al_thresholded, max_index] = max(al_thresholded);

%finding b by chosong the sv at the above max_index 

%b = (1/y(max_index)) - (w*transpose(X(max_index,:)));
b1 = -10000000
b2 = 10000000
for i=1:length(y)
if(y(i) == -1)
	b1_temp = w*transpose(X(i,:));
	if(b1_temp) > b1
		b1 = b1_temp;
	end 
else
	b2_temp = w*transpose(X(i,:));
	if(b2_temp < b2)
		b2 = b2_temp;
	end
end
end

b = -((b1+b2)/2);

% now testing 

Xy_test = load('features_test.txt');
y_test = Xy_test(:,1);
X_test = Xy_test(:,2:997);

m_test = size(X_test,1);
pred = zeros(m_test,1);

for i=1:m_test

if((w*transpose(X_test(i,:))+b) > 0)
	pred(i) = 1;
else
	pred(i) = -1;
end
end

count = 0;
for i=1:m_test
if(pred(i)==y_test(i))
	count=count+1;
end
end

accuracy = (count/m_test)*100;

%writing alphas to a file
fid = fopen('writeup_linear_cvx_alphas.txt','w');
for i=1:length(al_thresholded)
	if(not(al_thresholded(i)==0))
		fprintf(fid,'%s %d\n',al_thresholded(i),i);
	end
	end

fid = fopen('writeup_linear_cvx_w.txt','w');
for i=1:length(w)
		fprintf(fid,'%f\n',w(i));
	end






