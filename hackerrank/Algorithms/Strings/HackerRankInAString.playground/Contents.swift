/*
 * Complete the 'hackerrankInString' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func hackerrankInString(s: String) -> String {
    let specialWord = "hackerrank"

    return "NO"
}

fileprivate func getNext(letter: Character, in string: String) -> Character? {
    let array = Array(string)
    if let firstIndex = array.firstIndex(of: letter) {
        return array[firstIndex]
    }
    return nil
}

fileprivate func checkIfContains(letter: Character,
                                 nextLetter: Character,
                                 string: String) -> Int {
    let array = Array(string)

    for index in 0 ..< array.count - 1 {
        let current = array[index]
        let next = array[index + 1]

        if current == letter && (next == letter || next == nextLetter) {
            return index
        }
    }

    return -1
}

let string = "haaacckkerrannkk"
checkIfContains(letter: "h", nextLetter: "a", string: string) // 1
checkIfContains(letter: "a", nextLetter: "c", string: string) // 2
