def caesar_cipher_encryptor(string, key):
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphabet_dict = {}
    for index, letter in enumerate(alphabet):
        alphabet_dict[letter] = index

    pass


if __name__ == '__main__':
    print(caesar_cipher_encryptor('xyz', 2))