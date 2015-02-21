
V = importdata('vocab.txt');
c=importdata('classes');

train_size = [1000 2000 3000 4000 5000 5784];
avg_accuracies = [0 0 0 0 0 0 ];
all_cp = zeros((size(V,1)),(size(c,1)));

file_train = 'train1.txt train2.txt train3.txt train4.txt train5.txt';
file_train = strsplit(file_train,' ');
file_test = 'test1.txt test2.txt test3.txt test4.txt test5.txt';
file_test = strsplit(file_test,' ');

for ff=1:5

for z=1:6
all_cp = zeros((size(V,1)),(size(c,1)));

t_size = 0;

f = fopen(file_train{ff})
no_of_docs = 0;
prior = zeros(length(c),1);

while ~feof(f)

	if(t_size>train_size(z))
		break;
	end
	t_size = t_size+1;
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
f1 = fopen(file_test{ff});
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


fclose(f);
fclose(f1);

avg_accuracies(z) = avg_accuracies(z) + count/no_tests

end

ff
end

avg_accuracies = avg_accuracies/5;
avg_accuracies = avg_accuracies*100;

plot(train_size,avg_accuracies);
xlabel('training size');
ylabel('average accuracy');




