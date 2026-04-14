func split(word: String, into parts: Int = 3) -> [String] {
    var result = [String]()
    var array = Array(word)

    var pointer = 0

    while pointer + parts <= array.count {
        let string = String(array[pointer ..< pointer + parts])
        result.append(string)
        pointer += parts
    }

    return result
}

print(split(word: "SOSSOSSOS"))

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

    var result = 0
    let expectedMessageParts = split(word: expectedMessage)
    let receivedMessageParts = split(word: s)

    for (expected, received) in zip(expectedMessageParts, receivedMessageParts) {
        if !(expected == received) {
            for (e, r) in zip(Array(expected), Array(received)) {
                if e != r {
                    result += 1
                }
            }
        }
    }

    return result
}

print(marsExploration(s: "SOSSPSSQSSOR")) // 3
