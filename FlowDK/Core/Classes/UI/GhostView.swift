import SnapKit

open class GhostView: UIView {
  open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if view == self {
      return nil
    }
    return view
  }
}
