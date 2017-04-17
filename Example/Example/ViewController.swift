import UIKit
import FlowDK

class ViewController: UIViewController {
  let view1 = UIView()
  let view2 = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
    
    view1.backgroundColor = .blue
    view1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    view2.backgroundColor = .red
    view2.frame = CGRect(x: 120, y: 120, width: 50, height: 50)
    view.addSubviews([view1, view2])
  }
}

