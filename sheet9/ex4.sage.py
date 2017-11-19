
# This file was *autogenerated* from the file ex4.sage
from sage.all_cmdline import *   # import sage library

_sage_const_3 = Integer(3); _sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_45 = Integer(45); _sage_const_5 = Integer(5); _sage_const_47 = Integer(47); _sage_const_9 = Integer(9); _sage_const_4 = Integer(4); _sage_const_17 = Integer(17); _sage_const_20 = Integer(20); _sage_const_18 = Integer(18); _sage_const_19 = Integer(19); _sage_const_6 = Integer(6)
E = EllipticCurve(GF(_sage_const_47 ),[_sage_const_1 ,_sage_const_2 ])
P = E(_sage_const_18 ,_sage_const_20 )
Q = E(_sage_const_1 ,_sage_const_45 )

ord = P.order()
print 'p ord ', ord

# 'randomness' inspired by Elliptic Curves etc. - Lawrence C. Washington
P0 = _sage_const_3 *P + _sage_const_5 *Q

M = [_sage_const_4 *P+_sage_const_3 *Q, _sage_const_9 *P+_sage_const_17 *Q, _sage_const_19 *P+_sage_const_6 *Q]

def f(point):
	i = mod(point[_sage_const_0 ],_sage_const_3 )
	return point+M[i]

#print f(P0)

def Pi(i):
	res = P0
	for j in range(i):
		res = f(res)
	return res

print P0
print Pi(_sage_const_0 )
print Pi(_sage_const_1 )
print Pi(_sage_const_2 )

for k in range(_sage_const_1 ,ord):
	p1 = Pi(k)
	p2 = Pi(_sage_const_2 *k)
	if p1[_sage_const_0 ] == p2[_sage_const_0 ] and p1[_sage_const_1 ] == p2[_sage_const_1 ]:
		print k , 'wooo collision'
		#break

# first collision at 9

