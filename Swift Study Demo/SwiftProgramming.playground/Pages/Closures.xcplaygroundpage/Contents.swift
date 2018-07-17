//: [Previous](@previous)

import Foundation

// 闭包的简写方式

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

// 函数是有名字的闭包
func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

// sorted(by: <#T##(Int, Int) -> Bool#>)
let volunteerSorted = volunteerCounts.sorted(by: sortAscending)

// 完整闭包
let volunteerSorted1 = volunteerCounts.sorted(by: { (i: Int, j: Int) -> Bool in
    return i < j
})

// 尾随闭包语法
// 如果一个闭包是以一个函数的最后一个参数传递的, 那么它就可以在函数的圆括号以外内联.
// 因为 sorted(by:) 只接收一个参数,所以根本不需要圆括号. 之所以可以省略闭包的参数名, 是因为尾随闭包语法允许这么做
let volunteerSorted2 = volunteerCounts.sorted { (i: Int, j: Int) -> Bool in
    return i < j
}

// 1. 利用类型推断简写闭包, 移除了两个参数和返回值的类型信息.返回值类型可以移除是因为编译器知道检查 i < j 是否成立返回 true 或 false
// 2. 闭包表达式放在一行
// 3. 移除关键字 return. 只有一个表达式才能移除, 存在更多表达式, 显式显示 return 是必需的
let volunteerSorted3 = volunteerCounts.sorted { i, j in i < j }

//Swift提供了快捷参数名，可以在内联闭包 表达式中引用。这些快捷参数名和显式声明的参数类似：类型和值都一样。编译器的类型推断能 力让它知道闭包接受的参数个数和类型，这意味着不需要给参数命名。
// 利用参数名的快捷语法 内联闭包表达式中使用
let volunteerSorted4 = volunteerCounts.sorted { $0 < $1 }
// 代码简洁是智慧的灵魂, 不过分追求简洁, 保持代码的可读性和可维护性永远是最重要的.

// test1, 数组原地从小到大排序
volunteerCounts.sort()
volunteerCounts

// test2, 数组排序从小到大简单方法
let volunteerSorted5 = volunteerCounts.sorted()

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

// 另外一个城市人口
var anotherCityPopulation = 20_680
let gorwByanotherCity = makePopulationTracker(forInitialPopulation: anotherCityPopulation)
gorwByanotherCity(4_000)
gorwByanotherCity(4_000)
gorwByanotherCity(4_000)

// 函数式编程
// 1.函数是一等公民: 和其他类型一样, 可以作为参数传递给别的函数, 可以存储在变量中.
// 2.纯函数: 函数没有副作用; 给定同样的输入, 函数永远返回同样的输出, 而且不会修改程序中其他地方的状态.
// 3.不可变性" 不鼓励可变性, 因为值可变的数据更难分析
// 4.强类型: 强类型系统能增加代码的运行时安全性, 语言的类型系统会在编译时得到检查
// Swift 支持以上所有特性
// 函数式编程能让代码更简洁, 表达力更强. 通过鼓励不可变性和编译时类型检查, 代码在运行时也更安全. 函数式编程的这些特点还让代码更易读, 更易维护.

// 高阶函数

// 1.map 一个函数作用在数组的每一个元素上并返回另一个数组
// 2.filter 通过函数过滤数组返回过滤后的数组
// 3.reduce 将元素合并到一个总和的值中

/// 各个区的人口
let precinctPopulation = [1244, 2021, 2157]
// 人口的增长速度是2
let projectedPopulations = precinctPopulation.map { (population: Int) -> Int in
    return population * 2
}

// 简写 参数类型推断省略类型声明, 只有一行表达式省略 return
//let projectedPopulations = precinctPopulation.map { (population) -> Int in
//    population * 2
//}

let projectedPopulations2 = precinctPopulation.map { $0 * 2 }
projectedPopulations2

// 过滤人口超过4000的地区
let bigProjections = projectedPopulations.filter { (projection: Int) -> Bool in
    return projection > 4000
}

// 简写 filter
let bigProjections2 = projectedPopulations.filter { $0 > 4000 }
bigProjections2


let totalProjection = projectedPopulations.reduce(0) { (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
}

// 简写 reduce
let totalProjection2 = projectedPopulations.reduce(0) { $0 + $1 }
totalProjection2

//: [Next](@next)
