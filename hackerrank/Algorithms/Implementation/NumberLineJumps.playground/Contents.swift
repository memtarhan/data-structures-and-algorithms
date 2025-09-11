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
    let neverMeets2 = !((x2 > x1 && v1 > v2) || (x1 > x2 && v2 > v1))
    let neverMeets3 = v1 == v2

    if neverMeets || neverMeets2 || neverMeets {
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
        
        if current1 > current2 {
            return "NO"
        }
    }

    return "NO"
}

// kangaroo(x1: 2, v1: 1, x2: 1, v2: 2)
//kangaroo(x1: 0, v1: 3, x2: 4, v2: 2)
// kangaroo(x1: 45, v1: 7, x2: 56, v2: 3)
kangaroo(x1: 43, v1: 2, x2: 70, v2: 2)

