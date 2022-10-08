//
//  ContentView.swift
//  UnderstandingLoop
//
//  Created by Nilesh on 08/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    if let data = viewModel.imageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if viewModel.isLoading {
                        ProgressView()
                    }
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Timer value Run loop main \(viewModel.timer)")
                Text("Timer value Run loop common \(viewModel.commonTimerValue)")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
