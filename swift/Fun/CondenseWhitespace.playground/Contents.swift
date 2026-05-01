import Foundation

/*

 Condense whitespace
 Write a function that accepts a String, and return it with any consecutive spaces replaced with
 a single space.

 */

func condenseWhitespace(in input: String) -> String {
    var seenSpace = false
    var returnValue = ""
    
    for letter in input {
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
            
        } else {
            seenSpace = false
        }
        
        returnValue.append(letter)
    }
    
    return returnValue
}

condenseWhitespace(in: "a  b  c")
