import Foundation

/*
 * Complete the 'breakingRecords' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY scores as parameter.
 */

func breakingRecords(scores: [Int]) -> [Int] {
    var minCount = 0
    var maxCount = 0

    var minRecord = scores[0]
    var maxRecord = scores[0]

    for index in 1 ..< scores.count {
        let score = scores[index]

        if score < minRecord {
            print("old min: \(minRecord) - new min: \(score)")
            // new min record
            minRecord = score
            minCount += 1
            
        }

        if score > maxRecord {
            print("old max: \(maxRecord) - new max: \(score)")
            // new max record
            maxRecord = score
            maxCount += 1
        }
    }

    return [maxCount, minCount]
}

// print(breakingRecords(scores: [12, 24, 10, 24]))
// print(breakingRecords(scores: [10, 5, 20, 20, 4, 5, 2, 25, 1]))
print(breakingRecords(scores: [3, 4, 21, 36, 10, 28, 35, 5, 24, 42]))
