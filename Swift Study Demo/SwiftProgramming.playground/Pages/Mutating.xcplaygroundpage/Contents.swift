//: [Previous](@previous)

import Foundation

// 深入学习 mutating 方法
// 为什么修改结构体和枚举时需要这个关键字呢? 从返回函数的函数开始研究会比较有用

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

print(greet(name: "Matt", withGreeting: "Hello,"))

// 1.返回一个函数
func greeting(forName name: String) -> (String) -> String {
    func greeting(_ greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting
}

let greetMattWith = greeting(forName: "Matt")
let mattGreeting1 = greetMattWith("Hello,")
print(mattGreeting1)


// 2.从返回函数修改为返回一个闭包
func greeting(_ greeting: String) -> (String) -> String {
    return { (name: String) -> String in
        return "\(greeting) \(name)"
    }
}

let friendlyGreetingFor = greeting("Hello,")
let mattGreeting2 = friendlyGreetingFor("Matt")
print(mattGreeting2)

// 结构体 Person

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// 创建一个实例
var p = Person()

// 方法是会接收一个隐式参数 self
// 将 changeTo(firstName:lastName:) 方法付给一个常量, 不是调用实例方法
let changeName = Person.changeTo
// 未添加 mutating 函数签名: let changeName: (Person) -> (String, String) -> ()
// 添加 mutating 函数签名: let changeName: (inout Person) -> (String, String) -> ()
// changeName 是接收一个参数并返回一个函数的函数 Person 以 inout 修饰传入, inout 能让函数修改传递进来的参数

// mutating 方法的第一个参数是 self, 并以 inout 的形式传入. 因为值类型在传递的时候会被复制, 所以对于非 mutating 方法, self 其实是值的副本. 为了进行修改, self 需要被声明为 inout, 而 mutating 就是让你完成这个任务的工具.

let changeNameFromMattTo = changeName(&p)
changeNameFromMattTo("John", "Gallagher")
p.firstName

// 直接使用方法
p.changeTo(firstName: "taylor", lastName: "Swift")
p.firstName

//: [Next](@next)
