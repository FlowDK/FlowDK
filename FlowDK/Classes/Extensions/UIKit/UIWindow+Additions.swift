import UIKit

public extension UIWindow {
  public class func window(rootViewController: UIViewController, makeKeyAndVisible: Bool) -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = rootViewController
    if makeKeyAndVisible {
      window.makeKeyAndVisible()
    }
    return window
  }
}
