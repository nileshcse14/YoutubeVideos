//
//  ContentView.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 03/01/22.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject private var viewModel = CommentViewModel()
    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.comments) { comment in
                        NavigationLink {
                            DetailCommentView(commentModel: comment)
                        } label: {
                            CommentRow(commentModel: comment)
                        }
                        
                    }
                }
            }.onAppear {
                viewModel.fetchComments()
            }
            .navigationTitle("Comment List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
