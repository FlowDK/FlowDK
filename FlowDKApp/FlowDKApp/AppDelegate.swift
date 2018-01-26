import UIKit
import FlowDK

@UIApplicationMain
class AppDelegate: UIResponder, FlowDKApplicationDelegate  {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    setupWindow(withRootViewController: ViewController())
    
    return true
  }
}

