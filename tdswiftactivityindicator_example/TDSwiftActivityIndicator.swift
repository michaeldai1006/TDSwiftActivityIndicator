import Foundation
import UIKit

class TDSwiftActivityIndicator {
    var indicatorView: TDSwiftIndicatorView
    var indicatorBackgroundView: TDSwiftIndicatorBackgroundView
    
    init(indicatorColor: UIColor = .white, indicatorWidth: CGFloat = 10.0, backgroundWidth: CGFloat = 80.0) {
        self.indicatorView = TDSwiftIndicatorView(width: indicatorWidth, color: indicatorColor)
        self.indicatorBackgroundView = TDSwiftIndicatorBackgroundView(width: backgroundWidth)
    }
    
    func present(onViewController viewController: UIViewController) {
        // Disable user interaction if vc is currently visible
//        if isViewControllerVisible(viewController: viewController) { manageUserInteractions(userInteractionEnabled: false) }
        
        // Background view
        indicatorBackgroundView.center = viewController.view.center
        
        // Indicator view
        indicatorView.center = indicatorBackgroundView.center
        
        // Present
        viewController.view.addSubview(indicatorBackgroundView)
        viewController.view.addSubview(indicatorView)
    }
    
//    func dismiss() {
//        if let presentedIndicatorBackgroundView = self.presentedIndicatorBackgroundView { presentedIndicatorBackgroundView.removeFromSuperview() }
//        if let presentedIndicatorView = self.presentedIndicatorView { presentedIndicatorView.removeFromSuperview() }
//    }
    
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
    
    class TDSwiftIndicatorView: UIView {
        init(width: CGFloat, color: UIColor) {
            super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
            self.backgroundColor = color
            self.alpha = 0.9
            self.clipsToBounds = true
            self.layer.cornerRadius = width/2
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("Init from coder is forbidden")
        }
        
        override func willMove(toWindow newWindow: UIWindow?) {
            print("Will move to window!!!")
            startAnimation()
        }
        
        private func startAnimation(){
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 7, options: [.repeat, .curveEaseOut], animations: {
                    self.transform = .init(scaleX: 5, y: 5)
                    self.alpha = 0
                }, completion: nil)
            }
        }
    }
    
    class TDSwiftIndicatorBackgroundView: UIView {
        init(width: CGFloat) {
            super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
            self.backgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha: 0.7)
            self.clipsToBounds = true
            self.layer.cornerRadius = 10
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("Init from coder is forbidden")
        }
    }
}
