import UIKit

public extension UIView {
  public func addSubviews(_ views: UIView...) {
    addSubviews(views)
  }
  
  public func addSubviews(_ views: [UIView]) {
    for view in views { addSubview(view) }
  }
}
