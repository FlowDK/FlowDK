public extension String {
  public var url: URL? { return URL(string: self) }
  
  public var urlEncoded: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
}
