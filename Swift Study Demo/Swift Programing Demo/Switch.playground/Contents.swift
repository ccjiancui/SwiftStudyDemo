//: Playground - noun: a place where people can play

import Cocoa

// MARK: - switch
// 功能强大的 switch
// 每个 case 可以不写 break
// 分支条件可以有多个值
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



let age = 12

// 单个分支 switch
switch age {
case 18...35:
    print("Cool demographic")
default:
    break
}

// if-case 语句来提供类似于 switch 语句的模式匹配能力, 代替一个分支 switch
if case 18...35 = age {
    print("Cool demographic")
}

if age >= 18 && age <= 35 { // 不推荐条件语句
    print("Cool demographic 不推荐条件语句")
}

// 这种语法就优雅多了, 只要简单地检查 age 是否在给定区间内, 而不需要写一个你并不大关心的 default 分支

// 多个条件的 if-case
if case 18...35 = age, age >= 21 {
    print("In cool demographic and of drinking age")
} else {
    print("未成年不能喝酒哦")
}

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
