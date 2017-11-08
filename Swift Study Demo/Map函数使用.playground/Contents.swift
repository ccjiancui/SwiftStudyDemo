//: Playground - noun: a place where people can play

import UIKit

// 对一个数组每个元素进行平方处理
let a = [1, 2, 3, 4, 5]

var b = [Int]()
for item in a{
    b.append(item * item)
}

b

// map 就像一个信号, 一旦你看到它, 就会知道即将有一个函数作用在数组的每个元素上, 并返回另一个数组, 它将包含所有被转换后的结果
let c = a.map { (item) -> Int in // 这里的返回值是每个元素操作后返回类型,如果省略默认原类型
    item * item
}

// 不必再使用 var 类型了, 因为 c 数组将由 map 的结果得到, 也不用显示的指定类型

let dataList: [(title: String, value: Int, desc: String)] = [
    (title: "牛奶", value: 1, desc: "蛋白质"),
    (title: "鸡蛋", value: 1, desc: "营养高"),
    (title: "面包", value: 1, desc: "主食"),
    (title: "可乐", value: 1, desc: "垃圾食品"),
    (title: "水果", value: 1, desc: "富含维生素"),
]

class Food {
    var name: String
    var serialNumber: Int
    var descption: String
    
    init(name: String, serialNumber: Int, descption: String){
        self.name = name
        self.serialNumber = serialNumber
        self.descption = descption
    }
}

// map 的参数接受数组中的每个元素, element 代表 dataList 中的每个元素
// 参数的返回类型 Food, 代表每个元素经过映射转换后变为 Food 类型
// map 再将这些转换后的元素组成一个新的数组并返回 dataArray 的类型是 [Food]
let dataArray = dataList.map { (element) -> Food in
    Food.init(name: element.title, serialNumber: element.value, descption: element.desc)
}

// flatMap 函数在元素转换的时候摒弃了 nil 值
// flatMap 在元素值不为 nil 情况下, 可以将可选类型转换成非可选类型
let dataArray2 = dataList.flatMap { (element) -> Food in
    Food.init(name: element.title, serialNumber: element.value, descption: element.desc)
}
