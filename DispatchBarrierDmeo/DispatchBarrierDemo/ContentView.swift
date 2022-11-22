//
//  ContentView.swift
//  DispatchBarrierDmeo
//
//  Created by Nilesh on 13/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear {
            viewModel.buyTickets()
            viewModel.doSomethingElse()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
