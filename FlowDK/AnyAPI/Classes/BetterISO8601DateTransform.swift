import ObjectMapper

public class BetterISO8601DateTransform: TransformType {
  public typealias Object = Date
  public typealias JSON = String

  public let dateFormatter: ISO8601DateFormatter

  public init() {
    self.dateFormatter = ISO8601DateFormatter()
  }

  public init(dateFormatter: ISO8601DateFormatter) {
    self.dateFormatter = dateFormatter
  }

  open func transformFromJSON(_ value: Any?) -> Date? {
    if let dateString = value as? String {
      //remove milliseconds
      let range = dateString.startIndex..<dateString.endIndex
      let trimmedString = dateString.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression, range: range)

      return dateFormatter.date(from: trimmedString)
    }

    return nil
  }

  open func transformToJSON(_ value: Date?) -> String? {
    if let date = value {
      return dateFormatter.string(from: date)
    }

    return nil
  }
}
