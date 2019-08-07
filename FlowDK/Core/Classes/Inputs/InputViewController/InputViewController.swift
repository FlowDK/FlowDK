import SnapKit

public protocol InputViewControllerDelegate {
  func didSetValue(value: Any?)
}

public class InputViewController<Value>: UIViewController {  
  public override func viewDidLoad() {
    super.viewDidLoad()
    update()
  }
  
  func update() {
    // Override
  }
}
