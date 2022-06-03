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
    
    func testValidatePasswordIsValidatePassword() throws {
            let result = try validationService.validatePassword("asdf343ffff")
            XCTAssertNoThrow(result)
        }
        
    func testValidatePasswordIsInvalideValue() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validatePassword(nil))
        {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
        
    }
    
    func testValidatePasswordTooShort() throws {
        let expectedError = ValidationError.passwordToShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validatePassword("1234567"))
        {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
 
    }
    
    func testValidationPasswordTooLong() throws {
        let expectedError = ValidationError.passwordToLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validatePassword("245345234245fdbxbvxfgfb43534bvcxbcvxbxvbxcvb4545vbx"))
        {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription )
        
    }
    
}
