import UIKit

extension UIAlertController {
  public func addActions(_ actions: UIAlertAction...) {
    addActions(actions)
  }

  public func addActions(_ actions: [UIAlertAction]) {
    for action in actions {
      self.addAction(action)
    }
  }
}
