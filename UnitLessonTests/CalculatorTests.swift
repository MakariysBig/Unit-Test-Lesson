import XCTest
@testable import UnitLesson

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
        try super.tearDownWithError()
    }

    func testSumCalculator() throws {
        let result = calculator.doSum(firstValue: 5, secondValue: 5)
        
        XCTAssertEqual(result, 10)
    }

    func testSubtractCalculator() throws {
        let result = calculator.doSubstruct(firstValue: 10, secondValue: 5)
        
        XCTAssertEqual(result, 5)
    }
    
    func testMultiplyCalculator() throws {
        let result = calculator.doMultiply(firstValue: 5, secondValue: 5)
        let exeptedResult = Double(5 * 5)
        
        XCTAssertEqual(result, exeptedResult)
    }
    

}
