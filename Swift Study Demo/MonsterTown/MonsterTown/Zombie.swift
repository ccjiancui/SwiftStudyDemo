//
//  Zombie.swift
//  MonsterTown
//
//  Created by che300 on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 僵尸
class Zombie: Monster {
    
    /// 跛行
    var walkWithLimp = true
    
    // super 是一个前缀, 用来访问父类方法实现
    // super 是基于继承思想的产物, 在枚举, 结构体等值类型上不可用
    // 调用 super 可以从父类借用功能或重写父类的功能
    
    final override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
    }
    
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
}

/// 巨型僵尸
class GiantZombie: Zombie {
    override class func makeSpookyNoise() -> String {
        return "ROAR"
    }
}
