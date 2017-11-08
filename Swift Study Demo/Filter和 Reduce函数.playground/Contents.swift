//: Playground - noun: a place where people can play

import UIKit

let arr = [1, 2 ,3, 4, 5, 6]



// 过滤函数 filter, 默认过滤条件为 true 的保留, 并且返回新的数组
let arr1 = arr.filter { (num) -> Bool in
    num % 2 == 0
}

// 返回值可以省略
let arr2 = arr.filter { num in
    num % 2 == 0
}

// 可以使用 Swift 内建的用来代表参数的简写$0, 这让我们可以不用写出 num 参数
let arr3 = arr.filter { $0 % 2 == 0 }
arr3



// 很短的闭包, 省略参数有利于提高阅读性
// 如果闭包较复杂, 应该显示的把参数名字写出来
// 如果闭包可以很好地写在一行里的话, 那么使用简写名会更合适

let arr4 = arr.map { $0 * $0 }
arr4


// 组合使用 map 和 filter 函数, 可以轻易的完成很多数据的操作, 而不需要引入中间数组. 这会使得最终的代码变得更短更易读
// 寻找100以内同时满足是偶数并且是其他数字的平方的数
let a = [0,1,2,3,4,5,6,7,8,9]
let b = a.map{$0 * $0}.filter{$0 % 2 == 0}
b

// reduce 函数
// 计算数组的合
let num = [0,1,2,3,4,5,6,7,8,9]

var total = 0
for item in num {
    total = total + item
}
total


// 参数初始值0, 中间累加值(total), 序列中元素(num) 返回值得类型(Int)
let summary = num.reduce(0) { (total, num) -> Int in
    total + num
}
summary

let summary2 = num.reduce(0, +)
summary2

// 可以拼接字符串
let str = num.reduce("") { (str, num) in
    str + "\(num)"
}


// slice 数组切片
let arr5 = [0, 2, 4, 8, 4, 2]
let d = arr5[1..<arr5.endIndex]
 
// indexOf 取出某个元素的索引
let index = arr5.index(of: 8)
























