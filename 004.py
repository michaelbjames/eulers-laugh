# -*- coding: utf-8 -*-
# A palindromic number reads the same both ways. The largest palindrome
# made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

import math

def is_palendrom(n):
  strnum = str(n)
  length = len(strnum)
  for x in xrange(0, length/2):
    if strnum[x] != strnum[length - 1 - x]:
      return False
  return True;