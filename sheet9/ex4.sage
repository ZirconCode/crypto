
E = EllipticCurve(GF(47),[1,2])
P = E(18,20)
Q = E(1,45)

ord = P.order()
print 'p ord ', ord

# 'randomness' inspired by Elliptic Curves etc. - Lawrence C. Washington
P0 = 3*P + 5*Q


M = [(4,3), (9,17), (19,6)]

def f(point):
	i = mod(point[0],3)
	return (point+M[i][0]*P+M[i][1]*Q , M[i])

#print f(P0)

def Pi(i):
	res = P0
	coeff = (3,5) # for P0

	for j in range(i):
		tmp = f(res)
		res = tmp[0]
		coeff = [sum(x) for x in zip(coeff,tmp[1])]
	return (res,coeff)

print P0
print Pi(0)
print Pi(1)
print Pi(2)


for k in range(1,ord):
	p1 = Pi(k)
	p2 = Pi(2*k)
	if p1[0] == p2[0]:
		print k , 'wooo collision'
		print p1
		print p2
		#break

# first collision at 9

# we use second collision at 18 since first one doesn't work out
print 112*P + 88*Q # gives point in infinity = good

print 42*P
print Q
# => Coorect Woo
