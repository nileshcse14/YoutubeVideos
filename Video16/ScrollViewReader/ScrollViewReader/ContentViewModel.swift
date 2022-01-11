//
//  ContentViewModel.swift
//  ScrollViewReader
//
//  Created by Nilesh on 10/01/22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    func addMessage() {
        messages.append(Message(message: "Hello Test", color: Color.random))
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
