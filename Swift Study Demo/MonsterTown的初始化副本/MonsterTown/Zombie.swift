//
//  Zombie.swift
//  MonsterTown
//
//  Created by CuiJian on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 僵尸
class Zombie: Monster {
    
    /// 跛行
    var walkWithLimp: Bool
    
    /// 散架
    private(set) var isFallingApart: Bool
    
    // 指定初始化方法最后才调用父类的初始方法, 需要为自己引入的属性赋值, 然后 super 调用父类初始化方法, 以便父类初始化自己属性
    init(limp: Bool, fallingApart: Bool, town: Town?, mosterName: String) {
        walkWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: mosterName)
    }
    
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, mosterName: "Fred")
        if walkWithLimp {
            print("这个僵尸的膝盖废了")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walkWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us\n")
    }
    
    
    // super 是一个前缀, 用来访问父类方法实现
    // super 是基于继承思想的产物, 在枚举, 结构体等值类型上不可用
    // 调用 super 可以从父类借用功能或重写父类的功能
    
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
    }
    
//    class func makeSpookyNoise() -> String {
//        return "Brains..."
//    }
    
    override class var makeSpookyNoise: String {
        return "Brains..."
    }
}
