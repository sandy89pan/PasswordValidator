import Foundation

public class PasswordValidator {
    public static func isValid(password: String) -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,12}$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
        let range = NSRange(location: 0, length: password.utf16.count)
        return regex.firstMatch(in: password, options: [], range: range) != nil
    }
}
