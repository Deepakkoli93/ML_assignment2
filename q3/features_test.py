f1 = open('20ng-rec_talk.txt','r')
f2 = open('vocab.txt','r')
d = {}



num = 1
for line in f2:
	line = line.strip()
	line = line.split()
	d[str(line[0])] = num
	num = num + 1

f2.close()

f2 = open('features.txt','w')
count=0
for line in f1:
	line = line.strip()
	line = line.split()
	label = line[0]
	
	print count
	count=count+1
	line = line[1:]
	# f will store the features i.e., number of times
	# a word in dictionary is occuring
	#f = [0]*len(d)
	f = ""
	for i in range(0,len(line)):
		if(d.has_key(line[i])):
		 f = f + " "+str(d[line[i]])

			

	#p = " ".join(str(e) for e in f)
	s = str(label)+" "+f+'\n'
	f2.write(s)

