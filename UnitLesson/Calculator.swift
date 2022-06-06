import Foundation

class Calculator {
    
    func doSum(firstValue: Double, secondValue: Double) -> Double {
        let result = firstValue + secondValue
        return result
    }
    
    func doSubstruct(firstValue: Double, secondValue: Double) -> Double {
        let result = firstValue - secondValue
        return result
    }
    
    func doMultiply(firstValue: Double, secondValue: Double) -> Double {
        let result = firstValue * secondValue
        return result
    }
    
    func doDivide(firstValue: Double, secondValue: Double) throws -> String {
        if secondValue != 0 {
            let result = firstValue / secondValue
            return String(result)
        } else {
            return CalculatorError.notDivideByZero.errorDescription
        }
    }
}

enum CalculatorError: Error {
    case notDivideByZero
    
    var errorDescription: String {
        switch self {
        case .notDivideByZero:
            return "Impossible divide by zero"
        }
    }
}
