import CocoaLumberjack

public enum LoggerType {
  case verbose, debug, info, warning, error, other(typeName: String)
}

public class Logger {
  public class func initialize() {
    DDLog.add(DDTTYLogger.sharedInstance)
    DDLog.add(DDASLLogger.sharedInstance)
    
    let fileLogger: DDFileLogger = DDFileLogger()
    fileLogger.rollingFrequency = TimeInterval(60 * 60 * 20) // 24 hours
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7
    
    DDLog.add(fileLogger)
  }
  
  public class func log(_ message: String, _ type: LoggerType = .debug) {
    switch type {
    case .verbose:
      DDLogVerbose(message)
    case .debug:
      DDLogDebug(message)
    case .info:
      DDLogInfo(message)
    case .warning:
      DDLogInfo(message)
    case .error:
      DDLogError(message)
    case .other(let typeName):
      DDLogInfo("[\(typeName)] \(message)")
    }
  }
}
