//
//  CommentViewService.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import Foundation

protocol CommentViewServiceDelegate {
    func getComments(completion: @escaping(Result<[CommentModel], NetworkError>) -> Void)
}

class CommentViewService: CommentViewServiceDelegate  {
    
    func getComments(completion: @escaping(Result<[CommentModel], NetworkError>) -> Void) {
        RestAPIClient.getComments(completion: completion)
    }
    
    
}
