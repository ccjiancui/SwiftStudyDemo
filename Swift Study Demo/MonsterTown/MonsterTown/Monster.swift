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
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
