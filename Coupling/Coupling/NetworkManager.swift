//
//  NetworkManager.swift
//  Coupling
//
//  Created by Nilesh on 15/12/22.
//

import Foundation
import Alamofire

enum CustomError: Error {
    case genereicError
}

protocol NetworkManagerDelegate {
    func getData<T: Decodable>(urlString: String,completion: @escaping(Result<T,CustomError>) -> Void)
}

class AlamofireNetworkManager: NetworkManagerDelegate {
    
    func getData<T: Decodable>(urlString: String, completion: @escaping(Result<T,CustomError>) -> Void) {
        AF.request(urlString, method: .get).response { response in
            
            guard let data = response.data,
                  let list = try? JSONDecoder().decode(T.self, from: data) else { return completion(.failure(.genereicError)) }
            completion(.success(list))
        }
    }
}


class URLSessionNetworkManager: NetworkManagerDelegate {
    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T, CustomError>) -> Void){
        guard let url = URL(string: urlString) else { return completion(.failure(.genereicError))}
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data,
                      let list = try? JSONDecoder().decode(T.self, from: data) else { return completion(.failure(.genereicError)) }
                completion(.success(list))
            }
        }.resume()
    }
}
