//: Playground - noun: a place where people can play

import Cocoa
// 原始值枚举

// 整型原始值, 未指定默认值时， 从0，1，2...依次
//enum TextAlignment: Int {
//    case left    = 20
//    case right   = 30
//    case center  = 40
//    case justify = 50
//}

enum TextAlignment: Int {
    case left
    case right
    case center
    case justify
}

print(TextAlignment.left.rawValue)
print(TextAlignment.right.rawValue)
print(TextAlignment.center.rawValue)
print(TextAlignment.justify.rawValue)

print(TextAlignment.left.hashValue)
print(TextAlignment.right.hashValue)
print(TextAlignment.center.hashValue)
print(TextAlignment.justify.hashValue)

// 字符串原始值
enum ProgrammingLanguage: String {
    case swift
    case objectiveC
    case c
    case cpp
    case java
}

print(ProgrammingLanguage.swift.rawValue)
print(ProgrammingLanguage.objectiveC.rawValue)
print(ProgrammingLanguage.c.rawValue)
print(ProgrammingLanguage.cpp.rawValue)
print(ProgrammingLanguage.java.rawValue)

// 如果省略指定原始值，Swift 会使用成员本身的名字

// 在 Swift 中，枚举是值类型（value type），而值类型的方法不能对 self 进行修改，如果希望值类型的方法能修改 self，需要标记这个方法为 mutating

// Swift 还提供一种强大的枚举：带关联的成员。关联值能让你把数据附在实例上；不同的成员可以有不同类型的关联值。
// 不是所有的枚举成员都必需有关联值
/// 形状大小
enum ShapDimensions {
    
    // 点没有关联值，它没有尺寸
    case point
    
    // 正方形的关联值是边长
    case square(side: Double)
    
    // 长方形的关联值是宽和高
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        // 使用模式匹配把 self 的关联值绑定到新变量上 side，w，h
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
}

var squareShap = ShapDimensions.square(side: 10.0)
var rectShap = ShapDimensions.rectangle(width: 5.0, height: 10.0)
squareShap.area()
rectShap.area()

// 递归枚举 indirect 告诉编译器把枚举的数据放到一个指针的地方
indirect enum FamilyTree {
    case noKnownPatents
    case oneKnownParent(name: String, ancestors: FamilyTree)
    case twoKnownParent(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestor: FamilyTree)
}

