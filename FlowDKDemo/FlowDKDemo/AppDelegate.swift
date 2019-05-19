import UIKit
import FlowDK

@UIApplicationMain
class AppDelegate: UIResponder, FlowDKApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    setupWindow(withRootViewController: ViewController())
    
    return true
  }
}

