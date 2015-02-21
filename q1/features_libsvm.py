f1 = open('test','r')
f2 = open('vocab.txt','r')
d = {}

for line in f2:
	line = line.strip()
	line = line.split()
	d[str(line[0])] = int(line[1])