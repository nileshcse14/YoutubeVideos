//
//  APIRouter.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 06/01/22.
//

import Foundation
import Alamofire


public enum APIRouter: URLRequestConvertible {
    case getComments
    
    private var urlPath: String {
        switch self {
        case .getComments:
            return "https://jsonplaceholder.typicode.com/comments"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getComments:
            return .get
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = method.rawValue
        return urlrequest

    }
    
    
}
