//
//  ProfileViewModel.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 14/02/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    var commentModel: CommentModel
    
    init(commentModel: CommentModel) {
        self.commentModel = commentModel
    }
}
