import random

random.seed(14) # <- completely random number, trust me

# returns true if composite
def onetrial(n):
	# factors = list(factor(n-1)) # hehe.... len(factors)

	
	if( n % 2 == 0):
		n += 1

	m = n - 1
	s = 0
	while m%2 == 0:
		m = m/2
		s = s+1

	d = (n-1)/(2^s)


	x = random.randint(2,n-2)
	x = Integer(x).powermod(d, n)

	if x == 1 or x == n-1:
		return False
	
	for j in range(s):
		x = Integer(x).powermod(2, n)
		if x == n-1:
			return False
		if x == 1:
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
print mrtest( 2^607 - 1, 150)
print mrtest( 2^607 - 1, 75)
# True
# True

# 150 are enough trials since since they are even enough for the weaker, solovay test.
# in fact we should be able to use only 75 trials.

