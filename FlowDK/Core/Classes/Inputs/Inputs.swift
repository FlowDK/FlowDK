import UIKit

public class Inputs {
  public let inputs: [InputType]
  public private(set) var currentInputIndex: Int?
  
  public init(_ inputs: [InputType]) {
    self.inputs = inputs
    currentInputIndex = (inputs.count > 0) ? 0 : nil
  }
  
  public func show(_ viewController: UIViewController) {
    // TODO: Card System
    // TODO: Show first input
  }
}
