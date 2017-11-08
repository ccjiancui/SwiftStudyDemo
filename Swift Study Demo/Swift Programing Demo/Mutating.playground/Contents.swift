//: Playground - noun: a place where people can play

import Cocoa

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}
let personalGreeting = greet(name: "Matt", withGreeting: "Hello,")


func greeting(forName name: String) -> (String) -> String {
    return { (name: String) -> String in
        return "\(greeting) \(name)"
    }
}

let friendlyGreetingFor = greeting(forName: "Hello,")
let mattGreeting = friendlyGreetingFor("Matt")
print(mattGreeting)

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var p = Person()

let changeName = Person.changeTo
let changeNameFromMarrTo = changeName(&p)
changeNameFromMarrTo("john", "Gallagher")
p.firstName

//p.changeTo(firstName: "john", lastName: "Gallagher")
