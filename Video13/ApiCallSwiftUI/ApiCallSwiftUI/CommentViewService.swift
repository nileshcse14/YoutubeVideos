//
//  CommentViewService.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import Foundation

enum DemoError: Error {
    case BadURL
    case NoData
    case DecodingError
}

class CommentViewService {
    
    func getComments(completion: @escaping(Result<[CommentModel]?, DemoError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return completion(.failure(.BadURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            let commenTResponse = try? JSONDecoder().decode([CommentModel].self, from: data)
            if let commenTResponse = commenTResponse {
                completion(.success(commenTResponse))
            } else {
                 completion(.failure(.DecodingError))
            }
            
        }.resume()
    }
}
