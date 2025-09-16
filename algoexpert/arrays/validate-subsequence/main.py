"""
Validate Subsequence
Given two non-empty arrays of integers, write a function that determines whether the second array is a subsequence of the first one.
A subsequence of an array is a set of numbers that aren't necessarily adjacent in the array but that are in the same order as they appear in the array. For instance, the numbers [1, 3, 4] form a subsequence of the array [1, 2, 3, 4], and so do the numbers [2, 4]. Note that a single number in an array and the array itself are both valid subsequences of the array.


Sample Input
array = 15, 1, 22, 25, 6, -1, 8, 101
sequence = 11, 6, -1, 101

Sample Output
true

"""


def is_valid_subsequence(array, sequence):
    array_pointer = 0
    sequence_pointer = 0

    while array_pointer < len(array) and sequence_pointer < len(sequence):
        print(f"looping... array_pointer: {array_pointer} - sequence_pointer: {sequence_pointer}")
        item = array[array_pointer]
        if item == sequence[sequence_pointer]:
            print(f"found a match for: {item}, increasing the sequence_pointer")
            sequence_pointer += 1
        array_pointer += 1

    return sequence_pointer == len(sequence)


def is_valid_subsequence_2(array, sequence):
    sequence_pointer = 0

    for item in array:
        if sequence_pointer == len(sequence):
            break
        print(f"looping... item: {item} - sequence_pointer: {sequence_pointer}")
        if item == sequence[sequence_pointer]:
            print(f"found a match for: {item}, increasing the sequence_pointer")
            sequence_pointer += 1

    return sequence_pointer == len(sequence)


if __name__ == '__main__':
    # print(is_valid_subsequence([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, 10]))
    print(is_valid_subsequence_2([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, 10]))
