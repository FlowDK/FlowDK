import UIKit

enum InputState {
  case complete
}

class Inputs {
  let inputs: [InputType]
  
  init(inputs: [InputType]) {
    self.inputs = inputs
  }
}

class Input<T>: InputType {
  var response: (Input<T>, T, InputState)->() = { _, _, _ in
    
  }
  init(response: @escaping (Input<T>, T, InputState)->()) {
    self.response = response
  }
}

protocol InputType {
  
}
