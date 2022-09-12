import UIKit


class FibonacciGenerator {
    
    static let numSteps = 50
    static var selectInitialNumbers: [Float64] = [11, 13]
    
    static func fibonacciSequence (numSteps: Int, sequenceForInitial: [Float64]) -> [Float64] {
        var sequence = sequenceForInitial
        if numSteps <= 1 {
            return sequence
        }
        for i in 0...(numSteps - 3) {
            let first = sequence[sequence.count-2]
            let second = sequence.last!
            sequence.append(first+second)
        }
        selectInitialNumbers = [sequence[numSteps-2], sequence[numSteps-1]]
        return sequence
    }
}
