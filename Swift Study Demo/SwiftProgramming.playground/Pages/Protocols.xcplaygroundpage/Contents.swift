//: [Previous](@previous)

import Foundation
// 协议可以让你无须知道类型本身的信息，就能绑定并利用类型的接口 interface，接口是类型提供的一组属性和方法
// 协议不仅能定义遵守该协议的类型必须提供的属性和方法，自己还能作为类型使用：变量、函数参数和返回值都可以把协议作为类型。
// 所有的类型都可以遵守协议
// 一个类型可以遵守多个协议
//

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

struct Person {
    let name: String
    let age: Int
    let yearOfExprience: Int
}

/// 部门
struct Department: TabularDataSource, CustomStringConvertible {
   
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0:
            return "Employee Name"
        case 1:
            return "Age"
        case 2:
            return "Years Of Experience"
        default:
            fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0:
            return person.name
        case 1:
            return String(person.age)
        case 2:
            return String(person.yearOfExprience)
        default:
            fatalError("Invalid column!")
        }
    }
}

// 协议组合
func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    var firstRow = "|"
    
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // 创建空字符串
        var out = "|"
        
        // 把一行每一项都拼接到字符串上
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        // 完成，打印出来
        print(out)
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearOfExprience: 6))
department.add(Person(name: "Karen", age: 40, yearOfExprience: 18))
department.add(Person(name: "Fred", age: 50, yearOfExprience: 20))

printTable(department)



//: [Next](@next)
