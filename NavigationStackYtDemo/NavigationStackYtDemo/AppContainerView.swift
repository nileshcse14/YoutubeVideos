//
//  AppContainerView.swift
//  NavigationStackYtDemo
//
//  Created by Nilesh on 16/10/22.
//

import Foundation
import SwiftUI

struct AppContainerView: View {
    @ObservedObject var router = Router()
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            ContentView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .ContentView:
                        ContentView()
                    case .View1:
                        View1()
                    case .View2:
                        View2()
                    case .View3(let name):
                        View3(name: name)
                    }
                }
        }.environmentObject(router)
    }
}
