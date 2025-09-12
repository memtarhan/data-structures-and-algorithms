func makingAnagrams(s1: String, s2: String) -> Int {
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

    return s1Total + s2Total
}


makingAnagrams(s1: "abc", s2: "amnop") // 6
makingAnagrams(s1: "cde", s2: "abc") // 4
