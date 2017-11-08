//: Playground - noun: a place where people can play

import Cocoa

// 闭包的简写方式

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
// 函数是有名字的闭包
func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}
let volunteerSorted1 = volunteerCounts.sorted(by: sortAscending)
//let volunteerSorted1 = volunteerCounts.sorted(by: <#T##(Int, Int) -> Bool#>)


// 完整闭包
let volunteerSorted2 = volunteerCounts.sorted { (i: Int, j: Int) -> Bool in
    return i < j
}


// 利用类型推断简写闭包
// 1. 移除了两个参数和返回值的类型信息.返回值类型可以移除是因为编译器知道检查 i < j 是否成立返回 true 或 false
// 2. 闭包表达式放在一行
// 3. 移除关键字 return. 只有一个表达式才能移除, 存在更多表达式, 显式显示 return 是必需的
let volunteerSorted3 = volunteerCounts.sorted { i, j in i < j }
volunteerSorted3


// 利用参数的快捷语法
let volunteerSorted4 = volunteerCounts.sorted { $0 < $1 }
volunteerSorted4

// 以上都使用了尾随闭包的语法
// 代码简洁是智慧的灵魂, 不能为了简洁而简洁, 保持代码的可读性和可维护性永远是最重要的.


//// 函数作为返回值
//
//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
//        return lights + existingLights
//    }
//    return buildRoads
//}
