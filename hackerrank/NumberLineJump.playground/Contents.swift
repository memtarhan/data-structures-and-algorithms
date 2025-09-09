func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    let a1 = abs(x1 - v1)
    let a2 = abs(x2 - v2)

    if a2 >= a1 {
        return "NO"
    }

    if x2 > x1 && v2 > v1 {
        return "NO"
    }

    var current1 = x1
    var current2 = x2

    while true {
        current1 += v1
        current2 += v2

        if current1 == current2 {
            return "TRUE"
        }
    }

    return "NO"
}

//kangaroo(x1: 2, v1: 1, x2: 1, v2: 2)
kangaroo(x1: 0, v1: 3, x2: 4, v2: 2)
//kangaroo(x1: 0, v1: 2, x2: 5, v2: 3)
