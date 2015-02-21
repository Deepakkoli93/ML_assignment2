import random
with open('features.txt','r') as source:
    data = [ (random.random(), line) for line in source ]
data.sort()
with open('shuffled_features.txt','w') as target:
    for _, line in data:
        target.write( line )


f = open('shuffled_features.txt','r')
f1 = open('train1.txt','w')
f2=open('test1.txt','w')
i=0
for line in f:
 i=i+1
 if(1<=i<=1446):
 	f2.write(line)
 else:
 	f1.write(line)

f1.close()
f2.close()
f.close()


f = open('shuffled_features.txt','r')
f1 = open('train2.txt','w')
f2=open('test2.txt','w')
i=0
for line in f:
 i=i+1
 if(1447<=i<=2892):
 	f2.write(line)
 else:
 	f1.write(line)

f1.close()
f2.close()
f.close()

f = open('shuffled_features.txt','r')
f1 = open('train3.txt','w')
f2=open('test3.txt','w')
i=0
for line in f:
 i=i+1
 if(2893<=i<=4338):
 	f2.write(line)
 else:
 	f1.write(line)

f1.close()
f2.close()
f.close()

f = open('shuffled_features.txt','r')
f1 = open('train4.txt','w')
f2=open('test4.txt','w')
i=0
for line in f:
 i=i+1
 if(4339<=i<=5784):
 	f2.write(line)
 else:
 	f1.write(line)

f1.close()
f2.close()
f.close()

f = open('shuffled_features.txt','r')
f1 = open('train5.txt','w')
f2=open('test5.txt','w')
i=0
for line in f:
 i=i+1
 if(5785<=i<=7230):
 	f2.write(line)
 else:
 	f1.write(line)

f1.close()
f2.close()
f.close()