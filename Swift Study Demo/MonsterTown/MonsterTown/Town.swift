//
//  Town.swift
//  MonsterTown
//
//  Created by CuiJian on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

/// 镇
struct Town {
    
    /// 区域
    static let region = "south"
    
    /// 人口
    var population = 5_422 {
//        didSet(oldPopolation) {
//            print("人口已经从\(oldPopolation)变化为\(population)")
//        }
        didSet {
            print("人口已经从\(oldValue)变化为\(population)")
        }
    }
    
    /// 红绿灯
    var numberOfStopLights = 4
    
    // 嵌套类型
    enum Size {
        case small
        case medium
        case large
    }
    
    // 小镇规模 (只读的计算属性)
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
            case 10_001...100_000:
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
    /// 打印描述
    func printDescription() {
        print("人口数为: \(population), 红绿灯数为: \(numberOfStopLights)")
    }
    
    /// 改变人口
    ///
    /// - Parameter amount: 修改数量
    mutating func changePopulation(by amount: Int) {
        if population + amount <= 0 {
            population = 0
        } else {
            population += amount
        }
    }
}
