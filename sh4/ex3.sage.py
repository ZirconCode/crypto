
# This file was *autogenerated* from the file ex3.sage
from sage.all_cmdline import *   # import sage library

_sage_const_607 = Integer(607); _sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_14 = Integer(14); _sage_const_15 = Integer(15); _sage_const_150 = Integer(150); _sage_const_33 = Integer(33); _sage_const_75 = Integer(75)
import random

random.seed(_sage_const_14 ) # <- completely random number, trust me

# returns true if composite
def onetrial(n):
	# factors = list(factor(n-1)) # hehe.... len(factors)

	
	if( n % _sage_const_2  == _sage_const_0 ):
		n += _sage_const_1 

	m = n - _sage_const_1 
	s = _sage_const_0 
	while m%_sage_const_2  == _sage_const_0 :
		m = m/_sage_const_2 
		s = s+_sage_const_1 

	d = (n-_sage_const_1 )/(_sage_const_2 **s)


	x = random.randint(_sage_const_2 ,n-_sage_const_2 )
	x = Integer(x).powermod(d, n)

	if x == _sage_const_1  or x == n-_sage_const_1 :
		return False
	
	for j in range(s):
		x = Integer(x).powermod(_sage_const_2 , n)
		if x == n-_sage_const_1 :
			return False
		if x == _sage_const_1 :
			return True

	return True
		

# returns true if prime
def mrtest(n,trials):
	for i in range(trials):
		print i,
		if onetrial(n):
			return False
	return True


# prime if True
print mrtest( _sage_const_2 **_sage_const_607  - _sage_const_1 , _sage_const_150 )
print mrtest( _sage_const_2 **_sage_const_607  - _sage_const_1 , _sage_const_75 )
# True
# True

print mrtest( _sage_const_33 , _sage_const_15 )
# 150 are enough trials since since they are even enough for the weaker, solovay test.
# in fact we should be able to use only 75 trials.


