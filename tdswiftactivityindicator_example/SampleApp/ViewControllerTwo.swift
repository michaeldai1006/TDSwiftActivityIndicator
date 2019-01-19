import UIKit

class ViewControllerTwo: UIViewController {

    var vcOne: UIViewController?
    
    @IBAction func presentOnVC1BtnClicked(_ sender: UIButton) {
        // Create indicator instance and present on vc1
        if let vcOne = vcOne {
            let indicator = TDSwiftActivityIndicator()
            indicator.present(onViewController: vcOne)
        }
    }
}
