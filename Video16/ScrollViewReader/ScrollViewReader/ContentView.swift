//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Nilesh on 10/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Button("Add") {
                        didTapAdd()
                    }
                    
                    Button("Scroll to 5th") {
                        let id = viewModel.messages[5].id
                         withAnimation {
                             scrollProxy?.scrollTo(id, anchor: .bottom)
                         }
                    }
                    
                }
                
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(viewModel.messages, id: \.id) { message in
                        Text(message.message)
                            .padding()
                            .frame(width: UIScreen.main.bounds.size.width, height: 100)
                            .shadow(radius: 10)
                            .foregroundColor(message.color)
                            .background(Color.gray)
                            .id(message.id)
                    }
                    .onAppear {
                        scrollProxy = proxy
                    }
                }
                
                
            }.frame(width: UIScreen.main.bounds.size.width)
            
        }
        .onChange(of: viewModel.messages) { _ in
            scrollToBottom()
        }
        
    }
    
    func didTapAdd() {
        viewModel.addMessage()
    }
    
    func scrollToBottom() {
       guard let id = viewModel.messages.last?.id else { return }
        withAnimation {
            scrollProxy?.scrollTo(id, anchor: .bottom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






