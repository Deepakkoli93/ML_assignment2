f1 = open('20ng-rec_talk.txt','r')

f2 = open('vocab.txt','w')

#the dictionary
d = {}
words = []
count = 0
num=0
for line in f1:
	line = line.strip()
	line = line.split()
	line = line[1:]
	count = count + 1
	if((count%500)==0):
	 print count
	for i in range(0,len(line)):
		if(not(d.has_key(line[i]))):
			d[line[i]] = num
			num = num + 1

print num

words = d.keys()
words.sort()
print "uniqie words......\n"
l = len(words)
print l

for i in range (0,l):
	s = words[i]+'\n'
	f2.write(s)