import ObjectMapper
import Alamofire
import AlamofireNetworkActivityIndicator
import AlamofireObjectMapper

/**
 For File Uploads
 */
public struct FileUpload {
  let data: Data
  let name: String
  let fileName: String
  let mimeType: String
}

/**
 AnyAPI lets you connect easily to any (REST) API on the internet
 */
public class AnyAPI {
  private var sessionManager: SessionManager!
  
  /**
   Set to true if you are using SSL pinning. You must add valid certificates in the Main Bundle if this is true.
   */
  public var usesCertificatePinning = false {
    didSet {
      if usesCertificatePinning != oldValue {
        sessionManager = nil
      }
    }
  }
  
  /**
   The base URL for the API you are connecting to
   */
  public var baseURL: URL?
  
  /**
   The shared headers across all API calls
   */
  public var baseHeaders: HTTPHeaders?
  
  /**
   The shared parameters across all API calls
   */
  public var baseParameters: Parameters?
  
  /**
   Set this to true if you want to enable the activity indicator in the status bar when AnyAPI is waiting on a response from the API
   */
  public var activityIndicatorEnabled = true {
    didSet {
      updateActivityIndicator()
    }
  }
  
  /**
   Initializer
   */
  public init() {
    updateActivityIndicator()
  }
  
  private func updateActivityIndicator() {
    NetworkActivityIndicatorManager.shared.isEnabled = activityIndicatorEnabled
  }
  
  /**
   Make a request to the endpoint of your choice
   - parameter method: .get, .put, .post, .delete - The HTTP method for the endpoint you are hitting
   - parameter uri: The uri (without its base URL) e.g. "users"
   - parameter headers: (Optional) Additional headers to send along with this call
   
   - returns: The `DataRequest` generated to make the request
   */
  @discardableResult
  public func request(method: HTTPMethod = .get, uri: String, parameters: [String: Any]? = nil, headers: [String: String]? = nil) -> DataRequest {
    let baseInfo = self.baseInfo(uri: uri, parameters: parameters, headers: headers)
    return sessionManager.request(baseInfo.urlString, method: method, parameters: baseInfo.fullParameters, encoding: URLEncoding.default, headers: baseInfo.fullHeaders)
  }
  
  public func upload(_ fileUploads: [FileUpload], uri: String, parameters: [String: Any]? = nil, headers: [String: String]? = nil, completion: ((_ encodingResult: SessionManager.MultipartFormDataEncodingResult)->())? = nil) {
    let baseInfo = self.baseInfo(uri: uri, parameters: parameters, headers: headers)
    sessionManager.upload(multipartFormData: { multipartFormData in
      // Parameters
      for (key, value) in baseInfo.fullParameters {
        if let value = value as? String, let data = value.data(using: .utf8) {
          multipartFormData.append(data, withName: key)
        }
      }
      
      // File Uploads
      for fileUpload in fileUploads {
        multipartFormData.append(fileUpload.data, withName: fileUpload.name, fileName: fileUpload.fileName, mimeType: fileUpload.mimeType)
      }
    }, to: baseInfo.urlString) { encodingResult in
      completion?(encodingResult)
    }
  }
  
  private func baseInfo(uri: String, parameters: [String: Any]? = nil, headers: [String: String]? = nil) -> (urlString: String, fullParameters: [String: Any], fullHeaders: [String: String]) {
    createSessionManagerIfNeeded()
    
    var urlString: String!
    if let url = URL(string: uri), let _ = url.host {
      urlString = uri
    } else {
      urlString = "\(baseURL != nil ? "\(baseURL!.absoluteString)/" : "")\(uri)"
    }
    
    // Full parameters
    var fullParameters = [String: Any]()
    if let baseParameters = baseParameters {
      for (key, value) in baseParameters {
        fullParameters[key] = value
      }
    }
    if let parameters = parameters {
      for (key, value) in parameters {
        fullParameters[key] = value
      }
    }
    
    // Full baseHeaders
    var fullHeaders = [String: String]()
    if let baseHeaders = baseHeaders {
      for (key, value) in baseHeaders {
        fullHeaders[key] = value
      }
    }
    if let headers = headers {
      for (key, value) in headers {
        fullHeaders[key] = value
      }
    }
    
    return (urlString, fullParameters, fullHeaders)
  }
  
  private func createSessionManagerIfNeeded() {
    if sessionManager == nil {
      let configuration = URLSessionConfiguration.default
      let timeout = 60
      configuration.timeoutIntervalForResource = TimeInterval(timeout)
      configuration.timeoutIntervalForRequest = TimeInterval(timeout)
      
      if usesCertificatePinning {
        var serverTrustPolicies = [String: ServerTrustPolicy]()
        
        serverTrustPolicies["gds.eligibleapi.com"] = .pinCertificates(
          certificates: ServerTrustPolicy.certificates(in: Bundle(for: type(of: self))),
          validateCertificateChain: true,
          validateHost: true
        )
        serverTrustPolicies["insecure.expired-apis.com"] = .disableEvaluation
        
        sessionManager = SessionManager(configuration: configuration, serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
      } else {
        sessionManager = SessionManager(configuration: configuration)
      }
    }
  }
}
