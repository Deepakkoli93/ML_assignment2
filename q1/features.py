from collections import OrderedDict
f1 = open('train-small','r')

f2 = open('vocab.txt','w')

#the dictionary
d = {}
words = []
count = 0
for line in f1:
	line = line.strip()
	line = line.split()
	line = line[2:]
	count = count + 1
	if((count%500)==0):
	 print count
	for i in range(0,len(line),2):
		words = words + [line[i]]

uniquewords = list(OrderedDict.fromkeys(words))
l = len(uniquewords)
print l

uniquewords.sort()
no_uniquewords = len(uniquewords)


for i in range(0,no_uniquewords):
	d[uniquewords[i]] = i
	s = uniquewords[i]+" "+str(i)+'\n'
	f2.write(s)

f1.close()
f2.close()

f1 = open('train-small','r')
f2 = open('features.txt','w')

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
	f = [0]*no_uniquewords
	for i in range(0,len(line),2):
		f[d[line[i]]] = line[i+1]

			

	p = " ".join(str(e) for e in f)
	s = str(y)+" "+p+'\n'
	f2.write(s)













