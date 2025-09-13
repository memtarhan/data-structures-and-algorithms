import Foundation

// Complete the catAndMouse function below.
func catAndMouse(x: Int, y: Int, z: Int) -> String {
    let distanceX = abs(x - z)
    let distanceY = abs(y - z)

    if distanceX == distanceY {
        return "Mouse C"

    } else if distanceX > distanceY {
        return "Cat B"

    } else {
        return"Cat A"
    }
}

catAndMouse(x: 1, y: 2, z: 3) // Cat B
catAndMouse(x: 1, y: 3, z: 2) // Mouse C
