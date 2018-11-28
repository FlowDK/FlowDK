public extension Array {
  public var second: Element? {
    return object(atIndex: 1)
  }
  
  public var third: Element? {
    return object(atIndex: 2)
  }
  
  public var fourth: Element? {
    return object(atIndex: 3)
  }
  
  public var fifth: Element? {
    return object(atIndex: 4)
  }
  
  public var sixth: Element? {
    return object(atIndex: 5)
  }
  
  public var seventh: Element? {
    return object(atIndex: 6)
  }
  
  public var fortySecond: Element? {
    return object(atIndex: 41)
  }
  
  public var secondToLast: Element? {
    return (self.count >= 2) ? self[self.count - 2] : nil
  }
  
  public func to(index: Index) -> Array {
    var result = Array()
    for (i, element) in self.enumerated() {
      result.append(element)
      if i == index {
        return result
      }
    }
    return result
  }
  
  public func from(index: Index) -> Array {
    var result = Array()
    var i = index
    while i < self.count {
      result.append(self[i])
      i += 1
    }
    return result
  }
  
  public func object(atIndex index: Index) -> Element? {
    return (count >= index + 1) ? self[index] : nil
  }
}

public extension Array where Element: Equatable {
  public func index(of object : Element) -> Int? {
    return (self as NSArray).index(of: object)
  }
  
  @discardableResult
  public mutating func remove(object : Element) -> Element? {
    if let index = index(of: object) {
     return self.remove(at: index)
    }
    return nil
  }
  
  public func without(elements: [Element]) -> Array {
    var result = self
    for element in elements {
      result.remove(object: element)
    }
    return result
  }
}
