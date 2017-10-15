n = 352787
#n = 43139

zns = [x for x in range(n) if gcd(x,n) == 1]

print len(zns)

vn = [x for x in zns if Integer(x).powermod((n-1)/2, n) == mod(kronecker(x,n),n) ]

print len(vn)

print 1.0*len(vn)/len(zns)

# n1:
# 351600
# 2
# 5.68828213879408e-6

# n2:
# 42720
# 2
# 0.0000468164794007491


# analysis

r = range(1,1000,2)
l = []

for n in r:
	zns = [x for x in range(n) if gcd(x,n) == 1]	
	vn = [x for x in zns if Integer(x).powermod((n-1)/2, n) == mod(kronecker(x,n),n) ]
	l.append(1.0*len(vn)/len(zns))
	print n

print l

G = scatter_plot( zip(r,l) )
G.save('ex1plot.png')

# looks like if it's not prime, the ratio decays somewhat exponentially
# which means for larger numbers n, the soloway strassen test has a higher chance of being correct

