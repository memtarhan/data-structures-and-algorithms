/*
 * Complete the 'camelcase' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

func camelcase(s: String) -> Int {
    var words = [String]()

    var startIndex = 0
    var pointer = 1
    let array = Array(s)
    let count = array.count

    while pointer < count {
        if array[pointer].isLowercase {
            if pointer == count - 1 {
                // reached to the end
                let word = String(array[startIndex ..< count])
                words.append(word)
            }

            pointer += 1

        } else {
            let word = String(array[startIndex ..< pointer])
            words.append(word)
            startIndex = pointer
            pointer += 1
        }
    }

    return words.count
}

camelcase(s: "saveChangesInTheEditor") // 5
camelcase(s: "oneTwoThree") // 3
