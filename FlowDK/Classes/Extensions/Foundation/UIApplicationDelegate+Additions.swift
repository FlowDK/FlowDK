import Foundation

public protocol FlowDKApplicationDelegate: UIApplicationDelegate {
  var window: UIWindow? { get set }
}

public extension FlowDKApplicationDelegate {
  public func setupWindow(withRootViewController rootViewController: UIViewController, makeKeyAndVisible: Bool = true) {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = rootViewController
    if makeKeyAndVisible {
      window.makeKeyAndVisible()
    }
    
    self.window = window
  }
}
