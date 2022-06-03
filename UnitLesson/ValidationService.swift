import Foundation

struct ValidationService {
    func validateUsername(_ username: String?) throws -> String {
        guard let username = username else {
            throw ValidationError.invalidValue
        }
        
        guard username.count >= 3 else { throw ValidationError.userNameToShort }
        guard username.count < 20 else { throw ValidationError.userNameToLong }

        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else {
            throw ValidationError.invalidValue
        }
 
        
        guard password.count >= 8 else { throw ValidationError.passwordToShort }
        guard password.count < 20 else { throw ValidationError.passwordToLong }

        return password
    }
    
}

enum ValidationError: Error {
    case invalidValue
    case userNameToLong
    case userNameToShort
    case passwordToLong
    case passwordToShort
    
    var errorDescription: String {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value"
        case .userNameToLong:
            return "Your username is too long"
        case .userNameToShort:
            return "Your username is too short"
        case .passwordToLong:
            return "Your password is too long"
        case .passwordToShort:
            return "Your password is too short"
        }
    }
}
