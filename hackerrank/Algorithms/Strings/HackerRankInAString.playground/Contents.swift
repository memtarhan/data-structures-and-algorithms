/*
 * Complete the 'hackerrankInString' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func hackerrankInString(s: String) -> String {
    // Let's go with subsequence logic

    let sequence = Array("hackerrank")
    let array = Array(s)

    var sequencePointer = 0
    for character in array {
        if sequencePointer == sequence.count {
            break
        }
        if character == sequence[sequencePointer] {
            sequencePointer += 1
        }
    }

    return sequencePointer == sequence.count ? "YES" : "NO"
}

let string = "haaacckkerrannkk"
hackerrankInString(s: string)
