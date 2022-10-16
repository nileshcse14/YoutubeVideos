//
//  ContentView.swift
//  NavigationStackYtDemo
//
//  Created by Nilesh on 16/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: Router
    var body: some View {
        VStack {
            Button("Go To View1") {
                router.pushView(route: .View1)
            }
        }
        .navigationTitle("Content View")
        .padding()
    }
}

struct View1: View {
    @EnvironmentObject private var router: Router
    var body: some View {
        VStack {
            Button("Go To View2") {
                router.pushView(route: .View2)
            }
        }
        .navigationTitle("View1")
        .padding()
    }
}

struct View2: View {
    @EnvironmentObject private var router: Router
    var body: some View {
        VStack {
            Button("Go To View3") {
                router.pushView(route: .View3("Nilesh"))
            }
        }
        .navigationTitle("View2")
        .padding()
    }
}

struct View3: View {
    let name: String
    @EnvironmentObject private var router: Router
    var body: some View {
        VStack {
            Text(name)
            Button("Go To Root View") {
                router.popToRootView()
            }
            Button("Go To View1") {
                router.popToSpecificView(k: 2)
            }
        }
        .navigationTitle("View2")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

