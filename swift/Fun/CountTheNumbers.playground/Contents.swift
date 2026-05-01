import Foundation

/*
 
 Count the numbers
 Write a function that accepts an array of integers and returns the number of times a specific
 digit appears in any of its numbers.
 
*/

func count(_ target: Character, in numbers: [Int]) -> Int {
    var total = 0
    
    for number in numbers {
        let stringValue = String(number)
        
        for character in stringValue {
            if character == target {
                total += 1
            }
        }
    }
    
    return total
}

func count2(_ target: Character, in numbers: [Int]) -> Int  {
    numbers.reduce(0) { total, next in
        let newTotal = String(next).count { $0 == target }
        return total + newTotal
    }
}

count("5", in: [5, 15, 55, 515])
count2("5", in: [5, 15, 55, 515])
