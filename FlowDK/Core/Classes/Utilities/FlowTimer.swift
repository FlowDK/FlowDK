import Foundation

open class FlowTimer {
  open var fps: Int {
    set { displaylink.preferredFramesPerSecond = newValue }
    get { return displaylink.preferredFramesPerSecond }
  }
  
  fileprivate var initialDate: Date!
  fileprivate var displaylink = CADisplayLink()
  fileprivate var timeFunction: ((Double) -> Bool)?
  fileprivate var duration = 0.0
  fileprivate var usesDuration = false
  
  public init(fps: Int) {
    displaylink = CADisplayLink(target: self,
                                selector: #selector(fireTimeFunction(_:)))
    displaylink.add(to: .current, forMode: .default)
    displaylink.preferredFramesPerSecond = fps
    self.fps = fps
  }
  
  open func fire(_ function:@escaping (_ time: Double) -> Bool) {
    displaylink.isPaused = false
    fire(function, duration: 0)
    usesDuration = false
  }
  
  open func fire(_ function:@escaping (_ time: Double) -> Bool, duration: TimeInterval) {
    usesDuration = true
    timeFunction = function
    initialDate = Date()
    self.duration = duration
  }
  
  open func invalidate() {
    displaylink.isPaused = true
    duration = 0.0
  }
  
  @objc fileprivate func fireTimeFunction(_ displayLink: CADisplayLink) {
    if let timeFunction = timeFunction {
      var time = Date().timeIntervalSince(initialDate)
      
      // This makes sure it always ends at duration where you are intending it to end, unless
      // explicitly stopped
      if usesDuration {
        time = min(time, duration)
      }
      
      let stop = timeFunction(time)
      if stop || (usesDuration && time == duration) {
        invalidate()
      }
    }
  }
}
