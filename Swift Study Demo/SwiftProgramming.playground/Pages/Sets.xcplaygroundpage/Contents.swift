//: [Previous](@previous)

import Foundation

//var groceryBag = Set<String>()
//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapple")

//var groceryBag = Set(["Apples", "Oranges", "Pineapple"])

var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")
let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])

// 取并集(生成新的集合)
var commonGroceryBag = groceryBag.union(friendsGroceryBag)

// 取并集(改动原有实例)
groceryBag.formUnion(friendsGroceryBag)

let roomatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])

// 取交集(生成新的集合)
let itemsToReturn = commonGroceryBag.intersection(roomatesGroceryBag)

// 取交集(改动原有实例)
commonGroceryBag.formIntersection(roomatesGroceryBag)



// 不相交的
let yourSecondBag = Set(["Berries", "Yogurt"])
let roomatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roomatesSecondBag)

let myCities = Set(["北京", "上海", "南京", "芜湖", "广州"])
let yourCities = Set(["北京", "南京"])
let isSuper = myCities.isSuperset(of: yourCities)
let isSuber = yourCities.isSubset(of: myCities)

// 集合的操作
// 1.并集 formUnion(_:)
// 2.交集 formIntersection(_:)
// 3.互不想交 isDisjoint(with:)
// 4.判断子集 isSubset(of: )
// 5.判断父集 isSuperset(of: )�是很重要，有时候我们只是想在容器中持有一组数据，并在需要时获取信息。就是字典的使用场景

//: [Next](@next)
