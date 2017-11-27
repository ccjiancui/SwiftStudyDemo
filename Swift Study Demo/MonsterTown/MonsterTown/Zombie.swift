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
    var walkWithLimp = true
    
    /// 散架
    private(set) var isFallingApart = false
    
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
