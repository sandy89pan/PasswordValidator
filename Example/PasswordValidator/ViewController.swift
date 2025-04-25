import UIKit
import PasswordValidator

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let testPassword = "abc12345"
        print("Password valid:", PasswordValidator.isValid(password: testPassword))
    }
}
