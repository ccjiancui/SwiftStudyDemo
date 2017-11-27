//
//  main.swift
//  MonsterTown
//
//  Created by CuiJian on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

var myTown = Town(population: 10_000, stopLights: 4)
let myTownSize = myTown?.townSize
print(myTownSize as Any)
myTown?.changePopulation(by: 1_000_000)
print("Size: \(String(describing: myTown?.townSize)); population: \(String(describing: myTown?.population))")


var fredTheZombie: Zombie? = Zombie(limp: true, fallingApart: false, town: myTown, mosterName: "Fred")
fredTheZombie?.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()
var convenientZombie = Zombie(limp: true, fallingApart: true)
fredTheZombie = nil


let fredTheVampire = Vampire(town: myTown, monsterName: "Lucy")
fredTheVampire.town = myTown
fredTheVampire.terrorizeTown()
fredTheVampire.town?.printDescription()

print(Monster.makeSpookyNoise)
print(Zombie.makeSpookyNoise)
if Zombie.isTerrifying {
    print("快跑哦!")
}
