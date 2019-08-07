import SnapKit

public enum Direction {
  case left, right
}

public class InputsViewController: UIViewController {
  public var inputs: Inputs?
  
  public var inputContainerView: InputContainerView?
  
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    definesPresentationContext = true
    providesPresentationContextTransitionStyle = true
    modalPresentationStyle = .overCurrentContext
    modalTransitionStyle = .crossDissolve
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
  }
  
//  public func transition<T: InputType>(to: InputViewController<T>, direction: Direction) {
//    
//  }
}
