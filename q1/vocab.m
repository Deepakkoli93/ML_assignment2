v = containers.Map

f1 = fopen('vocab2.txt','w');

num=1;
f2 = fopen('train-small');
line_no=0;
while ~feof(f2)
line_no=line_no+1
line = fgetl(f2);
a = strsplit(line,' ');
a = a(:,3:end);


for i=1:2:length(a)
	if(not(isKey(v,a{i})))
	v(a{i}) = num;
	num=num+1;
	end
end
end
z=keys(v);
size(z)

for i=1:length(z)
	fprintf(f1,'%s\n',z{i});
end

