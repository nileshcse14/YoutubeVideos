//
//  ProfileViewModel.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 14/02/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    var commentModel: CommentModel
    var text: String
    init(commentModel: CommentModel, text: String) {
        self.commentModel = commentModel
        self.text = text
    }
}
