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

//    let s1Total = s1Dict.values.reduce(0, +)
    let s2Total = s2Dict.values.reduce(0, +)

    return s2Total
}

func marsExploration(s: String) -> Int {
    let numberOfMessages = s.count / 3
    var expectedMessage = ""
    for _ in 0 ..< numberOfMessages {
        expectedMessage.append("SOS")
    }

    let difference = findDifference(s1: expectedMessage, s2: s)

    return difference
}

print(marsExploration(s: "SOSSPSSQSSOR")) // 3
