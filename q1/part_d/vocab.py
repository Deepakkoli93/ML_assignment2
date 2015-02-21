from collections import OrderedDict
f1 = open('train','r')

f2 = open('vocab.txt','w')

#the dictionary
d = {}
words = []
count = 0
num=0
for line in f1:
	line = line.strip()
	line = line.split()
	line = line[2:]
	count = count + 1
	if((count%500)==0):
	 print count
	for i in range(0,len(line),2):
		if(not(d.has_key(line[i]))):
			d[line[i]] = num
			num = num + 1

print num

words = d.keys()
words.sort()
l = len(words)

for i in range (0,l):
	s = words[i]+" "+str(i)+'\n'
	f2.write(s)
#uniquewords = list(OrderedDict.fromkeys(words))
#l = len(uniquewords)
#print l


#uniquewords.sort()
#no_uniquewords = len(uniquewords)


#for i in range(0,no_uniquewords):
	#d[uniquewords[i]] = i
#	s = uniquewords[i]+" "+str(i+1)+'\n'
#	f2.write(s)

#f1.close()
#f2.close()