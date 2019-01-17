import Foundation
import UIKit

class TDSwiftActivityIndicator {
    
    var backgroundWidth: CGFloat
    
    var indicatorBackgroundView: UIView {
        let bgView: UIView = UIView()
        bgView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        bgView.backgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha: 0.7)
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 10
        return bgView
    }
    
    init(backgroundWidth: CGFloat = 80.0) {
        self.backgroundWidth = backgroundWidth
    }
    
    func present(onViewController viewController: UIViewController) {
        let bgView = indicatorBackgroundView
        bgView.center = viewController.view.center
        viewController.view.addSubview(bgView)
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
