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
    var walkWithLimp = true
    
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
