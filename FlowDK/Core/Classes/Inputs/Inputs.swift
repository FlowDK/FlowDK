import UIKit

public class Inputs {
  public let inputs: [InputViewControllerMapType]
  public private(set) var currentInputIndex: Int?
  
  public init(_ inputs: [InputViewControllerMapType]) {
    self.inputs = inputs
    currentInputIndex = (inputs.count > 0) ? 0 : nil
  }
  
  public func show(_ viewController: UIViewController) -> InputsViewController {
    // TODO: Card System
    // TODO: Show first input
    let inputsViewController = InputsViewController()
    viewController.show(inputsViewController, sender: self)
    return inputsViewController
  }
}
