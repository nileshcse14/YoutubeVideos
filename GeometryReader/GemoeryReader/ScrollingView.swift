//
//  ScrollingView.swift
//  GemoeryReader
//
//  Created by Nilesh on 29/10/22.
//

import SwiftUI

struct ScrollingView: View {
    var body: some View {
        ZStack {
            Image("scene")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1..<20) { num in
                            GeometryReader { geo in
                                VStack {
                                    Image("girl")
                                        .resizable()
                                        .cornerRadius(10)
                                }
                                .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            }.frame(width: 300, height: 300, alignment: .center)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingView()
    }
}
