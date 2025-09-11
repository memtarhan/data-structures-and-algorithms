import Foundation

/*
 * Complete the 'anagram' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

func anagram(s: String) -> Int {
    let arr = Array(s)

    // Check if length is even otherwise return -1
    if arr.count % 2 == 1 { return -1 }

    var leftHalf = Array(arr[0 ..< arr.count / 2])
    var rightHalf = Array(arr[arr.count / 2 ..< arr.count])

    leftHalf.sort()
    rightHalf.sort()

    // Check if halves are anagrams, then no change is required and return 0
    if String(leftHalf) == String(rightHalf) {
        return 0
    }

    var changeCounter = 0
    var rightValuesDict = [Character: Int]()
    for value in rightHalf {
        if rightValuesDict[value] == nil {
            rightValuesDict[value] = 1

        } else {
            rightValuesDict[value]! += 1
        }
    }
    
    for value in leftHalf {
        
    }
    for index in leftHalf.indices {
        let leftChar = leftHalf[index]
        let rightChar = rightHalf[index]

        if !(leftChar == rightChar) {
            changeCounter += 1
        }
    }

    return changeCounter
}

// anagram(s: "aaabbb") // 3
// anagram(s: "ab") // 1
// anagram(s: "abc") // -1
// anagram(s: "mnop") // 2
// anagram(s: "xyyx") // 0
// anagram(s: "xaxbbbxx") // 1

anagram(s: "hhpddlnnsjfoyxpciioigvjqzfbpllssuj") // 10
