//
//  UserRepository.swift
//  Coupling
//
//  Created by Nilesh on 15/12/22.
//

import Foundation

protocol UserRepositoryDelegate {
    func getJsonPlaceHolderUsers(completion: @escaping(Result<[ResponseElement],CustomError>) -> Void)
    func getGithubUsers(completion: @escaping(Result<[GithubModel],CustomError>) -> Void)
}

class UserRepository: UserRepositoryDelegate {
    
    private let networkManager : NetworkManagerDelegate
    
    init(networkManager: NetworkManagerDelegate = URLSessionNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getJsonPlaceHolderUsers(completion: @escaping (Result<[ResponseElement], CustomError>) -> Void) {
        networkManager.getData(urlString: "https://jsonplaceholder.typicode.com/users", completion: completion)
    }
    
    func getGithubUsers(completion: @escaping (Result<[GithubModel], CustomError>) -> Void) {
        networkManager.getData(urlString: "https://api.github.com/users", completion: completion)
    }
    
    
}
