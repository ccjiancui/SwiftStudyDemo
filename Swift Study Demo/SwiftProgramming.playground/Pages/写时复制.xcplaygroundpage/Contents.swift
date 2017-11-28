//: [Previous](@previous)

import Foundation

// 写时复制（copy on write，COW）是指对值类型的底层的隐式共享。这种优化能够让某个值类型的多个实例共享一个底层存储。也就是每个实例自己并不持有一份数据的副本；反之，每个实例会维护自己对同一份存储的引用。如果某个实例需要修改或写入存储，那么这个实例就会产生一份自己的副本。这意味着值类型能避免创建多余的数据副本。


/// 整形数组缓冲区
fileprivate class IntArrayBuffer {
    var storage: [Int]
    
    init() {
        storage = []
    }
    
    init(buffer: IntArrayBuffer) {
        storage = buffer.storage
    }
}

struct IntArray {
    
    /// 后备存储
    private var buffer: IntArrayBuffer
    
    init() {
        buffer = IntArrayBuffer()
    }
    
    func describe() {
        print(buffer.storage)
    }
    
    private mutating func copyIfNeeded() {
        if !isKnownUniquelyReferenced(&buffer) {
            print("Making a copy of \(buffer.storage)")
            buffer = IntArrayBuffer(buffer: buffer)
        }
    }
    
    mutating func insert(_ value: Int, at index: Int) {
        copyIfNeeded()
        buffer.storage.insert(value, at: index)
    }
    
    mutating func append(_ value: Int) {
        copyIfNeeded()
        buffer.storage.append(value)
    }
    
    mutating func remove(at index: Int) {
        copyIfNeeded()
        buffer.storage.remove(at: index)
    }
}



var integers = IntArray()
integers.append(1)
integers.append(2)
integers.append(3)
integers.append(4)
integers.describe()

print("copying integers to ints")
var ints = integers
print("inserting into ints")
ints.insert(3, at: 2)
integers.describe()
ints.describe()


//: [Next](@next)
