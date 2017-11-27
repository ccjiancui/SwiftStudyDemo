//
//  Vampire.swift
//  MonsterTown
//
//  Created by CuiJian on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 吸血鬼
class Vampire: Monster {
    var vampireThrall = 0
    
    override func terrorizeTown() {
        town?.changePopulation(by: -1)
        vampireThrall += 1
        super.terrorizeTown()
    }
}
