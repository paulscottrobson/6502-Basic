# *****************************************************************************
# *****************************************************************************
#
#		Name:		testcore.py
#		Author:		Paul Robson (paul@robsons.org.uk)
#		Date:		26th February 2021
#		Purpose:	Core test classes.
#
# *****************************************************************************
# *****************************************************************************

import random,sys

# *****************************************************************************
# 
#								Base test class
#
# *****************************************************************************

class Test(object):
	#
	#		Create test.
	#
	def __init__(self,count=100):
		random.seed()
		self.seed = random.randint(10000,99999)
		#self.seed = 35538
		random.seed(self.seed)
		h = sys.stdout
		h.write(";\n;\tBuilt using seed {0}\n;\n".format(self.seed))
		for i in range(0,count):
			h.write("assert {0}\n".format(self.getTest(i)))
		h.write("end")
	#
	#		Dummy test
	#
	def getTest(self,n):
		return "1"


if __name__ == "__main__":		
	t = Test(500)
