//
//  Town.swift
//  MonsterTown
//
//  Created by che300 on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 镇
struct Town {
    
    /// 人口
    var population = 5_422
    
    /// 路灯
    var numberOfStopLights = 4
    
    func printDescription() {
        print("population: \(population), number of stopLights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        if population + amount <= 0 {
            population = 0
        } else {
            population += amount
        }
    }
}
