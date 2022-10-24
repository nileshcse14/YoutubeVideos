

import Foundation
import SwiftUI
import Combine

@MainActor class ContentViewModel: ObservableObject {
    
    @Published var results = [Result]()
    
    @Published var serviceCallStatus: Bool  = false

    func performSearch(searchText: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)"), !searchText.isEmpty
        else { return }
        
        Task {
            do {
                serviceCallStatus = true
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder()
                    .decode(SearchResponse.self, from: data)
                    results = response.results ?? []
                serviceCallStatus = false
            } catch {
                print(error.localizedDescription)
                serviceCallStatus = false
            }
        }
    }
}
