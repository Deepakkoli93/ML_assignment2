Xy = load('features.txt');
y = Xy(:,1);
X = Xy(:,2:997);

m = size(X,1);

Q = zeros(m,m); 

t = 0.00025;
c = ones(m,1);
for i=1:m
	for j=1:m
		ker = exp(-( (t)*(norm(X(i,:)-X(j,:))^2)  ));
		Q(i,j) = y(i)*y(j)*ker;
	end
end

a1 = ones(m,1);
a1 = -1*a1;

cvx_begin
variable al_new(m,1);
minimize ((0.5)*(transpose(al_new))*Q*al_new + transpose(a1)*al_new );
subject to 
transpose(y)*al_new == 0;
0 <= al_new <= c ;
cvx_end


al_thresholded = al_new;
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



%chossing a s.v. as the maximum
[max_al_thresholded, max_index] = max(al_thresholded);


%alpha_n * y_n n is the number of examples
temp1 = al_thresholded.*y;

%temp2 is the K(x_n, x_m) m is the s.v. chosen

b1 = -10000000
b2 = 10000000

for j=1:m
	if((al_new(j)<1) & (al_new(j)>0.0004))
	if(y(j) == -1)
		temp2 = zeros(m,1);
		for i=1:m
	 	 temp2(i) = exp(-(t)*(norm(X(i,:)-X(j,:))^2));
		end

		temp_b1 = sum(temp1 .* temp2);
		if(temp_b1 > b1)
		 b1 = temp_b1;
		end

	end
	end
end


for j=1:m
	if((al_new(j)<1) & (al_new(j)>0.0004))

	if(y(j) == 1)
		temp2 = zeros(m,1);
		for i=1:m
	 	 temp2(i) = exp(-(t)*(norm(X(i,:)-X(j,:))^2));
		end

		temp_b2 = sum(temp1 .* temp2);
		if(temp_b2 < b2)
		 b2 = temp_b2;
		end

	end
	end
end

b = -((b1+b2)/2);

%b  = zeros(m,1)

the_index = 0;
for z=1:m
if((al_new(z)<1-0.5) & (al_new(z)>0.0004))
	the_index = z;
	break;
	end
	end
for i=1:m
	temp2 = zeros(m,1);
end

for i=1:m
	 	 temp2(i) = exp(-(t)*(norm(X(i,:)-X(the_index,:))^2));
end

b = y(the_index) - sum(temp1.*temp2);





%--------- now testing --------------%
Xy_test = load('features_test.txt');
y_test = Xy_test(:,1);
X_test = Xy_test(:,2:997);

m_test = size(X_test,1);


pred = zeros(m_test,1);

for j=1:m_test
 temp2 = zeros(m,1);
 for i=1:m
  temp2(i) = exp(-(t)*(norm(X(i,:)-X_test(j,:))^2));
 end
 the_val = sum(temp1 .* temp2) + b;

 if(the_val>0)
  pred(j) = 1;
 else
  pred(j) = -1;
 end

end



count = 0;
for i=1:m_test
if(pred(i)==y_test(i))
	count=count+1;
end
end

count






