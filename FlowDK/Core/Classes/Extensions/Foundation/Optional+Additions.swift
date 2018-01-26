import Foundation
import UIKit

public protocol Blankable: Emptyable {
  var isBlank: Bool { get }
}

public protocol Emptyable {
  var isEmpty: Bool { get }
}

public extension Optional where Wrapped: Emptyable {
  public var isEmpty: Bool {
    get {
      return self?.isEmpty ?? false
    }
  }
}

public extension Optional where Wrapped: Blankable {
  public var isBlank: Bool {
    get {
      return self?.isBlank ?? true
    }
  }
}

extension UIWindow: Blankable, Emptyable {
  public var isBlank: Bool {
    get {
      return false
    }
  }
  
  public var isEmpty: Bool {
    get {
      return false
    }
  }
}
