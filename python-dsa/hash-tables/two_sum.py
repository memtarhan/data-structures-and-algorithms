"""
The two_sum function takes an array of integers nums and a target integer target as input, and finds two numbers
in the array that add up to the target using a hash table. Here's an explanation of how the function works:

The function creates an empty hash table called num_map to store the numbers in the input array and their indices.

The function loops through each number in the input array nums and uses the enumerate function to get the index
of each number. For each number, it calculates the complement of the number by subtracting it from the target.

The function checks if the complement is already in the hash table num_map. If it is, the function returns the
indices of the two numbers that add up to the target. The indices are stored in a list [num_map[complement], i]
where num_map[complement] is the index of the complement of the current number, and i is the index of the current number.

If the complement is not in the hash table num_map, the function adds the current number and its index to the hash table.
This is done by setting num_map[num] = i, where num is the current number and i is its index.

After the loop finishes, the function returns an empty list []. This is because no two numbers in the input array
add up to the target.


It has a time complexity of O(n), where n is the length of the input array, because the hash table operations
take constant time. This is more efficient than a brute-force solution that checks all pairs of numbers in the array,
which would have a time complexity of O(n^2).



"""


def two_sum(nums, target):
    # create an empty hash table
    num_map = {}

    # iterate through each number in the array
    for i, num in enumerate(nums):
        # calculate the complement of the current number
        complement = target - num

        # check if the complement is in the hash table
        if complement in num_map:
            # if it is, return the indices of the two numbers
            return [num_map[complement], i]

        # add the current number and its index to the hash table
        num_map[num] = i

    # if no two numbers add up to the target, return an empty list
    return []


print(two_sum([5, 1, 7, 2, 9, 3], 10))
print(two_sum([4, 2, 11, 7, 6, 3], 9))
print(two_sum([10, 15, 5, 2, 8, 1, 7], 12))
print(two_sum([1, 3, 5, 7, 9], 10))
print(two_sum([1, 2, 3, 4, 5], 10))
print(two_sum([1, 2, 3, 4, 5], 7))
print(two_sum([1, 2, 3, 4, 5], 3))
print(two_sum([], 0))

"""
    EXPECTED OUTPUT:
    ----------------
    [1, 4]
    [1, 3]
    [0, 3]
    [1, 3]
    []
    [2, 3]
    [0, 1]
    []

"""
