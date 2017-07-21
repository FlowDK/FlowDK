import UIKit

public func CGRectFromEdgeInsets(_ rect: CGRect, edgeInsets: UIEdgeInsets) -> CGRect {
  return CGRect(
    x: rect.origin.x + edgeInsets.left,
    y: rect.origin.y + edgeInsets.top,
    width: rect.size.width - edgeInsets.left - edgeInsets.right,
    height: rect.size.height - edgeInsets.top - edgeInsets.bottom);
}

public extension CGRect {
  public func inset(_ dx: CGFloat, dy:CGFloat) -> CGRect {
    return self.insetBy(dx: dx, dy: dy)
  }
}
