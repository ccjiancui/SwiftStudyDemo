//: Playground - noun: a place where people can play

import Cocoa

// 变长参数
// 变长参数接受零个或更多输入值作为实参。函数只能有一个变长参数，而且一般应该是参数列表最后一个。参数值在函数内部以数组的形式可用
func printPersonalGreetings(to names: String...) {
    for name in names { // names 类型是 [String]
        print("Hello \(name)")
    }
}
//printPersonalGreetings(to: "Chirs", "Pat")
printPersonalGreetings()



// 默认参数值
// Swift 的参数可以接受默认值。默认值应该放在函数参数列表的末尾。如果形参有默认值，那么在调用函数时可以省略实参。
func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctucation: String = ".") {
    print("\(numerator) divied by \(denominator) equals \(numerator / denominator)\(punctucation)")
}
divisionDescriptionFor(numerator: 9, denominator: 6)
divisionDescriptionFor(numerator: 9, denominator: 6, withPunctuation: "!")


// in-out 参数
// 处于某种原因, 函数有时候需要修改实参的值. in-out参数能让函数影响函数体以外的变量.
// 1.in-out 参数不能有默认值. 2.变长参数不能标记为 in-out.

var error = "The request is failed"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
// 传递给 in-out 参数变量需要在前面加上 &, 表示函数会修改这个变量
appendErrorCode(400, toErrorString: &error)
error

// in-out 参数与返回值不同. 如果你的目标是函数有所产出,那么有更优雅的方式来实现


// 嵌套函数和作用域

/// 三角形面积
///
/// - Parameters:
///   - base: 底边长
///   - height: 高度
/// - Returns: 面积
func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}

areaOfTriangleWith(base: 3.0, height: 5.0)

// 常量 numerator 和 函数 divide() 共享 areaOfTriangleWith(base:height:) 的闭合作用域，任何定义在函数作用域中的东西都对函数可见， 所以 divide() 函数可以调用 numerator
// 外部看不见 divide() 函数
// 把功能相关的函数放在一起



