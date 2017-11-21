//: [Previous](@previous)

import Foundation

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


// 3.函数作为返回值

/// 发展小镇1
///
/// - Returns: 函数建造公路 参数添加路灯和已有参数, 返回路灯数和
func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
        return lights + existingLights
    }
    return buildRoads
}

//var stopLights = 4
//let townPlanByAddingLightsToExistingLights = makeTownGrand()
//stopLights = townPlanByAddingLightsToExistingLights(4, 4)

// 4.函数作为参数

/// 发展小镇2
///
/// - Parameters:
///   - budget: 预算
///   - condition: 是否符合预算函数参数 参数预算 返回值 BOOL
/// - Returns: 函数建造公路 参数添加路灯和已有参数, 返回路灯数和
func makeTownGrand(withBudget budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    } else {
        return nil
    }
}

// 评估
func evalute(budget: Int) -> Bool {
     return budget > 10_000
}

var stopLights = 4

// 1_000 预算来建设小镇
if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 1_000, condition: evalute) {
    stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
}

// 15_000 预算来建设小镇
if let newTownPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 15_000, condition: evalute) {
    stopLights = newTownPlanByAddingLightsToExistingLights(4, stopLights)
}

// 5. 闭包能捕获变量
// 闭包和函数能记录在其闭合作用域中定义的变量所封装的内部信息.
func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopution = 5_422
let gorwBy = makePopulationTracker(forInitialPopulation: currentPopution)

gorwBy(500)
gorwBy(500)
gorwBy(500)
gorwBy(500)

// 6.闭包是引用类型(reference type).
// 这意味着当你把函数赋给常量或变量时, 实际上是在让这个常量和变量指向这个函数. 如果新的常量或变量调用这个函数, 那么其作用域的任何信息都会改变
let anotherGorwBy = gorwBy
anotherGorwBy(500)

// 函数式编程
// 1.函数是一等公民: 和其他类型一样, 可以作为参数, 也可以作为返回值
// 2.纯函数
// 3.不可变性" 不鼓励可变性, 因为值可变的数据更难分析
// 4.强类型: 强类型系统能增加代码的运行时安全性, 语言的类型系统会在编译时得到检查


//: [Next](@next)
