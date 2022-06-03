import XCTest
@testable import UnitLesson

class ValidationServiceTests: XCTestCase {
    
    var validationService: ValidationService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        validationService = ValidationService()
    }

    override func tearDownWithError() throws {
        validationService = nil
        try super.tearDownWithError()
    }

    func testValidateUserNameValidUserName() throws {
        let result = try validationService.validateUsername("Username")
        XCTAssertNoThrow(result)
    }
    
    func testValidateUserNameInvalidUserName() throws {
        
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validateUsername(nil))
        {
            thrownError in
                error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)

    }
    
    
    func testValidateUserNameTooShort() throws {
        let expectedError = ValidationError.userNameToShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validateUsername("BG"))
        {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)

    }
    
    func testValidateUserNameTooLong() throws {
        let expectedError = ValidationError.userNameToLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validateUsername("BGasdfsdfasdfasdfsadfsadfsadfasdf"))
        {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)

    }
    
}
