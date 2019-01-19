import UIKit

class ViewControllerOne: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create indicator instance and present
//        let indicator = TDSwiftActivityIndicator()
//        indicator.present(onViewController: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // ViewControllerTwo
        if segue.identifier == String(describing: ViewControllerTwo.self) {
            let vcTwo = segue.destination as! ViewControllerTwo
            vcTwo.vcOne = self
        }
    }
}

