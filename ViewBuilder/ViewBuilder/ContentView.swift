//
//  ContentView.swift
//  ViewBuilder
//
//  Created by Nilesh on 13/10/22.
//



// What is AnyView?

// What is viewBuilder?

//How to create reusable components using ViewBuilder

import SwiftUI

struct ContentView: View {
    
    @State private var isEditable: Bool = false
    @State private var name: String = "Nilesh"
    
    var body: some View {
        VStack {
            ButtonView(text: "Subscribe", color: Color.red) {
                Text("Subscribe App Developer")
            }
            
            ButtonView(text: "Like", color: Color.black) {
                Text("Please like and comment")
            }
        }
        .padding()
        .type()
    }
    
    @ViewBuilder
    private var editableView: some View {
        if isEditable {
             TextField("Enter name", text: $name)
        } else {
             Text(name)
        }
    }
}

extension View {
    func type() -> some View {
        print(Swift.type(of: self))
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtonView<Content: View>: View {
    @State private var showModal: Bool = false
    let text: String
    let color: Color
    
    let content: Content
    init(text: String, color: Color, @ViewBuilder contentBuilder:() -> Content) {
        self.text = text
        self.color = color
        self.content = contentBuilder()
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                showModal = true
            } label: {
                Text(text)
                    .padding(10)
                    .foregroundColor(color)
            }.sheet(isPresented: $showModal) {
                content
            }
            .background(Color.yellow)

        }
    }
}
