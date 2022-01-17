//
//  CommentViewModel.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import Foundation

class CommentViewModel: ObservableObject {
    let serviceHandler: CommentViewServiceDelegate
    let databaseHandler: CommentsDelegate
    
    init(serviceHandler: CommentViewServiceDelegate = CommentViewService(),
         databaseHandler: CommentsDelegate = DatabaseHandler()) {
        self.serviceHandler = serviceHandler
        self.databaseHandler = databaseHandler
    }
    
    @Published var comments = [CommentModel]()
    
    func fetchComments() {
        if isConnected() {
            serviceHandler.getComments { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let comments):
                        print("Fetched new comments")
                        self.comments = comments
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
            }
        } else {
            databaseHandler.getComments { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let comments):
                        print("Fetched new comments")
                        self.comments = comments
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
            }
        }
        
    }
    
    private func isConnected()-> Bool {
        return false
    }
    
    func fetchUsers() {
        CommentViewService().fetchUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    print("Fetched new comments")
                    
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
    
}
