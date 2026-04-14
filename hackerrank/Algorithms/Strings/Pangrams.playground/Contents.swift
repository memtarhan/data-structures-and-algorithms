import Foundation

/*
 * Complete the 'pangrams' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func pangrams(s: String) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"

    var dict = [Character: Bool]()
    for char in s.lowercased() {
        if dict[char] == nil {
            dict[char] = true
        }
    }

    var lettersDict = [Character: Bool]()
    for char in letters {
        if lettersDict[char] == nil {
            lettersDict[char] = true
        }
    }

    var result = "pangram"

    for key in lettersDict.keys {
        if dict[key] == nil {
            result = "not pangram"
        }
    }

    return result
}


pangrams(s: "The quick brown fox jumps over the lazy dog")
pangrams(s: "We promptly judged antique ivory buckles for the prize")
