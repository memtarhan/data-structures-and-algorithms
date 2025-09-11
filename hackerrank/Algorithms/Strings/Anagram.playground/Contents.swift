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

//    var changeCounter = 0
//    var rightValuesDict = [Character: Int]()
//    for value in rightHalf {
//        if rightValuesDict[value] == nil {
//            rightValuesDict[value] = 1
//
//        } else {
//            rightValuesDict[value]! += 1
//        }
//    }
//
//    for value in leftHalf {
//    }
//    for index in leftHalf.indices {
//        let leftChar = leftHalf[index]
//        let rightChar = rightHalf[index]
//
//        if !(leftChar == rightChar) {
//            changeCounter += 1
//        }
//    }

    return findDifference(s1: String(leftHalf), s2: String(rightHalf))
}

// anagram(s: "aaabbb") // 3
// anagram(s: "ab") // 1
// anagram(s: "abc") // -1
// anagram(s: "mnop") // 2
// anagram(s: "xyyx") // 0
// anagram(s: "xaxbbbxx") // 1
anagram(s: "fdhlvosfpafhalll") // 5

// anagram(s: "hhpddlnnsjfoyxpciioigvjqzfbpllssuj") // 10

func findDifference(s1: String, s2: String) -> Int {
    var s1Dict: [Character: Int] = [:]

    for character in s1 {
        if s1Dict[character] == nil {
            s1Dict[character] = 0
        }

        s1Dict[character]! += 1
    }
    
    var s2Dict: [Character: Int] = [:]

    for character in s2 {
        if s2Dict[character] == nil {
            s2Dict[character] = 0
        }

        s2Dict[character]! += 1
    }
    
    print(s1Dict)
    print(s2Dict)
    
    for (key, value) in s2Dict {
        if s1Dict[key] != nil {
            s2Dict[key]! -= s1Dict[key]!
            s1Dict[key] = 0
        }
//        print("key: \(key) --- value in s2Dict: \(value) and value in s1Dict: \(s1Dict[key])")
    }
    
    print(s1Dict)
    print(s2Dict)
    
    let s1Total = s1Dict.values.reduce(0, +)
    let s2Total = s2Dict.values.reduce(0, +)
    
    if s1Total == s2Total {
        return s1Total
    }
    
    return -1
}

//findDifference(s1: "xaxb", s2: "bbxx")
