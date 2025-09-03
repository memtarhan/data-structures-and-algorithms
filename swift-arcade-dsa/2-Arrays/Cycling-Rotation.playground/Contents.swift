import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/

 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

/*
 [3, 8, 9, 7, 6] => [9, 7, 6, 3, 8]

 3 ---> initial index=0 final index=3
 8 ---> initial index=1 final index=4
 9 ---> initial index=2 final index=0
 7 ---> initial index=3 final index=2
 6 ---> initial index=4 final index=2

 */
func solution(A: [Int], K: Int) -> [Int] {
    var newArr = A
    var count = A.count
    var actualRotationCount = K % count

    for index in 0 ..< count {
        var newIndex = index + actualRotationCount
        if newIndex > count - 1 {
            newIndex = newIndex - count
        }
        newArr[newIndex] = A[index]
    }

    return newArr
}

/*
 Rotate left 3 times

 [3, 8, 9, 7, 6] => [7, 6, 3, 8, 9]

 3 ---> initial index=0 final index=2
 8 ---> initial index=1 final index=3
 9 ---> initial index=2 final index=4
 7 ---> initial index=3 final index=0
 6 ---> initial index=4 final index=1

 */

func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    var newArr = arr
    var count = arr.count
    var actualRotationCount = d % count

    for index in 0 ..< count {
        var newIndex = index - actualRotationCount
        if newIndex < 0 {
            newIndex = newIndex + count
        }
        newArr[newIndex] = arr[index]
    }

    return newArr
}

rotateLeft(d: 3, arr: [3, 8, 9, 7, 6])

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 13) // [9, 7, 6, 3, 8]

func solution2(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return A }
    guard K > 0 else { return A }

    var result = A
    for _ in 1 ... K {
        result = rotateRightOnce(A: result)
    }

    return result
}

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArr = Array<Int>(repeating: 0, count: A.count)

    for i in 0 ..< A.count - 1 {
        newArr[i + 1] = A[i]
    }
    newArr[0] = A.last!

    return newArr
}

solution2(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution2(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution2(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution2(A: [3, 8, 9, 7, 6], K: 13) // [9, 7, 6, 3, 8]
