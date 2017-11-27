//: [Previous](@previous)

import Foundation

// Properties 属性
// 属性能够把值关联到类型上, 从而模拟类型所表示的实体的性质, 比如: let age: Int = 18.
// 属性可以是常量, 也可以是变量. 类, 结构体和枚举都可以有属性.
// 属性分为存储(stored)属性和计算(computed)属性. 存储属性有默认值, 计算属性则根据已有信息返回某种计算结果.
// 我们可以观察属性的变化, 并在属性被赋予新值时执行特定的代码. 我们甚至可以设立规则, 用来决定属性对应用中其他文件的可见度.



// 1.基础的存储属性
// 1.1 变量是读写属性, 常量是只读属性
// 1.2 惰性存储属性 (懒加载)
// 第一次访问懒加载属性时候才去调用闭包并将结果赋值
// 为什么要使用 lazy, 为了能让闭包安全地访问 self, 编译器必须知道 self 已经初始化完成了. 使用 lazy 是告诉编译器这个属性不是创建 self 所必需的, 如果它不存在, 就应该在它第一次被访问的时候创建. lazy 会告诉编译器: 当闭包被调用时, self 肯定已经可用了.
// lazy 加载的属性不会重新再计算



// 2.计算属性
// 2.1 计算属性提供读取方法(getter) 和 写入方法 (setter)
// 2.2 只有 get 方法的是只读属性, 两个都有是读写属性
// 2.3 set 方法如果自定义变量使用 set (valueName) { … }来给变量命名, 如果没有, 那么Swift 提供变量 newValue 来持有相同信息

/*
var victimpol: Int {
    get {
        return town?.population ?? 0
    }
    //        set(newVictimpol) {
    //            town?.population = newVictimpol
    //        }
    set {
        town?.population = newValue
    }
}
 */



// 3.属性观察者 property observation
// 属性观察者会观察并响应给定属性的变化.
// 属性观察对于任何自定义的存储属性和任何继承的属性都可用.
// 自定义的计算属性不能用属性观察, 但是我们对这类计算属性的读取方法和写入方法的定义有完全的控制权, 所以可以用它来响应变化
// 3.1 didSet 观察者能让我们访问属性的旧值, 如果不指定新名字的话, Swift 会自动把参数命名为 oldValue
// 3.2 对于 willSet 观察者来说, Swift 会生成 newValue 参数

/*
var population = 5_422 {
//        didSet(oldPopolation) {
//            print("人口已经从\(oldPopolation)变化为\(population)")
//        }
    didSet {
        print("人口已经从\(oldValue)变化为\(population)")
    }
}
 */

// 4.类型属性 (type property)
// 类型属性对类型是通用的, 它们的值在同类型的实例间共享. 这类属性适合存储对于所有实例来说都相同的信息
// 值类型(结构体, 枚举) 和 类都可以有存储类型属性和计算类型属性, 使用 static 关键字开头.
// 类的 类型属性使用 static 关键字时, 子类不能覆盖父类的类型属性, 如果需要 使用 class 关键字, 子类可以 override 重写

/*
class var makeSpookyNoise: String {
    return "Brains..."
}
 */
// 以上使用了读取方法快捷语法. 如果计算属性没有写入方法, 借可以省略自定义中 get, 并直接返回所需的计算值



// 5.通过访问权限控制读写方法的可见度
// 默认情况下读写方法的可见度相同, 但是也可以分别控制他们的可见度

// internal private(set) var isFallingApart = false
// private(set) var isFallingApart = false






//: [Next](@next)
