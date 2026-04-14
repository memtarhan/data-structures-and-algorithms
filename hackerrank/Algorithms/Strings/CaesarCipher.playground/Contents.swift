func caesarCipher(s: String, k: Int) -> String {
    let originalAlphabetLower = "abcdefghijklmnopqrstuvwxyz"
    let originalAlphabetUpper = originalAlphabetLower.uppercased()

    var result = ""

    for character in s {
        if originalAlphabetLower.contains(character) || originalAlphabetUpper.contains(character) {
            var char = character
            for _ in 0 ..< k {
                char = rotateLetterOnce(char)
            }

            result.append(char)

        } else {
            result.append(character)
        }
    }

    return result
}

print(caesarCipher(s: "middle-Outz", k: 2)) // okffng-Qwvb

/*
 abcdefghijklmnopqrstuvwxyz becomes bcdefghijklmnopqrstuvwxyza
 */
func rotateAlphabetOnce(_ s: String) -> String {
    let original = Array(s)
    var temp = Array(s)
    let lastIndex = original.count - 1

    for index in original.indices {
        var mIndex = index

        mIndex = index - 1
        if mIndex < 0 {
            mIndex = lastIndex
        }

        temp[mIndex] = original[index]
    }

    return String(temp)
}

// print(rotateAlphabetOnce("abcdefghijklmnopqrstuvwxyz"))

func rotateLetterOnce(_ l: Character) -> Character {
    let lowerAlphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let upperAlphabet = Array("abcdefghijklmnopqrstuvwxyz".uppercased())

    if l.isLowercase {
        let index = lowerAlphabet.firstIndex(of: l)!
        let rotated = Array(rotateAlphabetOnce("abcdefghijklmnopqrstuvwxyz"))
        return rotated[index]

    } else if l.isUppercase {
        let index = upperAlphabet.firstIndex(of: l)!
        let rotated = Array(rotateAlphabetOnce("abcdefghijklmnopqrstuvwxyz".uppercased()))
        return rotated[index]
    }

    return Character("")
}

// print(rotateLetterOnce("a"))
