import Foundation

/*
 * Complete the 'minimumNumber' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. STRING password
 */

func minimumNumber(n: Int, password: String) -> Int {
    let uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let lowercaseLetters = "abcdefghijklmnopqrstuvwxyz"
    let numbers = "0123456789"
    let specialCharacters = "!@#$%^&*()-+"

    let uppercaseNeed = checkIfNeedsCharacter(
        characters: Array(uppercaseLetters),
        checkedString: password)

    let lowercaseNeed = checkIfNeedsCharacter(
        characters: Array(lowercaseLetters),
        checkedString: password)

    let numberCheck = checkIfNeedsCharacter(
        characters: Array(numbers),
        checkedString: password)

    let specialCharCheck = checkIfNeedsCharacter(
        characters: Array(specialCharacters),
        checkedString: password)

    let total = uppercaseNeed + lowercaseNeed + numberCheck + specialCharCheck

    if total + n < 6 {
        return 6 - n
    }

    return total
}

fileprivate func checkIfNeedsCharacter(characters: [Character],
                                       checkedString string: String) -> Int {
    if string.contains(where: { character in
        characters.contains(character)
    }) {
        return 0

    } else {
        return 1
    }
}

minimumNumber(n: 3, password: "Ab1") // 3
minimumNumber(n: 11, password: "#HackerRank") // 1

fileprivate func checkUppercaseLetter(_ string: String) -> Int {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let array = Array(letters)

    if string.contains(where: { character in
        letters.contains(character)
    }) {
        return 0

    } else {
        return 1
    }
}

fileprivate func checkSpecialCharacters(_ string: String) -> Int {
    let characters = "!@#$%^&*()-+"
    let array = Array(characters)

    if string.contains(where: { character in
        characters.contains(character)
    }) {
        return 0

    } else {
        return 1
    }
}

// checkIfNeedsCharacter(characters: Array("!@#$%^&*()-+"), checkedString: "qwerty") // 1
// checkIfNeedsCharacter(characters: Array("!@#$%^&*()-+"), checkedString: "qwe#rty") // 0
//
// checkIfNeedsCharacter(characters: Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), checkedString: "qwerty") // 1
// checkIfNeedsCharacter(characters: Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), checkedString: "qweRty") // 0
