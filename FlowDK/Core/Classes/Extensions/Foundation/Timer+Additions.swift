import Foundation

private class Block<T> {
  let f: T
  init (f: T) { self.f = f }
}

public extension Timer {
  class func scheduledTimer(_ timeInterval: TimeInterval, block: @escaping ()->(), repeats: Bool) -> Timer {
    let block = Block<()->()>.init(f: block)
    return Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(Timer.block(_:)), userInfo: block, repeats: repeats)
  }
  
  class func scheduledTimer(_ timeInterval: TimeInterval, block: @escaping ()->()) -> Timer {
    return scheduledTimer(timeInterval, block: block, repeats: false)
  }
  
  @objc fileprivate class func block(_ timer: Timer) {
    if let block = timer.userInfo as? Block<()->()> {
      block.f()
    }
  }
}
