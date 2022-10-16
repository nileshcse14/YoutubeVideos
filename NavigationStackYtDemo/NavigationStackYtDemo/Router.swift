//
//  Router.swift
//  NavigationStackYtDemo
//
//  Created by Nilesh on 16/10/22.
//

import Foundation
import SwiftUI
import UIKit

enum Route: Hashable {
    case ContentView
    case View1
    case View2
    case View3(String)
}

final class Router: ObservableObject {
    @Published var navigationPath = NavigationPath() {
        willSet(newPath) {
            if newPath.count < navigationPath.count - 1 {
                let animation = CATransition()
                animation.isRemovedOnCompletion = true
                animation.type = .moveIn
                animation.duration = 0.4
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                UIApplication.shared.keyWindow?.layer.add(animation, forKey: nil)
            }
        }
    }
    
    func pushView(route: Route) {
        navigationPath.append(route)
    }
    
    func popToRootView() {
        navigationPath = .init()
    }
    
    func popToSpecificView(k: Int) {
        navigationPath.removeLast(k)
    }
    
}
