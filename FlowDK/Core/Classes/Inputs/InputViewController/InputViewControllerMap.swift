import Foundation

public protocol InputViewControllerMapType {
  
}

public struct InputViewControllerMap<Value, T: InputViewController<Value>>: InputViewControllerMapType {
  public let input: Input<Value>
  public let inputViewControllerType: T.Type
  
  public init(_ input: Input<Value>, _ inputViewControllerType: T.Type) {
    self.input = input
    self.inputViewControllerType = inputViewControllerType
  }
}
