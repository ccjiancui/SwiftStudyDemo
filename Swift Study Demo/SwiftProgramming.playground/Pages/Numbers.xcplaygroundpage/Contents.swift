//: [Previous](@previous)

import Foundation

// MARK: - 整数

// 计算机所使用的整数和你在别处用的整数有一个区别，那就是计算机的整数类型占据固定大小的内存，所以无法表示所有的数量-它们有最小值和最大值

print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")

// Swift 编译器会在构建程序时根据平台选择合适的 Int 长度（macOS 中 Int 是 64 位整数，iOS 会更复杂，iPhone5S 之后是64位设置，iPhone5 或者 iPad 2 是32位设备）
// 在 Swift 中大部分需要使用整数的场景都应该坚持使用 Int、即使是那些正数才有意义的值（比如个数）。这样可以极大减少类型转换的麻烦

// 我们可以在数字中，使用分隔符：
let price = 1_000_000

// MARK: - 浮点数

// 1.浮点数在计算机中以尾数（mantissa）和指数（exponent）的形式存储的，类型于 123.45 用 1.2345 × 10²，使用的是二进制
// 2.浮点数通常不准确：有很多数无法以浮点数的形式精确存储。计算机会存储一个近似值，非常接近你要的数。

let d1 = 1.1
let d2: Double = 1.1

if d1 == d2 {
    print("d1 和 d2 是相等的")
}

print("d1 + 0.1 是 \(d1 + 0.1)") // d1 + 0.1 是 1.2

d1 + 0.1

if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 等于 1.2")
} else {
    print("不相等") // 居然不相等
}

// 永远不要使用浮点数表示那些必须精确的数值（比如金额计算）

//: [Next](@next)
