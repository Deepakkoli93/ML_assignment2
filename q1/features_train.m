v = containers.Map();

f1 = fopen('vocab2.txt');
num = 0;
while ~feof(f1)
	num = num + 1;
	line = fgetl(f1);
	v(line) = num;
	end
fclose(f1);

f1 = fopen('train-small');
f2 = fopen('features.txt','w');

while ~feof(f1)
line = fgetl(f1);
line = strsplit(line, ' ');
if(strcmp(line{2},'spam'))
	label='1';
else
	label='-1';
end

line = line(:,3:end);
z=zeros(length(keys(v)),1);

for i=1:2:length(line)

if isKey(v,line{i})
the_index = v(line{i});
z(the_index) = str2num(line{i+1});
end

end
fprintf(f2, '%s', label);
for i=1:length(z)
fprintf(f2, ' %d', z(i));
end
fprintf(f2, '\n' );


end