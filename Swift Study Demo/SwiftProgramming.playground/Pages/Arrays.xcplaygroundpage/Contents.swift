//: [Previous](@previous)

import Foundation

//var numbers = [1, 2, 3, 4, 5]
//numbers.remove(at: 1)
//numbers

var str = "Hello, playground"

let numbers: [[Any]] = [[1, 2, 3], ["5", 6, 7]]
let num = numbers.flatMap { (num) -> [Any] in
    return num
}.compactMap { (num) -> Int? in
    return num as? Int
}
num


//: [Next](@next)
