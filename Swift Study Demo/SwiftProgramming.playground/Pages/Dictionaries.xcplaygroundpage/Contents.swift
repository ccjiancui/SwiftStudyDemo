//: [Previous](@previous)

import Foundation

// 对于集合，顺序不总是很重要，有时候我们只是想在容器中持有一组数据，并在需要时获取信息。就是字典的使用场景
// Dictionary 中的键必须是唯一的
// 对于 Swift 中 Dictionary 类型的键，唯一的要求是其必可散列（hashable）：也就是每个 key 必须通过一种机制让 Dictionary 保证任何给定的键都是唯一的。Swift 的基本类型都是可散列的，比如 String、Int、Float、Double 和 Bool

// 创建字典
var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String: Double] = [:]
var dict4 = [String: Double]()

// 以上四种方法创建的字典都是一样的, 那么[:] 和 () 语法有什么区别? 本质上是一样的. [:] 是使用的字面量语法创建了这个字典类型的空实例, 而 () 是使用这个字典类型的初始化方法


/// 电影评分字典
var movieRatings = ["Harry Potter": 4, "The Lord of the Rings": 5, "Forrest Gump": 5]

// 1.访问字典
let gumpRating = movieRatings["Forrest Gump"]
// 访问勇敢的心评分, 实际是没有
let braveHeartRating = movieRatings["BraveHeart"]

type(of: movieRatings)
type(of: gumpRating)
// 字典 movieRatings 的类型是 [String : Int], 而 gumpRating 的类型却是 Int?, 为什么不一样?
// 数组有序集合, 当根据索引来找到其中的值, 如果数组索引大于 数组序列最大值, 那么就是我们平常遇到的数组越界, 取一个有序集合时候, 取超过序列的索引是没有意义的, 计算机也不知道返回什么值, 实际也不应该这么做. 所以是报错处理
// 字典就不太一样, 字典偏重与查询功能, 只在需要的时候获取信息, 字典中 key 是唯一的, 查询字典不包含 key 时, 结果应该是查询不到, 并且通过返回 nil 来告诉你请求的值不存在, 所以返回类型是可选类型.

// 2.修改值方法
// 如果有这个 key 那么更新值, 如果没有则新增值
movieRatings["Forrest Gump"] = 4

// 更新的 key 如果不存在, 那么是更新不成功的, 如果存在 key 会更新值, 并且在更新后可以拿到这个键的旧值
let oldRating = movieRatings.updateValue(3, forKey: "BraveHeart")
if let lastRating = oldRating, let currentRating = movieRatings["BraveHeart"] {
    print("Old Rating: \(lastRating); current rating: \(currentRating)")
}

// 3.增加值
movieRatings["BraveHeart"] = 3

// 4.删除值
movieRatings.removeValue(forKey: "Harry Potter")
// removeValue(forKey: _) 方法可删除值, 并返回这个键关联值
// 也可以使用, 本质上一样, 不会返回被删除的值
movieRatings["Harry Potter"] = nil
movieRatings

// 遍历字典
for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}

for movie in movieRatings.keys {
    print("User has rated \(movie)")
}

let warchedMovies = Array(movieRatings.keys)

//: [Next](@next)
