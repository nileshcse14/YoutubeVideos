import Foundation

// MARK: - Main Object
struct SearchResponse: Codable {
    let resultCount: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable, Identifiable {
    var id = UUID().uuidString
    let trackName: String?
    let artworkUrl60: String?
    let trackPrice: Double?
    let currency: String?

    enum CodingKeys: String, CodingKey {
        case trackName
        case artworkUrl60, currency
        case trackPrice
    }
}
