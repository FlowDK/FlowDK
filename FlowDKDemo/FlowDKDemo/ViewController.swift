import UIKit
import FlowDK

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Crayola.macaroniAndCheese
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.foo()
    }
  }
  
  func foo() {
    let input = TextInput { input, value, state in
      print(value)
    }
    
    let inputs = Inputs([input])
    inputs.show(self)
  }
}

