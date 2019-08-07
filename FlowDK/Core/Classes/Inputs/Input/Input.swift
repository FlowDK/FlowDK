import UIKit

public protocol InputType {
  var state: InputState { get set }
}

public class Input<Value>: InputType {
//  public typealias InputViewControllerType = InputViewController<Value, Input<Value>>.Type
  
  public typealias InputResponse = (Input<Value>)->()
  
  public var state: InputState = .initial
  public var value: Value?
  public var inputViewControllerType: InputViewController<Value>.Type?
  
  public init() {
    
  }
//  public init<T: InputViewController<Value, U>, U: Input<Value>>(_ inputViewControllerType: T.Type) {
//  }
}
