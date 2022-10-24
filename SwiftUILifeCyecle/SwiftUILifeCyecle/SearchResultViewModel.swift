//
//  SearchResultVM.swift
//  SwiftUILifeCyecle
//
//  Created by Nilesh on 23/10/22.
//

import Foundation

struct SearchResultViewModel {
    
    let model: Result
    
    var trackName: String {
        model.trackName ?? ""
    }
    
    var imgUrl: URL? {
        URL(string: model.artworkUrl60 ?? "")
    }
    
    var fullPrice: String {
        guard let gPrice = model.trackPrice,
              let gCurrency = model.currency else { return "NA"}
        return gPrice.formatted(.currency(code: gCurrency))
    }
}

