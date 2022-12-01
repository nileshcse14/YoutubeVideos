import UIKit


struct Person {
    let name: String
    let isSubscribed: Bool
    let email: String?
}

let persons = [
    Person(name: "Leo", isSubscribed: false, email: "a@b.com"),
    Person(name: "Marko", isSubscribed: true, email: "b@b.com"),
    Person(name: "Ziha", isSubscribed: false, email: nil)
]

extension Collection {
    public func myMap<T>(
       _ transform: (Element) throws -> T
    ) rethrows -> [T] {
        var results = [T]()
        for item in self {
            results.append(try transform(item))
        }
        
        return results
    }
    
    public func myCompactMap<T>(
       _ transform: (Element) throws -> T?
    ) rethrows -> [T] {
        var results = [T]()
        for item in self {
            if let value = try transform(item) {
                results.append(value)
            }
        }
        
        return results
    }
}

let emails = persons.myCompactMap {$0.email}
print(emails)





