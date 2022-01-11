//
//  ContentModel.swift
//  ScrollViewReader
//
//  Created by Nilesh on 10/01/22.
//

import Foundation
import SwiftUI



struct Message: Identifiable, Equatable {
    var message: String
    var color: Color
    var id: String = UUID().uuidString
}
