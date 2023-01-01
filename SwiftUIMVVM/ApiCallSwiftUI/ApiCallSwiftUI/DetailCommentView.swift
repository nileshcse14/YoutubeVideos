//
//  DetailCommentView.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 04/01/22.
//

import SwiftUI

struct DetailCommentView: View {
    var commentModel: CommentModel
    var body: some View {
        VStack {
            Text(commentModel.name ?? "NA")
                .font(.title3)
            Text(commentModel.email ?? "NA")
                .font(.title2)
            Text(commentModel.body ?? "NA")
                .font(.body)
        }
    }
}

struct DetailCommentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCommentView(commentModel: CommentModel(postID: 1, id: 1, name: "Nilesh", email: "iOStpointblog@gmail.com", body: "Lets learn iOS and Android"))
    }
}
