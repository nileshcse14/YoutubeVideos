import UIKit

var greeting = "Hello, playground"

// == -- Equality
// === -- Identity

class Person: Equatable {
    var name: String
    var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.country == rhs.country && lhs.name == rhs.name
    }
}

var person1 = Person(name: "Nilesh", country: "India")

var person2 = person1

print("Person1 address \(Unmanaged.passUnretained(person1).toOpaque())")
print("Person2 address \(Unmanaged.passUnretained(person2).toOpaque())")

print("*********")
person2.country = "United Kingdom"

print("Person1 address \(Unmanaged.passUnretained(person1).toOpaque())")
print("Person2 address \(Unmanaged.passUnretained(person2).toOpaque())")

print("*********")
person1.country = "Unites States"

print("Person1 address \(Unmanaged.passUnretained(person1).toOpaque())")
print("Person2 address \(Unmanaged.passUnretained(person2).toOpaque())")


print("*********")
person1 = Person(name: "App Developer", country: "India")

print("Person1 address \(Unmanaged.passUnretained(person1).toOpaque())")
print("Person2 address \(Unmanaged.passUnretained(person2).toOpaque())")


if person1 === person2 {
    print("yes")
}

