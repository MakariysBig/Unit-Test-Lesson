import XCTest
@testable import UnitLesson

class CarTests: XCTestCase {
    
    var car: Car!

    override func setUpWithError() throws {
        try super.setUpWithError()
        car = Car()
    }

    override func tearDownWithError() throws {
        car = nil
    }

    func testStartCarBentley() throws {
        // Given
        
        // When
        car.start(carType: .bentley)
        
        // Then
        
        XCTAssertEqual(car.speed, 300)
        XCTAssertEqual(car.price, 100_000)
        XCTAssertEqual(car.status, "Premium")
        XCTAssertEqual(car.color, .white)
        XCTAssert(car.isAvailable)
    }
    
    func testStartCarAudi() throws {
        // Given
        
        // When
        car.start(carType: .audi)
        
        // Then
        
        XCTAssertEqual(car.speed, 240)
        XCTAssertEqual(car.price, 50000)
        XCTAssertEqual(car.status, "Average")
        XCTAssertEqual(car.color, .white)
        XCTAssert(car.isAvailable)
    }

    func testStartCarLada() throws {
        // Given
        
        // When
        car.start(carType: .lada)
        
        // Then
        
        XCTAssertEqual(car.speed, 180)
        XCTAssertEqual(car.price, 27_000)
        XCTAssertEqual(car.status, "Budget")
        XCTAssertEqual(car.color, .white)
        XCTAssert(car.isAvailable)
    }
    
    func testStartCarIsDifferentColor() throws {
        car.start(carType: .bentley, color: .red)
        XCTAssertEqual(car.color, .red)
    }
    
    func testIsCArTrue() throws {
        let result = car.isCar(isCar: true)
        XCTAssertEqual(result, true)
    }
    
    func testIsCArFalse() throws {
        let result = car.isCar(isCar: false)
        XCTAssertEqual(result, false)
    }
    
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
