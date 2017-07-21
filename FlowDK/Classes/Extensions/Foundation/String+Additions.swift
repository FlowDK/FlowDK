public extension String {
  public var url: URL? { return URL(string: self) }
  
  public var length: Int { return characters.count }
  
  public var urlEncoded: String {
    return CFURLCreateStringByAddingPercentEscapes(
      nil,
      self as CFString!,
      nil,
      "!*'();:@&=+$,/?%#[]" as CFString!,CFStringBuiltInEncodings.UTF8.rawValue
      ) as String
  }
}
