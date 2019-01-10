//: [Previous](@previous)

import Foundation

var a = [1, 2, 3]
let copyA = a

func getBufferAddress<T>(array: [T]) -> String {
    return array.withUnsafeBufferPointer({ (pointer) -> String in
        return String(describing: pointer)
    })
}

// 数组的可变或不可变完全由 类型声明 var 和 let 决定
// 数组是值类型, 在写时复制的特性下, 当数组发生变化才会真正的复制一份
getBufferAddress(array: a)
getBufferAddress(array: copyA)
a.append(4)
getBufferAddress(array: a)
getBufferAddress(array: copyA)

// OC 中 数组可变和不可变由两个类型NSMutableArray, NSArray来区分
let b = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = b
let deepCopyB: NSArray = b.copy() as! NSArray
b.insert(0, at: 0)
copyB
deepCopyB

// 1.Swift 中不推荐使用下标式访问数组, 去掉了 C 语言中的三段式循环
// 数组越界会造成运行奔溃
// swift 会提供更具表现力的方法来实现

var numbers = [1, 2, 3, 4]

numbers.forEach { print($0) }
for (index, number) in numbers.enumerated() {
}

let index = numbers.index { $0 == 4 }
index

print(numbers.filter { $0 % 2 == 0})
numbers.first
numbers.last
numbers.removeLast()
numbers.popLast()
numbers.max()
numbers.min()
numbers.starts(with: [1, 3])
numbers.elementsEqual([1, 2])
numbers.contains(5)
numbers.sorted()
numbers.sorted(by: >)
numbers.reduce(0, +)
// map
// reduce
// filter



//: [Next](@next)
