import Foundation

func isAnagram(_ input: String, for original: String) -> Bool {
    var counts = [Character: Int]()
    
    for letter in input {
        counts[letter, default:0] += 1
    }
    
    for letter in original {
        counts[letter, default: 0] -= 1
    }
    
    return counts.values.allSatisfy { $0 == 0 }
}

isAnagram("stone", for: "tones")
