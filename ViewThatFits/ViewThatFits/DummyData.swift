//
//  DummyData.swift
//  ViewThatFits
//
//  Created by Nilesh on 09/10/22.
//

import Foundation

struct DummyData {
    var listArray = [String]()
    
    init() {
        listArray.append("ViewThatFits is a container view introduced with SwiftUI 4 and iOS 16. ViewThatFits holds collection of child views and displays a view depending upon the available size. It does so by evaluating child views in the order they are defined and selects the child view whose size is ideal to fit in within the constrained space. We provide views in the order we prefer, meaning we define in the order of largest to smallest view and ViewThatFits picks a child view depending upon the space provided by parent view.")
        listArray.append("We provide views in the order we prefer, meaning we define in the order of largest to smallest view and ViewThatFits picks a child view depending upon the space provided by parent view.")
        listArray.append("It does so by evaluating child views in the order they are defined and selects the child view whose size is ideal to fit in within the constrained space. We provide views in the order we prefer, meaning we define in the order of largest to smallest view and ViewThatFits picks a child view depending upon the space provided by parent view.")
        listArray.append("I am too small")
        listArray.append("I love SwiftUI")
    }
}
