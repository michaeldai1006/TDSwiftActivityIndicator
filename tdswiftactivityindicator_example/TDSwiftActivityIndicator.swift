import Foundation
import UIKit

class TDSwiftActivityIndicator {
    var indicatorColor: UIColor
    var backgroundWidth: CGFloat
    var indicatorWidth: CGFloat
    
    var presentedIndicatorBackgroundView: UIView?
    var presentedIndicatorView: UIView?
    
    var indicatorBackgroundView: UIView {
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: 0, width: backgroundWidth, height: backgroundWidth)
        bgView.backgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha: 0.7)
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 10
        return bgView
    }
    
    var indicatorView: UIView {
        let indicatorView = UIView()
        indicatorView.frame = CGRect(x: 0, y: 0, width: indicatorWidth, height: indicatorWidth)
        indicatorView.backgroundColor = indicatorColor
        indicatorView.alpha = 0.9
        indicatorView.clipsToBounds = true
        indicatorView.layer.cornerRadius = indicatorView.frame.size.width/2
        return indicatorView
    }
    
    init(indicatorColor: UIColor = .white, backgroundWidth: CGFloat = 80.0, indicatorWidth: CGFloat = 10.0) {
        self.indicatorColor = indicatorColor
        self.backgroundWidth = backgroundWidth
        self.indicatorWidth = indicatorWidth
    }
    
    func present(onViewController viewController: UIViewController) {
        // Disable user interaction if vc is currently visible
        if isViewControllerVisible(viewController: viewController) { manageUserInteractions(userInteractionEnabled: false) }
        
        // Background view
        presentedIndicatorBackgroundView = self.indicatorBackgroundView
        presentedIndicatorBackgroundView!.center = viewController.view.center
        
        // Indicator view
        presentedIndicatorView = self.indicatorView
        presentedIndicatorView!.center = presentedIndicatorBackgroundView!.center
        
        // Animation
        animatesIndicatorView(view: presentedIndicatorView!)
        
        // Present
        viewController.view.addSubview(presentedIndicatorBackgroundView!)
        viewController.view.addSubview(presentedIndicatorView!)
    }
    
    func dismiss() {
        if let presentedIndicatorBackgroundView = self.presentedIndicatorBackgroundView { presentedIndicatorBackgroundView.removeFromSuperview() }
        if let presentedIndicatorView = self.presentedIndicatorView { presentedIndicatorView.removeFromSuperview() }
    }
    
    private func animatesIndicatorView(view: UIView){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 7, options: [.repeat, .curveEaseOut], animations: {
            view.transform = .init(scaleX: 5, y: 5)
            view.alpha = 0
        }, completion: nil)
    }
    
    private func isViewControllerVisible(viewController: UIViewController) -> Bool {
        return viewController.isViewLoaded && viewController.view.window != nil
    }
    
    private func manageUserInteractions(userInteractionEnabled enabled: Bool) {
        if enabled {
            UIApplication.shared.endIgnoringInteractionEvents()
        } else {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
}
