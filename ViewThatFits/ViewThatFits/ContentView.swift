//
//  ContentView.swift
//  ViewThatFits
//
//  Created by Nilesh on 09/10/22.
//

import SwiftUI

struct ContentView: View {
    var messages = DummyData().listArray
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(messages, id: \.self) { message in
                HStack() {
                    Image(systemName: "info.circle.fill")
                    ViewThatFits {
                        Text(message)
                            .fixedSize()
                        HStack {
                            Text(message)
                                .lineLimit(3)
                            Button("More") {
                                // Action
                            }
                        }
                        
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
