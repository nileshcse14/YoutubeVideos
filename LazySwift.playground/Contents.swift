import UIKit


class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    lazy let cc = "ghgjhghj"
    
    lazy var fullName: String = {
        return firstName + lastName
    }()
    
    // var fullName = firstName + lastName
    
    var fullNameComputed: String {
        return firstName + lastName
    }
    
}

var person = Person(firstName: "Nilesh", lastName: "Jha")
print(person.fullName)
print(person.fullNameComputed)
person.firstName = "Mobile trainer"

print("********")

print(person.fullName)
print(person.fullNameComputed)

person.fullName = "iOS Trainer"

print("********")

print(person.fullName)



class Foo {
    lazy var x: Int? = {
        print("x")
        return nil
    }()
    func y() -> Int? {
        print("y")
        return x ?? 4
    }
    
    let z: () -> Int = {
        print("z")
        return 6
    }
}
let foo = Foo()
foo.y() ?? foo.z()
//y
//x


