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
    
    @Published var comments = [CommentModel]() // source of truth
    @Published var searchResultComments = [CommentModel]() // based on my search result else default data
    
    func fetchComments() {
        commentViewService.getComments { result in
            switch result {
            case .success(let comments):
                print("Fetched new comments")
                self.comments = comments
                self.searchResultComments = comments
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didGetSearchText(text: String) {
        if text.isEmpty {
            searchResultComments = comments
        } else {
            searchResultComments = comments.filter { $0.name?.contains(text.lowercased()) ?? false }
        }
    }
}
