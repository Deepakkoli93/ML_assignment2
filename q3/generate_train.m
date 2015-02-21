%x=importdata('20ng-rec_talk.txt');
%x = x(randperm(size(x,1)),:);

%f=fopen('shuffled_features1.txt','w');
%for i=1:length(x)
%fprintf(f, '%s\n',x{i} );
%end

f = fopen('features.txt');

f1 = fopen('train1.txt','w')
f2 = fopen('test1.txt','w')
i=0;
while ~feof(f)
	i=i+1
	line = fgetl(f);

 if(1<=i<=1446)
 	fprintf(f2, '%s\n', line);
 else
fprintf(f1, '%s\n', line);
end
end

fclose(f);
fclose(f1);
fclose(f2);

f = fopen('features.txt');

f1 = fopen('train2.txt','w')
f2 = fopen('test2.txt','w')
i=0;
while ~feof(f)
	i=i+1
	line = fgetl(f);

 if(1447<=i<=2892)
 	fprintf(f2, '%s\n', line);
 else
fprintf(f1, '%s\n', line);
end
end

fclose(f);
fclose(f1);
fclose(f2);

f = fopen('features.txt');

f1 = fopen('train3.txt','w')
f2 = fopen('test3.txt','w')
i=0;
while ~feof(f)
	i=i+1
	line = fgetl(f);

 if(2893<=i<=4338)
 	fprintf(f2, '%s\n', line);
 else
fprintf(f1, '%s\n', line);
end
end

fclose(f);
fclose(f1);
fclose(f2);

f = fopen('features.txt');

f1 = fopen('train4.txt','w')
f2 = fopen('test4.txt','w')
i=0;
while ~feof(f)
	i=i+1
	line = fgetl(f);

 if(4339<=i<=5784)
 	fprintf(f2, '%s\n', line);
 else
fprintf(f1, '%s\n', line);
end
end

fclose(f);
fclose(f1);
fclose(f2);

f = fopen('features.txt');

f1 = fopen('train5.txt','w')
f2 = fopen('test5.txt','w')
i=0;
while ~feof(f)
	i=i+1
	line = fgetl(f);

 if(5785<=i<=7230)
 	fprintf(f2, '%s\n', line);
 else
fprintf(f1, '%s\n', line);
end
end

fclose(f);
fclose(f1);
fclose(f2);