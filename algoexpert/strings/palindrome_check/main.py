def is_palindrome(string):
    if len(string) == 1:
        return True

    left_pointer = 0
    right_pointer = len(string) - 1

    while left_pointer < right_pointer:
        if string[left_pointer] != string[right_pointer]:
            return False
        if left_pointer == right_pointer:
            return True
        left_pointer += 1
        right_pointer -= 1

    return True

def is_palindrome2(string):
    reversed_string = string[::-1]
    return string == reversed_string



if __name__ == '__main__':
    print(is_palindrome('abcdcba'))
    print(is_palindrome2('abcdcba'))

