"""
The first_non_repeating_char function takes a string as input and returns the first non-repeating character in the
string using a hash table (dictionary). Here's an explanation of how the function works:

1 - The function creates an empty hash table called char_counts to store the frequency of each character in the string.

2 - The first loop iterates through each character in the input string and uses the get method to access the current
count of that character in the hash table. If the character is not already in the hash table, its count is
initialized to 0. The count is then incremented by 1 for each occurrence of the character in the string.

3 - The second loop iterates through each character in the input string again. For each character, the function checks
the count of that character in the hash table. If the count is equal to 1, then the character is not repeated in the
string, so the function returns that character as the first non-repeating character.

4 - If no non-repeating character is found in the string, the function returns None.


It has a time complexity of O(n), where n is the length of the input string.

"""


def first_non_repeating_char(string):
    # create an empty hash table to count the frequency of each character
    char_counts = {}
    # count the frequency of each character in the string
    for char in string:
        # this increments the count by 1 in the dictionary
        char_counts[char] = char_counts.get(char, 0) + 1
    # find the first non-repeating character in the string
    for char in string:
        if char_counts[char] == 1:
            return char
    # return None if no non-repeating character is found
    return None


print(first_non_repeating_char('leetcode'))

print(first_non_repeating_char('hello'))

print(first_non_repeating_char('aabbcc'))

"""
    EXPECTED OUTPUT:
    ----------------
    l
    h
    None

"""
