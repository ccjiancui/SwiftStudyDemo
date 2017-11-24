//
//  Monster.swift
//  MonsterTown
//
//  Created by che300 on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 怪兽
class Monster {
    var town: Town?
    var name = "Monster"
    
    /// 侵扰小镇
    func terrorizeTown() {
        if town != nil {
            print("\(name) 侵袭了一个小镇!\n")
        } else {
            print("\(name) 还没有找到可以侵袭的小镇...\n")
        }
    }
}
