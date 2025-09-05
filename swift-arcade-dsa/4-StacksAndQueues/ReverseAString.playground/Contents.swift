import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reverses the String
 using a stack.
 */

func solution(_ text: String) -> String {
    var arr = Array(text)
    var result = ""
    
    for _ in 0 ..< arr.count {
        result += String(arr.removeLast())
    }
    
    return result
}

solution("abc") // bca
solution("Would you like to play a game?")
