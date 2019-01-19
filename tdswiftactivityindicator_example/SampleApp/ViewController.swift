import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create indicator instance and present
        let indicator = TDSwiftActivityIndicator()
        indicator.present(onViewController: self)
    }
}

