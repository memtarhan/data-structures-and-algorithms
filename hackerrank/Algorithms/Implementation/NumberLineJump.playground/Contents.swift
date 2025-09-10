import Foundation

/*
 * Complete the 'kangaroo' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. INTEGER x1
 *  2. INTEGER v1
 *  3. INTEGER x2
 *  4. INTEGER v2
 */

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    let neverMeets = (x2 > x1 && v2 > v1) || (x1 > x2 && v1 > v2)
    print("neverMeets: \(neverMeets)")

    let neverMeet2 = (x2 - x1 > v2 - v1) || (x1 - x2 > v1 - v2)
    print("neverMeet2: \(neverMeet2)")

    if neverMeets {
        return "NO"
    }

    var current1 = x1
    var current2 = x2
    var counter = 0
    while true {
        current1 += v1
        current2 += v2

        print("x1: \(current1) - x2: \(current2)")
        
        counter += 1

        if current1 == current2 {
            return "YES"
        }
    }

    return "NO"
}

// kangaroo(x1: 2, v1: 1, x2: 1, v2: 2)
// kangaroo(x1: 0, v1: 3, x2: 4, v2: 2)
// kangaroo(x1: 0, v1: 2, x2: 5, v2: 3)

 kangaroo(x1: 4523, v1: 8092, x2: 9419, v2: 8076)
//kangaroo(x1: 21, v1: 6, x2: 47, v2: 3)
//kangaroo(x1: 28, v1: 8, x2: 96, v2: 2)
//kangaroo(x1: 1817, v1: 9931, x2: 8417, v2: 190)


