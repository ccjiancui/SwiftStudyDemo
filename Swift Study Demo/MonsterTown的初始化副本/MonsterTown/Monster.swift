//
//  Monster.swift
//  MonsterTown
//
//  Created by CuiJian on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 怪兽
class Monster {
    static let isTerrifying = true
    class var makeSpookyNoise: String {
        return "Grrr..."
    }
    
    var town: Town?
    var name: String
    
    // 类的指定初始化方法
    required init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }
    
    
    
    /// 受害者数量(计算属性 读写)
    var victimpol: Int {
        get {
            return town?.population ?? 0
        }
//        set(newVictimpol) {
//            town?.population = newVictimpol
//        }
        set {
            town?.population = newValue
        }
    }
    
    /// 侵扰小镇
    func terrorizeTown() {
        if town != nil {
            print("\(name) 侵袭了一个小镇!\n")
        } else {
            print("\(name) 还没有找到可以侵袭的小镇...\n")
        }
    }
}
