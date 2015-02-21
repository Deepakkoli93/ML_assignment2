x=importdata('20ng-rec_talk.txt');
x = x(randperm(size(x,1)),:);

f=fopen('shuffled_features.txt','w');
for i=1:length(x)
fprintf(f, '%s\n',x{i} );
end
fclose(f);

v = containers.Map();

f1 = fopen('vocab.txt');
num = 0;
while ~feof(f1)
	num = num + 1;
	line = fgetl(f1);
	v(line) = num;
	end

f2 = fopen('shuffled_features.txt');
f3 = fopen('features.txt','w');
line_no=0;
while ~feof(f2)
line_no=line_no+1
line = fgetl(f2);
a = strsplit(line,' ');
b=strsplit(a{1},'\t');
z = v(b{2});
for i=1:length(a)
	if(isKey(v,a{i}))
	z = [z v(a{i})];
	end
end
fprintf(f3, '%s', b{1});
fprintf(f3,' %d',z(1));
z=z(:,2:end);
for i=1:length(z)
	fprintf(f3,' %d',z(i));
end
fprintf(f3,'\n');
end
