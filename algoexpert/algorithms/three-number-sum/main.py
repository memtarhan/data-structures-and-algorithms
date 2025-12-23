"""
Three Number Sum

Write a function that takes in a non-empty array of distinct integers and an integer representing a target sum. The function should find all triplets in the array that sum up to the target sum and return a two-dimensional array of all these triplets. The numbers in each triplet should be ordered in ascending order, and the triplets themselves should be ordered in ascending order with respect to the numbers they hold.
If no three numbers sum up to the target sum, the function should return an empty array.

Sample Input
array = [12, 3, 1, 2, -6, 5, -8, 6]
targetSum = 0

Sample Output
[[-8, 2, 6], [-8, 3, 5], [-6, 1, 5]]
"""


def two_number_sum(array, target_sum):
    subarray = []

    checked_values = {}
    for number in array:
        y = target_sum - number
        if y in checked_values:
            subarray.append([y, number])
        else:
            checked_values[number] = True

    return subarray


def three_number_sum(array, target_sum):
    return []

if __name__ == '__main__':
    # array = [12, 3, 1, 2, -6, 5, -8, 6]
    arr = [3, 5, -4, 8, 11, 1, -1, 6]

    print(two_number_sum(arr, 10))
