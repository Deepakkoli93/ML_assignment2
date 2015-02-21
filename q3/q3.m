%X = importdata('train1.txt');
%no_of_docs = size(X,1);
V = importdata('vocab.txt');
c=importdata('classes');
%shuffledArray = X(randperm(size(X,1)),:);
%train = X(1447:end,:);
%test = X(1:1446,:);

all_cp = zeros((size(V,1)),(size(c,1)));


%for z=1:size(c,1)
%	cur_class=z;
%	c(z)
%	cp = all_cp(:,z);
%	for i=1:size(train,1)
%		if(mod(i,100)==0)
%			i
%		end
%		a = train(i);
%		a = strsplit(a{1},' ');
%		 now a has the i_th line. 
%		 b will have the class label
%		b = strsplit(a{1},'\t');
%
%		 no concateneting b(2) with a
%		a = a(:,2:end);
%		a = [b(2) a];
%
%		if(strcmp(b(1),cur_class)) 
%		 for j=1:size(a,2)
%		 	[tf,loc] = ismember(a(j),V);
%		 	if(tf==1)
%		 		cp(loc) = cp(loc)+1;
%		 	end
%		 end
%		end
%
%	end
%all_cp(:,z) = cp;
%end


f = fopen('train5.txt')
no_of_docs = 0;
prior = zeros(length(c),1);
while ~feof(f)

	no_of_docs = no_of_docs + 1;
	%cur_class = c(z);
	%c(z)
	%cp = all_cp(:,z);
	line = fgetl(f);
	line = strsplit(line, ' ');
	[cl,loc] = ismember(line(1),c);
	prior(loc) = prior(loc) + 1;
	line = line(:,2:end);
	for i=1:length(line)
		all_cp(str2num(line{i}),loc) = all_cp(str2num(line{i}),loc) + 1;
	end
end

prior = prior./repmat(no_of_docs,size(prior,1),1);

cp = all_cp + ones(size(all_cp,1),size(all_cp,2));

vocab_size = size(V,1)
den = sum(cp) + transpose(repmat(vocab_size,size(cp,2),1));

cp = cp./repmat(den,size(cp,1),1);

% testing 

%count has no of correct classifications
count = 0;
no_tests = 0;
f1 = fopen('test5.txt');
while ~feof(f1)
no_tests = no_tests + 1;
line = fgetl(f1);
line = strsplit(line, ' '); 
actual_label = line(1);
score = zeros(size(c,1),1);
score = transpose(log(prior));

line = line(:,2:end);
for i=1:length(line)
score = score + log(cp(str2num(line{i}),:));
end

[prob predict_class_index] = max(score);
if(strcmp(c{predict_class_index},actual_label))
count = count + 1;
end
end










