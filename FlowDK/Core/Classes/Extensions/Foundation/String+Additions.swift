public extension String {
  var url: URL? { return URL(string: self) }
  
  var urlEncoded: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
}
