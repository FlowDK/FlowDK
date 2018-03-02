import Foundation

extension Dictionary {
  mutating func update(other:Dictionary) {
    for (key,value) in other {
      self.updateValue(value, forKey:key)
    }
  }
}
