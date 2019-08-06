import SnapKit

public protocol InputViewDelegate {
  func didSetValue(value: Any?)
}

public class InputView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
