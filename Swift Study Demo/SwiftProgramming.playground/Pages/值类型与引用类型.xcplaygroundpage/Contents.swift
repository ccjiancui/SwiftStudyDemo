//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today"
str
// 值类型在做赋值传递时候, 只是把值得副本付给新的值, 它们并没有指向同一个低层实例
// Swift 中应该优先使用 struct 来实现建模数据, 只有在需要的时候才用 class

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate
anotherHecate.name = "AnotherHecate"
anotherHecate.name
hecate.name


struct Pantheon {
    var chiedGod: GreekGod
}

let pantheon = Pantheon(chiedGod: hecate)
let zeus = GreekGod(name: "Zeus")
zeus.name = "Zeus Jr"
zeus.name

pantheon.chiedGod.name
let greekPantheon = pantheon
pantheon.chiedGod.name = "Trivia"
greekPantheon.chiedGod.name

// 值类型常量和引用类型常量
// 值类型就像整数一样, 如果整数声明为常量, 那么以后就无法改变它的一部分了
// 值类型内使用引用类型, 复制时候引用类型只是把同一个引用传给新的变量, 这个引用还是会跟原来的引用指向同一个实例, 改变其中任意一个都会反映到所有的引用上来
// 强烈建议大部分情况下都不要在值类型内使用引用类型. 如果确实需要在结构体内使用引用类型属性, 那么最好使用不可变实例.

//: [Next](@next)
