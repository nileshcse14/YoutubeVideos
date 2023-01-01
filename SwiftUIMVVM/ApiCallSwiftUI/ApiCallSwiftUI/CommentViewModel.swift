//
//  CommentViewModel.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import Foundation

class CommentViewModel: ObservableObject {
    
    private let commentViewService: CommentViewServiceDelegate
    
    init(commentViewService: CommentViewServiceDelegate = CommentViewService()) {
        self.commentViewService = commentViewService
    }
    
    @Published var comments = [CommentModel]()
    
    func fetchComments() {
        commentViewService.getComments { result in
            switch result {
            case .success(let comments):
                print("Fetched new comments")
                self.comments = comments ?? []
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
