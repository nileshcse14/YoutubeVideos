//
//  CommentViewModel.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import Foundation

class CommentViewModel: ObservableObject {
    
    @Published var comments = [CommentModel]()
    
    func fetchComments() {
        CommentViewService().getComments { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments ?? []
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
