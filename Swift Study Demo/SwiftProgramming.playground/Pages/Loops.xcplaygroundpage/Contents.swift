//: [Previous](@previous)

import Foundation

var myFirstInt: Int = 0

for i in 1...5 {
    myFirstInt += 1
    myFirstInt
}

// 使用带 where 子句的 for-in 循环
for i in 1...100 where i % 3 == 0 {
    print(i)
}

// 如果没有 where 子句, 语句就没有那么优雅
for i in 1...100 {
    if i % 3 == 0 {
        print(i)
    }
}

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}


// MARK: - 太空射击游戏

var shields = 5
var blasterOverHeating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    
    if spaceDemonsDestroyed == 200 {
        print("你赢了!")
        break
    }
    
    if blasterOverHeating {
        print("爆能枪过热了! 重新冷却.")
        sleep(5)
        print("爆能枪已经准备好")
        sleep(1)
        blasterOverHeating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blasterOverHeating = true
        continue
    }
    
    print("爆能枪开火")
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}

var num = 1
while num <= 100 {
    switch num {
    case let value where value % 3 == 0 && value % 5 == 0:
        print("FIZZ,BUZZ")
    case let value where value % 3 == 0:
        print("FIZZ")
    case let value where value % 5 == 0:
        print("BUZZ")
    default:
        print(num)
    }
    num += 1
}

//: [Next](@next)
