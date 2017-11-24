//: [Previous](@previous)

import Foundation

// MARK: - 类型方法 static class

class SomeClass {
    // 类型储存属性
    static var num = 1
    
    // 类型计算属性, 可被重写
    class var num2: Int {
        return 5
    }
    
    static func typeMethod() {
        print(self)
        print(num)
        print(num2)
        
    }
    
}

SomeClass.typeMethod()

class twoClass: SomeClass {
    
    override class var num2: Int {
        return 20
    }
}

twoClass.num = 10
twoClass.typeMethod()

struct Three {
    static let num = 88
    
    static func showNum() {
        print(num)
    }
}

Three.showNum()
// 结构体一般用 static
// 类 一般用 class, 便于子类继承类方法
// 类如果不想类型方法被子类继承 可以 使用 static, 也可以使用 final class
// 如果仅仅不想继承, 也可以使用 final class 修饰类方法, 也能达到同样的效果
// 类方法不需要实例化对象, 类型本身就可调用, 一般以 static 关键字来指定, 也称 静态方法
// class 和 static 一样可以用来修饰类方法, 区别是 class 修饰的类方法可以被子类重写, 而 static 不能
// 类方法可以调用其他的类方法和类属性, 不能调用实例方法
// 类型方法可以使用给定类型的类型级别信息. 这意味着类型方法可以调用其他类型方法, 甚至可以使用类型属性; 类型方法不能调用实例方法, 也不能使用实例属性. 因为实例不能在类型级别使用

//: [Next](@next)
