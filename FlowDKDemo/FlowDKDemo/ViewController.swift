import UIKit
import FlowDK

class ViewController: UIViewController {
  var inputs: Inputs!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Crayola.macaroniAndCheese
  
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.foo()
    }
  }
  
  func foo() {
    let input = TextInput()
    let input2 = TextInput()
    let input3 = Input<Date>()
    
    inputs = Inputs([
      InputViewControllerMap(input, TextInputViewController.self),
      InputViewControllerMap(input2, TextInputViewController.self),
      InputViewControllerMap(input3, InputViewController<Date>.self)
      ])
    inputs.show(self)
  }
}

