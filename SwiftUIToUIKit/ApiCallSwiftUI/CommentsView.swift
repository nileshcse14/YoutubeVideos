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
                            //DetailCommentView(commentModel: comment)
                            CommentDetailViewControllerRepresentable(commentModel: comment)
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

struct CommentDetailViewControllerRepresentable: UIViewControllerRepresentable {
    var commentModel: CommentModel
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewModel = CommentDetailViewModel(comment: commentModel)
        let vc = CommentDetailViewController(viewModel: viewModel)
        return vc
    }
    
    
}
