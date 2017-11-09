//: [Previous](@previous)

import Foundation

// MARK: - 整数

print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")

// Swift 编译器会在构建程序时根据平台选择合适的 Int 长度（macOS 中 Int 是 64 位整数，iOS 会更复杂，iPhone5S 之后是64位设置，iPhone5 或者 iPad 2 是32位设备）
// 在 Swift 中大部分需要使用整数的场景都应该坚持使用 Int、即使是那些正数才有意义的值（比如个数）。这样可以极大减少类型转换的麻烦

// 我们可以在数字中，使用分隔符：
let price = 1_000_000

// MARK: - 浮点数

// 不准确的浮点数

// 浮点数通常不精确：有很多数无法以浮点数的形式精确存储。计算机会存储一个近似值，非常接近你要的数。
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

var arr: [String]?

arr?.append("name")
arr


Int("string")


//: [Next](@next)
