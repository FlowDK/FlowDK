import Foundation

open class FlowTimer {
  open var fps = 60.0
  
  fileprivate var initialDate: Date!
  fileprivate var timer = Timer()
  fileprivate var timeFunction: ((Double) -> Bool)?
  fileprivate var duration = 0.0
  fileprivate var usesDuration = false
  
  public init(fps: Double) {
    self.fps = fps
  }
  
  open func fire(_ function:@escaping (_ time: Double) -> Bool) {
    fire(function, duration: 0)
    usesDuration = false
  }
  
  open func fire(_ function:@escaping (_ time: Double) -> Bool, duration: TimeInterval) {
    invalidate()
    timeFunction = function
    initialDate = Date()
    self.duration = duration
    timer = Timer.scheduledTimer(
      timeInterval: 1.0 / fps,
      target: self,
      selector: Selector(("fireTimeFunction")),
      userInfo: nil,
      repeats: true
    )
  }
  
  open func invalidate() {
    timer.invalidate()
    duration = 0.0
    usesDuration = true
  }
  
  fileprivate func fireTimeFunction() {
    if let timeFunction = timeFunction {
      var time = Date().timeIntervalSince(initialDate)
      
      // This makes sure it always ends at duration where you are intending it to end, unless
      // explicitly stopped
      if usesDuration {
        time = min(time, duration)
      }
      
      let stop = !timeFunction(time)
      if stop || (usesDuration && time == duration) {
        invalidate()
      }
    }
  }
}
