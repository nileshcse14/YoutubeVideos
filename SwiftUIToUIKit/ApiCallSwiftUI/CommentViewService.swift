//
//  CommentViewService.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import Foundation

protocol CommentViewServiceDelegate: CommentsDelegate, UsersDelegate {
    
}

protocol CommentsDelegate {
    func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void)
}

protocol UsersDelegate {
    func fetchUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void)
}

class CommentViewService: CommentViewServiceDelegate  {
    
    func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return completion(.failure(.BadURL))
        }
        if isConnected() {
            NetworkManager().fetchRequest(type: [CommentModel].self, url: url, completion: completion)
        }
       
    }
    
    func fetchUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/user") else {
            return completion(.failure(.BadURL))
        }
        NetworkManager().fetchRequest(type: UserModel.self, url: url, completion: completion)
    }
   
    private func isConnected() -> Bool{
        return true
    }
    
}
