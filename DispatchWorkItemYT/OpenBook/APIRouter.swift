

import Alamofire
import Foundation

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

// Custom Error object API Calls.
enum APIError: Error {
    case runtimeError(String)
}

// Request parameter types.
enum RequestParams {
    case body(_:Parameters)
}

enum ContentType: String {
    case json = "application/json"
}

/// Builds the URLRequest object.
enum APIRouter: URLRequestConvertible {
    case getBooks(title: String)
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case  .getBooks:
            return .get
        }
    }
    
    // MARK: - url
    private var urlPath: String {
        switch self {
        case let .getBooks(title: title):
            let url = Constants.domain + "\(title)"
            return url

        }
    }
    
    // MARK: - Parameters
    private var parameters: RequestParams? {
        switch self {
        case  .getBooks:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        switch self {
        case  .getBooks:
            var headers = [String: String]()
            headers[HTTPHeaderField.contentType.rawValue] = ContentType.json.rawValue
            urlRequest.allHTTPHeaderFields = headers
        }
        
        // Parameters
        if let parameters = parameters {
            switch parameters {
            case .body(let params):
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        }
        return urlRequest
    }
}
