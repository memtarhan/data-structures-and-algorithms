/*
 * Complete the 'palindromeIndex' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

func palindromeIndex(s: String) -> Int {
    let array = Array(s)
    let count = array.count
    var results = [Int]()

    for index in array.indices {
        if array[index] != array[count - index - 1] {
            results.append(index)
        }
    }

    if results.isEmpty || results.count > 1 { return -1 }
    return results[0]
}


//palindromeIndex(s: "aaab") // 3
//palindromeIndex(s: "baa") // 0
palindromeIndex(s: "aaa") // -1
