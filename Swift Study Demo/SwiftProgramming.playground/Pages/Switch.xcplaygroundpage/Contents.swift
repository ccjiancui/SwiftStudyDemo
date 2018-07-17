//: [Previous](@previous)

import Foundation

// 每个 case 可以不写 break
// 1. switch 分支可以有多个匹配值，以逗号“,”隔开
// 2. switch 分支可以匹配区间 case：500…505
// 3. switch 分支可以使用值绑定获取临时变量，添加 where 子句做条件判断
// 4. switch 分支可以结合元祖，进行模式匹配
// 5. switch 可以使用 if case 来进行单一模式匹配，而不用使用 switch 方法，从而避免写无用的 default 分支

var statusCode = 200
var errorString = "The request failed with error:"

switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
case 204:
    errorString += " Successful but no content, 204."
case 300...307:
    errorString += " Redirection, \(statusCode)."
case 400...417:
    errorString += " Client error, \(statusCode)."
case 500...505:
    errorString += " Server error, \(statusCode)."
case let unknowCode where (unknowCode >= 200 && unknowCode < 300) || unknowCode > 505:
    errorString = "\(unknowCode) is not a know error code."
default:
    errorString = "Unexpected error encountered."
}

// MARK: - 元祖匹配

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):
    print("First item not found")
case (_, 404):
    print("Second item not found")
default:
    print("All items foun")
}

let age = 19

// 单个分支 switch
switch age {
case 18...35:
    print("Cool demographic")
default:
    break
}

if age >= 18 && age <= 35 { // 不推荐条件语句
    print("Cool demographic 不推荐条件语句")
}

// if-case 语句来提供类似于 switch 语句的模式匹配能力, 代替一个分支 switch
// 这种语法就优雅多了, 只要简单地检查 age 是否在给定区间内, 而不需要写一个你并不大关心的 default 分支
if case 18...35 = age {
    print("Cool demographic")
}

if case 18...35 = age, age >= 21 {
    print("In cool demographic and of drinking age")
}

// 只应用于需要switch模式匹配能力, 同时又不需要关心其他情况, 如果不是, 那应该直接使用 if-else

// MARK: - 判断点位与坐标系的位置

let point = (x: 0, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")
case (_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered")
}

//: [Next](@next)
