import Foundation

func isPalindrome(_ s: String) -> Bool {
    let cleaned = s.filter { $0.isLetter || $0.isNumber }.lowercased()

    return String(cleaned.reversed()) == cleaned
}

let s = "A man, a plan, a canal: Panama"
isPalindrome(s)
