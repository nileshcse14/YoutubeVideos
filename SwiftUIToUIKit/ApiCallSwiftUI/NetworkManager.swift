//
//  NetworkManager.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 15/01/22.
//

import Foundation

enum DemoError: Error {
    case BadURL
    case NoData
    case DecodingError
}


class NetworkManager {
    let aPIHandler: APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(aPIHandler: APIHandlerDelegate = APIHandler(),
         responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.aPIHandler = aPIHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping(Result<T, DemoError>) -> Void) {
       
        aPIHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(type: type, data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    
}

protocol APIHandlerDelegate {
    func fetchData(url: URL, completion: @escaping(Result<Data, DemoError>) -> Void)
}

class APIHandler: APIHandlerDelegate {
    func fetchData(url: URL, completion: @escaping(Result<Data, DemoError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            completion(.success(data))
           
        }.resume()
    }
    
}

protocol ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, DemoError>) -> Void)
}

class ResponseHandler: ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, DemoError>) -> Void) {
        let commentResponse = try? JSONDecoder().decode(type.self, from: data)
        if let commentResponse = commentResponse {
            return completion(.success(commentResponse))
        } else {
            completion(.failure(.DecodingError))
        }
    }
    
}
