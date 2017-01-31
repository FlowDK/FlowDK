import UIKit

public extension UIWindow {
    public convenience init(rootViewController: UIViewController, makeKeyAndVisible: Bool = true) {
        self.init(frame: UIScreen.main.bounds)
        self.rootViewController = rootViewController
        if makeKeyAndVisible {
            self.makeKeyAndVisible()
        }
    }
}
