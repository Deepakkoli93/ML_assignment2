f1 = open('test','r')
f2 = open('vocab.txt','r')
d = {}

for line in f2:
	line = line.strip()
	line = line.split()
	d[str(line[0])] = int(line[1])

f2.close()

f2 = open('features_test.txt','w')

for line in f1:
	line = line.strip()
	line = line.split()
	mailid = line[0]
	y = -1
	if(line[1]=='spam'):
		y = 1

	line = line[2:]
	# f will store the features i.e., number of times
	# a word in dictionary is occuring
	f = [0]*len(d)
	for i in range(0,len(line),2):
		if(d.has_key(line[i])):
		 f[d[line[i]]] = line[i+1]

			

	p = " ".join(str(e) for e in f)
	s = str(y)+" "+p+'\n'
	f2.write(s)

