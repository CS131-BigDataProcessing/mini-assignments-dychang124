#!/bin/bash

python3 <<EOF
from power import power
from divide import divide
import unittest

class TestPowerDivide(unittest.TestCase):
	def testPower(self):
		self.assertEqual(power(2, 3), 8)
		self.assertEqual(power(5, 0), 1)
		self.assertEqual(power(4, -3), 0.015625)
		self.assertEqual(power(-4, 3), -64)
		self.assertEqual(power(0, 3), 0)
		self.assertEqual(power(2, .5), 1.4142135623730951)
		self.assertEqual(power(.5, 2), .25)
	def testDivide(self):
		self.assertEqual(divide(10, 4), 2.5)
		self.assertEqual(divide(10, 2), 5)
		self.assertRaises(Exception, divide(10, 0), 2.5)
		self.assertEqual(divide(0, 2), 0)
		self.assertEqual(divide(-10, 2), -5)
		self.assertEqual(divide(10, -2), -5)
		self.assertEqual(divide(-10, -2), 5)
if __name__ == '__main__':
    	unittest.main()
EOF
