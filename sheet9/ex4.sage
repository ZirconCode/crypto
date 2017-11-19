
E = EllipticCurve(GF(47),[1,2])
P = E(18,20)
Q = E(1,45)

ord = P.order()
print 'p ord ', ord

# 'randomness' inspired by Elliptic Curves etc. - Lawrence C. Washington
P0 = 3*P + 5*Q

M = [4*P+3*Q, 9*P+17*Q, 19*P+6*Q]

def f(point):
	i = mod(point[0],3)
	return point+M[i]

#print f(P0)

def Pi(i):
	res = P0
	for j in range(i):
		res = f(res)
	return res

print P0
print Pi(0)
print Pi(1)
print Pi(2)

for k in range(1,ord):
	p1 = Pi(k)
	p2 = Pi(2*k)
	if p1[0] == p2[0] and p1[1] == p2[1]:
		print k , 'wooo collision'
		#break

# first collision at 9


