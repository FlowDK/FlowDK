import UIKit

public extension UIView {
  public func addSubviews(_ views: UIView...) {
    addSubviews(views)
  }
  
  public func addSubviews(_ views: [UIView]) {
    for view in views { addSubview(view) }
  }
  
  public func makeCircle() {
    let shorterSide = min(bounds.height, bounds.width)
    layer.cornerRadius = shorterSide * 0.5
    layer.masksToBounds = true
  }
}

import UIKit

public enum LayoutOrientation {
  case horizontal, vertical
}

public protocol LayoutItem { }

extension UIView: LayoutItem { }
extension Double: LayoutItem { }
extension Int: LayoutItem { }
extension CGFloat: LayoutItem { }

public extension UIView {
  // Everything from here to `height` isn't really needed in swift, since view.frame.size.width = x works,
  // but it is a little neater, and this works very well w/ objective-c so it's staying in
  public var origin: CGPoint { get { return frame.origin } set(origin) { frame.origin = origin} }
  public var size: CGSize { get { return frame.size } set(size) { frame.size = size} }
  
  public var x: CGFloat { get { return frame.minX } set(x) { frame.origin.x = x } }
  public var y: CGFloat { get { return frame.minY } set(y) { frame.origin.y = y } }
  public var width: CGFloat { get { return bounds.width } set(width) { bounds.size.width = width } }
  public var height: CGFloat { get { return bounds.height} set(height) { bounds.size.height = height } }
  
  public var left: CGFloat { get { return x } set(left) { x = left } }
  public var top: CGFloat { get { return y } set(top) { y = top } }
  public var right: CGFloat  { get { return frame.maxX } set(right) { x = right - width } }
  public var rightMargin: CGFloat {
    get {
      guard let superview = superview else { return 0 }
      return superview.width - right
    }
    set {
      if let superview = superview {
        right = superview.width - newValue
      }
    }
  }
  
  public var bottom: CGFloat {
    get { return frame.maxY }
    set { y = newValue - height }
  }
  public var bottomMargin: CGFloat {
    get {
      guard let superview = superview else { return 0 }
      return superview.height - bottom
    }
    set {
      if let superview = superview {
        bottom = superview.height - newValue
      }
    }
  }
  
  // Similar to center, but in relation to itself
  public var middle: CGPoint { get { return CGPoint(x: width / 2, y: height / 2) }
    set(middle) {
      center.x += (self.middle.x - middle.x)
      center.y += (self.middle.y - middle.y)
    }
  }
  
  // Heirarchy
  public func bringToFront() -> UIView { superview?.bringSubview(toFront: self); return self }
  public func sendToBack() -> UIView { superview?.sendSubview(toBack: self); return self }
  
  // Frame in other views
  public func frameInWindow() -> CGRect { return frameInView(nil) }
  public func frameInView(_ view: UIView?) -> CGRect { return convert(bounds, to: view) }
  
  public func moveToView(_ view: UIView?) {
    view?.addSubview(self)
    frame = frameInView(view)
  }
  
  // Ceter the view horizontally or vertically
  public func center(orientation: LayoutOrientation) {
    guard let superview = superview else {
      // TODO: log a warning
      print("center(orientation: LayoutOrientation) You cannot center a view that does not have a superview.")
      return
    }
    
    switch orientation {
    case .horizontal:
      center.x = superview.middle.x
    case .vertical:
      center.y = superview.middle.y
    }
  }
  
  public func center(subviews: [UIView], orientation: LayoutOrientation) {
    for subview in subviews {
      subview.center(orientation: orientation)
    }
  }
  
  // MARK: Layout helpers
  /**
   layout your views horizontally or vertically
   - parameter orienation: the orientation you want to lay out in, .Horizontal or .Vertical
   :items: the array of views and/or floats that represent relative spacing
   
   Example:
   
   - [1, view1, 0.5, view2, 1] will space out view1 and view2 such that the margin of the left and the right are the same, but the space between the views will be half that of the margin
   */
  public func layout(orientation: LayoutOrientation, items: [LayoutItem]) {
    var delta: CGFloat = 0
    var totalPercentage: CGFloat = 0
    
    // Get total deltas first
    for item in items {
      if let view = item as? UIView {
        switch orientation {
        case .horizontal:
          delta += view.width
        case .vertical:
          delta += view.height
        }
      } else if let number = item as? Int {
        delta += CGFloat(number)
      } else if let number = item as? CGFloat {
        delta += number
      } else if let percentage = item as? Double {
        totalPercentage += CGFloat(percentage)
      }
    }
    
    // Leftover delta
    var leftoverDelta: CGFloat!
    if orientation == .horizontal {
      leftoverDelta = width - delta
    } else if orientation == .vertical {
      leftoverDelta = height - delta
    }
    
    let ratio: CGFloat = leftoverDelta / totalPercentage
    
    // Layout the views. O(2n)
    delta = 0
    for item in items {
      if let view = item as? UIView {
        switch orientation {
        case .horizontal:
          view.left = delta
          delta = view.right
        case .vertical:
          view.top = delta
          delta = view.bottom
        }
      } else if let number = item as? Int {
        delta += CGFloat(number)
      } else if let number = item as? CGFloat {
        delta += number
      } else if let percentage = item as? Double {
        delta += ratio * CGFloat(percentage)
      }
    }
  }
}


