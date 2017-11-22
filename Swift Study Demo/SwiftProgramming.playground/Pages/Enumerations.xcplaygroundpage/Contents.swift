//: [Previous](@previous)

import Foundation

// 枚举
enum TextAlignment1 {
    case left
    case right
    case center
    case justify
}

var alignment = TextAlignment1.center
alignment = .justify

//switch alignment {
//case .left:
//    print("left aligned")
//case .right:
//    print("right aligned")
//default:
//    print("center aligned")
//}

switch alignment {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
case .center:
    print("center aligned")
case .justify:
    print("justify aligned")
}

// 枚举类型用 switch 时避免使用 default 分支, 因为使用默认分支不"面向未来", 如果枚举成员增加了, default 分支反而会增加修改代码的复杂度
// 通过在 switch 中列出枚举的每个成员值可以确保当我们给枚举增加成员值时编译器能协助我们发现代码中必须要更新的地方, 编译时候就会提示错误并且在 Xcode 帮助下快速 Fix 补全




// 1.枚举 原始值 rawValue

// 1.1 整型原始值, 未指定默认值时， 从0，1，2...
// 1.2 也可以设定首个枚举成员的原始值, 其他成员的枚举值依次增加
// 1.3 也可以指定每个成员的原始值 = 20 ...
enum TextAlignment2: Int {
    case left = 1
    case right
    case center
    case justify
}

print(TextAlignment2.left.rawValue)
print(TextAlignment2.right.rawValue)
print(TextAlignment2.center.rawValue)
print(TextAlignment2.justify.rawValue)

print(TextAlignment2.left.hashValue)
print(TextAlignment2.right.hashValue)
print(TextAlignment2.center.hashValue)
print(TextAlignment2.justify.hashValue)




// 2.原始值转换成枚举类型
let myRawValue = 2
if let myAlignment = TextAlignment2(rawValue: myRawValue) {
    print("转化成功\(myRawValue)")
    myAlignment
} else {
    print("转化失败\(myRawValue)")
}

// 3.字符串原始值的枚举
// 如果省略指定原始值，Swift 会使用成员本身的名字
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




// 4.枚举方法
// 方法 method 是和类型关联的函数. 有些语言的方法只能和类关联, 方法可以和枚举关联.

/// 电灯泡状态枚举
///
/// - on: 开
/// - off: 关
enum Lightbulb {
    case on
    case off
    
    /// 表面温度
    ///
    /// - Parameter ambient: 环境温度
    /// - Returns: 返回值 温度
    func sufaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    /// 开关
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
    
}

// 在 Swift 中，枚举是值类型（value type），而值类型的方法不能对 self 进行修改，如果希望值类型的方法能修改 self，需要标记这个方法为 mutating

var bulb = Lightbulb.on
let ambientTempertature = 20.0

var bulbTmepertature = bulb.sufaceTemperature(forAmbientTemperature: ambientTempertature)

bulb.toggle()
bulbTmepertature = bulb.sufaceTemperature(forAmbientTemperature: ambientTempertature)

bulb.toggle()
bulbTmepertature = bulb.sufaceTemperature(forAmbientTemperature: ambientTempertature)




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
    
    /// 计算面积
    ///
    /// - Returns: 返回值 面积
    func area() -> Double {
        
        // 使用模式匹配把 self 的关联值绑定到新变量上
        
        // Fix 补全(推荐)
        switch self {
        case .point:
            return 0
        case .square(let side):
            return side * side
        case .rectangle(let width, let height):
            return width * height
        }
        
        // 自己敲的
        switch self {
        case .point:
            return 0
        case .square(side: let s):
            return s * s
        case .rectangle(width: let w, height: let h):
            return w * h
        }
        
        // let 提前到 case 前
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




// 递归枚举内存不确定, 需要用 indirect(间接地) 来告诉编译器把枚举的数据放到一个指针的地方
enum FamilyTree {
    case noKnownPatents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParent(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestor: FamilyTree)
}

let FredAncestors = FamilyTree.twoKnownParent(
    fatherName: "aa", fatherAncestors: FamilyTree.twoKnownParent(fatherName: "bb",
                                             fatherAncestors: FamilyTree.noKnownPatents, motherName: "cc", motherAncestor: .noKnownPatents),
    motherName: "dd", motherAncestor: FamilyTree.noKnownPatents)




//: [Next](@next)
