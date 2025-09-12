/*
 * Complete the 'palindromeIndex' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

func palindromeIndex(s: String) -> Int {
    print(s)
    let array = Array(s)
    let count = array.count
    var results = [Int]()
    var result = -1

    for index in 0 ..< count / 2 {
        let left = array[index]
        let right = array[count - index - 1]

        if left != right {
            if index + 1 < count && count - index - 2 >= 0 {
                // temporarily drop left value
                let newLeft = array[index + 1]
                let newRight = array[count - index - 2]
                if newLeft == right {
                    result = index
                    results.append(index)
//                    break

                } else if newRight == left {
                    result = count - index - 1
                    results.append(count - index - 1)
//                    break
                }
            }
        }
    }

    print(results)
    return result

//    if results.isEmpty { return -1 }
//    return results[0]
}

// palindromeIndex(s: "aaab") // 3
// palindromeIndex(s: "baa") // 0
// palindromeIndex(s: "aaa") // -1

// palindromeIndex(s: "quyjjdcgsvvsgcdjjyq") // 1
// palindromeIndex(s: "hgygsvlfwcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcflvsgygh") // 8
// palindromeIndex(s: "fgnfnidynhxebxxxfmxixhsruldhsaobhlcggchboashdlurshxixmfxxxbexhnydinfngf") // 33

palindromeIndex(s: "hgygsvlfcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcwflvsgygh") // 44
