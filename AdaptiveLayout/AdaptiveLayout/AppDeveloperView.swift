//
//  AppDeveloperView.swift
//  AdaptiveLayout
//
//  Created by Nilesh on 21/10/22.
//

import SwiftUI

struct AppDeveloperView: View {
    var body: some View {
        AdaptiveContainerView {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text("App Developer")
                    .bold()
                    .font(.title)
                
                Text("Welcome to the App Developer channel on YouTube! Learn how to make an app with Swift, SwiftUI, kotlin, Xcode and Android Studio. We answer every single comment so don't hesitate to leave your question . Teaching iOS App and android app development through easy-to-understand way. ")
                    .fixedSize(horizontal: false, vertical: false)
                
                Text("Please Subscribe")
                    .bold()
                    .font(.largeTitle)
                
            }
        }
    }
}


