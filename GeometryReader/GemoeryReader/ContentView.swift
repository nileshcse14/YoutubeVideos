//
//  ContentView.swift
//  GemoeryReader
//
//  Created by Nilesh on 29/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: geo.size.width, height: geo.size.height/4)
                    HStack(spacing: 8) {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: geo.size.width / 2, height: geo.size.height/4)
                    }
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: geo.size.width / 2, height: geo.size.height/4)
                        Rectangle()
                            .fill(Color.brown)
                            .frame(width: geo.size.width / 2, height: geo.size.height/4)
                    }
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geo.size.width / 2, height: geo.size.height/4)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


