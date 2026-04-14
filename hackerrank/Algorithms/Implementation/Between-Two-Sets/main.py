"""

There will be two arrays of integers. Determine all integers that satisfy the following two conditions:
1- The elements of the first array are all factors of the integer being considered
2- The integer being considered is a factor of all elements of the second array
These numbers are referred to as being between the two arrays. Determine how many such numbers exist.
Example
a = [2, 6]
b = [24, 36]

There are two numbers between the arrays: 6 and 12.
6 % 2 = 0, 6 % 6 = 0  and 24 % 2 = 0, 36 % 6 = 0  for the first value.
12 % 2 = 0, 12 % 6 = 0  and 24 % 12 = 0, 36 % 12 = 0  for the second value. Return 2.

"""
import math
import os
import random
import re
import sys


#
# Complete the 'getTotalX' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b
#

def get_total(a, b):
    # We need find values between max(a) and min(b),
    # the values should be less than max value in a and greater than min value in b
    min_value = min(a)
    max_value = min(b)

    values = set()

    for number in range(min_value, max_value + 1):
        if number % min_value == 0 and max_value % number == 0:
            values.add(number)

    print(values)
    return len(values)


if __name__ == '__main__':
    print(get_total([3, 4], [24, 48]))
