import Foundation

/*
 * Complete the 'superReducedString' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func superReducedString(s: String) -> String {
    var string = s
    

    while !string.isEmpty {
        let temp = removeFirstPair(string)
        if temp == string {
            break
        } else {
            string = temp 
        }
        print("string: \(string)")
    }

    if string.isEmpty { return "Empty String" }
    return string
}

func removeFirstPair(_ s: String) -> String {
    var array = Array(s)

    for index in array.indices {
        guard index + 1 < array.count else { return String(array) }
        if array[index] == array[index + 1] {
            // Found a match, delete the pair
            print("found a pair")
            array.remove(at: index)
            array.remove(at: index)

            print("returning: \(String(array))")
            return String(array)
        }
    }

    if array.isEmpty { return "" }
    return String(array)
}

// superReducedString(s: "baab")
superReducedString(s: "aaabccddd")
