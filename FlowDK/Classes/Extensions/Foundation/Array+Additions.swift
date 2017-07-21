extension Array {
  mutating func remove<U: Equatable>(_ object: U) -> Bool {
    for (idx, objectToCompare) in enumerated() {
      if let to = objectToCompare as? U {
        if object == to {
          remove(at: idx)
          return true
        }
      }
    }
    return false
  }
}
