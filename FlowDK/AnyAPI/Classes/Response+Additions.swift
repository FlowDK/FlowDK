import Alamofire

extension DataResponse {
  var string: NSString? {
    guard let data = data else { return nil }
    return NSString(data: data, encoding: 4)
  }
}
