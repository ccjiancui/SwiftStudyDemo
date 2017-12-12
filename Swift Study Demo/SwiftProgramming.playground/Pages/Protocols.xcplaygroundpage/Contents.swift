//: [Previous](@previous)

import Foundation

func printTable(_ data: [[String]], withColumnLabels columnLabels: String...) {
    var firstRow = "|"
    
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(firstRow)
    
    for row in data {
        // 创建空字符串
        var out = "|"
        
        // 把一行每一项都拼接到字符串上
        for item in row {
            out += " \(item) |"
        }
        
        
        // 完成，打印出来
        print(out)
    }
}

let data = [
    ["Joe", "30", "6"],
    ["Karen", "40", "18"],
    ["Fred", "50", "20"],
]

printTable(data, withColumnLabels: "Employee Name", "Age", "Years of Experience")

//: [Next](@next)
