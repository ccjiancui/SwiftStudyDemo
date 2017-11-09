//: [Previous](@previous)

import Foundation

// MARK: - 函数类型 static class

func sortedEventOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
}
return (evens, odds)
}

sortedEventOddNumbers([10, 1, 4, 3, 57, 43, 84, 27, 156, 111])

// 函数类型
// sortedEventOddNumbers(_:) 的函数类型是 ([Int]) -> ([Int], [Int])
// 既没有参数又没有返回值得参数类型是 () -> ()

let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortedEventOddNumbers


evenOddFunction([10, 1, 4, 3, 57, 43, 84, 27, 156, 111])

func printGreeting() {
    print("Hello")
}

// 编译器自动插入
//func printGreeting() -> Void {
//    print("Hello")
//}

// 标准库映射
//func printGreeting() -> () {
//    print("Hello")
//}


// typealias Void = ()
// Void 是 () 的类型别名
// 类型别名可理解成告诉编译器某个类型是另一个类型的简略表达的一种方式。

// printGreeting() 的类型是 () -> Void。这只是一个没有参数返回空元祖的函数类型，是没有显式返回值得函数的隐式返回类型static class

//: [Next](@next)
