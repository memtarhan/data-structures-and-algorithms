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

    // Removed sorting because of performance and findDifference(:_) function
    // already takes care of all the characters regardless sorting
//    leftHalf.sort()
//    rightHalf.sort()

    let s1 = String(leftHalf)
    let s2 = String(rightHalf)
    // Check if halves are anagrams, then no change is required and return 0
//    if s1 == s2 {
//        return 0
//    }

    return findDifference(s1: s1, s2: s2)
}

// anagram(s: "aaabbb") // 3
// anagram(s: "ab") // 1
// anagram(s: "abc") // -1
// anagram(s: "mnop") // 2
// anagram(s: "xyyx") // 0
// anagram(s: "xaxbbbxx") // 1
// anagram(s: "fdhlvosfpafhalll") // 5

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

    for key in s2Dict.keys {
        if s1Dict[key] != nil {
            // check if values are equal, if so, value should be set to 0
            if s1Dict[key] == s2Dict[key] {
                s1Dict[key] = 0
                s2Dict[key] = 0

            } else if s1Dict[key]! > s2Dict[key]! { // s2 value shoul be set to 0
                s1Dict[key]! -= s2Dict[key]!
                s2Dict[key] = 0

            } else if s1Dict[key]! < s2Dict[key]! { // s1 value shoul be set to 0
                s2Dict[key]! -= s1Dict[key]!
                s1Dict[key] = 0
            }
        }
    }

    let s1Total = s1Dict.values.reduce(0, +)
    let s2Total = s2Dict.values.reduce(0, +)

    if s1Total == s2Total {
        return s1Total
    }

    return -1
}

// let s = "fdhlvosfpafhalll"
// let arr = Array(s)
// let s1 = String(Array(arr[0 ..< arr.count / 2]))
// let s2 = String(Array(arr[arr.count / 2 ..< arr.count]))
//
// findDifference(s1: s1, s2: s2)

// findDifference(s1: "xaxb", s2: "bbxx")
