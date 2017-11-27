//: [Previous](@previous)

import Foundation

// 初始化
// 在 Swift 中, 结构体和类的存储属性在初始化完成的时候需要有初始值.
// 初始化方法没有返回值, 初始化方法的任务给类型的存储属性赋值.

// 1.空初始化方法(empty initializer) () 不带参数
// 2.成员初始化方法(memberwise initializer)对于类型的每个存储属性, 成员初始化方法都有相应的参数, 在这种情况下, 不需要让编译器给新实例属性设置默认值, 而是利用自带的成员初始化方法为所有需要值得属性提供参数
// 结构体的默认成员初始化很有用, 因为这是 Swift 自动提供的, 不需要写代码实现, 结构体这个优势让它们变的急剧吸引力
// 结构体可以有默认的初始化方法, 也可以自定义. 一旦自定义初始化方法, Swift 就不会提供默认的初始化方法.

// 3.委托初始化方法(initializer delegation): 初始化方法的定义中可以包含对该类型其他初始化方法的调用.

// 类初始化
// 类增加了指定(designated)初始化方法和便捷(convenience)初始化方法
// 1.初始化方法自动继承. 一般来说, 类不会自动父类的初始化方法. Swift 的这个特性是希望避免子类在不经意间提供无法为所有属性赋值的初始化方法, 因为子类经常会增加父类不存在的属性. 让子类自己提供初始化方法可以避免实例被不完整的初始化方法初始化
// 以下情况会自动继承父类初始化方法:
// 1.如果子类没有定义任何指定初始化方法, 就会继承父类的指定初始化方法
// 2.如果子类实现了父类所有的指定初始化方法, 就会继承父类的所有便捷初始化方法

// 子类指定初始化, super 调用父类初始化方法放在最后
/*
// 指定初始化方法最后才调用父类的初始方法, 需要为自己引入的属性赋值, 然后 super 调用父类初始化方法, 以便父类初始化自己属性
init(limp: Bool, fallingApart: Bool, town: Town?, mosterName: String) {
    walkWithLimp = limp
    isFallingApart = fallingApart
    super.init(town: town, monsterName: mosterName)
}
 */

// convenience 标记初始化方法, 会告诉编译器: 这个初始化方法需要把一部分工作委托给另一个初始化方法, 直到调用到一个指定初始化方法, 调用完成后, 类的这个实例就可以用了.

/*
init(limp: Bool, fallingApart: Bool, town: Town?, mosterName: String) {
    walkWithLimp = limp
    isFallingApart = fallingApart
    super.init(town: town, monsterName: mosterName)
}

convenience init(limp: Bool, fallingApart: Bool) {
    self.init(limp: limp, fallingApart: fallingApart, town: nil, mosterName: "Fred")
    if walkWithLimp {
        print("这个僵尸的膝盖废了")
    }
}
 */






struct Person {
    var age: Int
    var name: String
    
    var isAdult: Bool {
        return age > 18
    }
}

let p = Person(age: 20, name: "Fred")




//: [Next](@next)
