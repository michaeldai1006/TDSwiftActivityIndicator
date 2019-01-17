import Foundation
import UIKit

class TDSwiftActivityIndicator {
    init() {
        
    }
    
    func present(onViewController viewController: UIViewController) {
        
    }
    
    private func isViewControllerVisible(viewController: UIViewController) -> Bool {
        return viewController.isViewLoaded && viewController.view.window != nil
    }
    
    private func manageUserInteraction(userInteractionEnabled enabled: Bool) {
        if enabled {
            UIApplication.shared.endIgnoringInteractionEvents()
        } else {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
}
