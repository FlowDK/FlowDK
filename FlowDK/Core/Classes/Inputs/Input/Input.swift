import UIKit

public class Input<T>: InputType {
  public var response: (Input<T>, T, InputState)->() = { _, _, _ in
    
  }
  public init(response: @escaping (Input<T>, T, InputState)->()) {
    self.response = response
  }
}

public protocol InputType {
  //
}
