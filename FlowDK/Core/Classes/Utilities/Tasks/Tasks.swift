import Foundation

class TaskQueue {
  private var tasks = [Task]()
  var currentIndex: Int?
  
  init() {
    
  }
  
  func addTask(_ task: Task) {
    tasks.append(task)
  }
  
  fileprivate func next() {
    if let currentIndex = self.currentIndex {
      self.currentIndex = currentIndex + 1
    }
  }
  
  fileprivate func cancel() {
    
  }
}

class Task: NSObject {
  var queue: TaskQueue
  
  var fire: ((_ task: Task, _ queue: TaskQueue)->())?
  
  init(_ queue: TaskQueue) {
    self.queue = queue
  }
}
