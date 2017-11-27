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
    let region: String
    
    /// 人口
    var population: Int {
        didSet {
            print("人口已经从\(oldValue)变化为\(population)")
        }
    }
    
    /// 红绿灯
    var numberOfStopLights: Int
    
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
    
    // 自定义初始化方法
    init?(region: String, population: Int, stopLights: Int) {
        self.region = region
        self.population = population
        numberOfStopLights = stopLights
    }
    
    // 委托初始化方法
    init?(population: Int, stopLights: Int) {
        self.init(region: "south", population: population, stopLights: stopLights)
    }
    
    
    
    /// 打印描述
    func printDescription() {
        print("人口数为: \(population), 红绿灯数为: \(numberOfStopLights), 区域\(region)")
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
