import Foundation

// MARK: - BooksDetail
struct BooksDetail: Codable {
    let docs: [Doc]?
    let error: String?


    enum CodingKeys: String, CodingKey {
        case docs
        case error
    }
}

// MARK: - Doc
struct Doc: Codable, Hashable {
    let title: String
    let key: String
    let author_name: [String]

    enum CodingKeys: String, CodingKey {
        case title, key, author_name
    }
}
