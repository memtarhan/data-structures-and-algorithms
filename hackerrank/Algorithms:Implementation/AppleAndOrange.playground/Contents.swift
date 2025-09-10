/*
 * Complete the 'countApplesAndOranges' function below.
 *
 * The function accepts following parameters:
 *  1. INTEGER s
 *  2. INTEGER t
 *  3. INTEGER a
 *  4. INTEGER b
 *  5. INTEGER_ARRAY apples
 *  6. INTEGER_ARRAY oranges
 */

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) {
    var newApples = apples.map { $0 + a }
    var newOranges = oranges.map { $0 + b }

    let applesFellOnTheHouse = newApples.filter { $0 >= s && $0 <= t }.count
    print(applesFellOnTheHouse)
    
    let orangesFellOnTheHouse = newOranges.filter { $0 >= s && $0 <= t }.count
    print(orangesFellOnTheHouse)
}


countApplesAndOranges(s: 7, t: 10, a: 4, b: 12, apples: [2, 3, -4], oranges: [3, -2, -4])

countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6])
