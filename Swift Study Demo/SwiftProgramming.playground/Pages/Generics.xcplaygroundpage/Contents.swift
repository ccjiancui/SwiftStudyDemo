//: [Previous](@previous)

import Foundation

// <Element> 占位类型(placeholder type)

struct Stack<Element> {
    
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
}

// 编译器用实际类型替换占位类型的过程被称为特化(specialization)
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.pop()
intStack.pop()
intStack.pop()

var stringStack = Stack<String>()
stringStack.push("hello")
stringStack.pop()
stringStack.pop()


//: [Next](@next)
