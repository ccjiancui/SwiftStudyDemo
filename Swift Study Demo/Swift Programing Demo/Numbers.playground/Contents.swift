//: Playground - noun: a place where people can play

import Cocoa

print("The maximum Int value is \(Int.max).")

print("The minimum Int value is \(Int.min).")

let price = 1_000_000


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

var dict = [String: Int]()
dict["name"] = 2
dict
dict["name"] = nil
dict
