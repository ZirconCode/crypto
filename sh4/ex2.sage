


def getRatio(n):
	# factors = list(factor(n-1)) # haha *facepalm*
	# s = [t[1] for t in factors if t[0] == 2][0] #probably ordered anyway...

	m = n - 1
	s = 0
	while m%2 == 0:
		m = m/2
		s = s+1

	d = (n-1)/(2^s)

	zns = [x for x in range(n) if gcd(x,n) == 1]

	sn = []
	for x in zns:
		if Integer(x).powermod(d, n) == 1:
			sn.append(x)
		else:
			for j in range(s):
				if Integer(x).powermod(d*2^j, n) == mod(-1,n):
					sn.append(x)
					break
	#print sn
	return 1.0*len(sn)/len(zns)
		


print getRatio(655009)
print getRatio(511229)
# 3.06100584652117e-6
# 0.0000206679894179894


# analysis

r = range(3,1000,2)
l = []

for n in r:
	l.append(getRatio(n))
	print n

G = scatter_plot( zip(r,l) )
G.save('ex2plot.png')

# if we compare the plot from ex1 with that from ex2 directly, 
# we can see that of those ratios which are not prime (=1), they are much lower
# for a medium amount of cases. Therefore it is a much better method than the one from ex1.

