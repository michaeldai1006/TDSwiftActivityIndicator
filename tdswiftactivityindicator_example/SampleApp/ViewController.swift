import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create indicator instance and present
        let indicator = TDSwiftActivityIndicator()
        indicator.present(onViewController: self)
    }
}

