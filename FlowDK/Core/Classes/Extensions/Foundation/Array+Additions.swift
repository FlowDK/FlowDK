public extension Array {
  var second: Element? {
    return object(atIndex: 1)
  }
  
  var third: Element? {
    return object(atIndex: 2)
  }
  
  var fourth: Element? {
    return object(atIndex: 3)
  }
  
  var fifth: Element? {
    return object(atIndex: 4)
  }
  
  var sixth: Element? {
    return object(atIndex: 5)
  }
  
  var seventh: Element? {
    return object(atIndex: 6)
  }
  
  var fortySecond: Element? {
    return object(atIndex: 41)
  }
  
  var secondToLast: Element? {
    return (self.count >= 2) ? self[self.count - 2] : nil
  }
  
  func to(index: Index) -> Array {
    var result = Array()
    for (i, element) in self.enumerated() {
      result.append(element)
      if i == index {
        return result
      }
    }
    return result
  }
  
  func from(index: Index) -> Array {
    var result = Array()
    var i = index
    while i < self.count {
      result.append(self[i])
      i += 1
    }
    return result
  }
  
  func object(atIndex index: Index) -> Element? {
    return (count >= index + 1) ? self[index] : nil
  }
}

public extension Array where Element: Equatable {
  func index(of object : Element) -> Int? {
    return (self as NSArray).index(of: object)
  }
  
  @discardableResult
  mutating func remove(object : Element) -> Element? {
    if let index = index(of: object) {
     return self.remove(at: index)
    }
    return nil
  }
  
  func without(elements: [Element]) -> Array {
    var result = self
    for element in elements {
      result.remove(object: element)
    }
    return result
  }
}
