import Foundation

/*

 Fizz Buzz
 Write a function that accepts a positive integer, and returns “Fizz” if the number is evenly
 divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s evenly divisible by three
 and five, or the original number for all other cases.

 */

func fizzBuzz(_ number: Int) -> String {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        return "Fizz Buzz"

    } else if number.isMultiple(of: 3) {
        return "Fizz"

    } else if number.isMultiple(of: 5) {
        return "Buzz"

    } else {
        return String(number)
    }
}

func fizzBuzz2(_ number: Int) -> String {
    switch (number.isMultiple(of: 3), number.isMultiple(of: 5)) {
    case (true, false): "Fizz"
    case (false, true): "Buzz"
    case (true, true): "Fizz Buzz"
    case (false, false): String(number)
    }
}

fizzBuzz(11)
fizzBuzz2(10)
