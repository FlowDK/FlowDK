import UIKit

public extension UIWindow {
    public static func window(rootViewController: UIViewController, makeKeyAndVisible: Bool = true) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootViewController
        
        if makeKeyAndVisible {
            window.makeKeyAndVisible()
        }
        return window
    }
}
