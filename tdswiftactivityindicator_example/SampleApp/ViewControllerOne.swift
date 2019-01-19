import UIKit

class ViewControllerOne: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        // Create indicator instance and present
//        let indicator = TDSwiftActivityIndicator()
//        indicator.present(onViewController: self)
//
//        // Dismiss indicator
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            indicator.dismiss()
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // ViewControllerTwo
        if segue.identifier == String(describing: ViewControllerTwo.self) {
            let vcTwo = segue.destination as! ViewControllerTwo
            vcTwo.vcOne = self
        }
    }
}

