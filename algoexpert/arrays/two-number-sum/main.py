"""
Two Number Sum
Write a function that takes in a non-empty array of distinct integers and an integer representing a target sum. If any two numbers in the input array sum up to the target sum, the function should return them in an array, in any order. If no two numbers sum up to the target sum, the function should return an empty array.
Note that the target sum has to be obtained by summing two different integers in the array; you can't add a single integer to itself in order to obtain the target sum.
You can assume that there will be at most one pair of numbers summing up to the target sum.


Sample Input
array = 13, 5, -4, 8, 11, 1, -1, 6]
targetSum = 10

Sample Output
[-1, 11] // the numbers could be in reverse order
"""


# Time = O(n^2)
# Space = O(1)
def two_number_sum_1(array, target_sum):
    length = len(array)
    for i in range(length):
        for j in range(length):
            if i != j:
                num1 = array[i]
                num2 = array[j]
                if num1 + num2 == target_sum:
                    return [num1, num2]

    return []


# Time = O(n^2)
# Space = O(1)
def two_number_sum_1_1(array, target_sum):
    for i in range(len(array) - 1):
        num1 = array[i]
        for j in range(i + 1, len(array)):
            num2 = array[j]
            if num1 + num2 == target_sum:
                return [num1, num2]

    return []


# Time = O(n)
# Space = O(n)
def two_number_sum_2(array, target_sum):
    checked_values = {}
    for num in array:
        y = target_sum - num
        if y in checked_values:
            return [y, num]
        else:
            checked_values[num] = True

    return []


# Time = O(nlogn)
# Space = O(1)
def two_number_sum_3(array, target_sum):
    array.sort()

    left = 0
    right = len(array) - 1

    while left < right:
        left_item = array[left]
        right_item = array[right]
        current_sum = left_item + right_item

        if current_sum == target_sum:
            return [left_item, right_item]

        elif current_sum > target_sum:
            right -= 1
        else:
            left += 1

    return []


if __name__ == '__main__':
    arr = [3, 5, -4, 8, 11, 1, -1, 6]

    print(two_number_sum_1(arr, 10))
    print(two_number_sum_1_1(arr, 10))

    print(two_number_sum_2(arr, 10))

    print(two_number_sum_3(arr, 10))
