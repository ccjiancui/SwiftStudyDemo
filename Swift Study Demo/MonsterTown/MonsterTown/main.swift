//
//  main.swift
//  MonsterTown
//
//  Created by CuiJian on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

var myTown = Town()
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population: \(myTown.population)")


let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

let fredTheVampire = Vampire()
fredTheVampire.town = myTown
fredTheVampire.terrorizeTown()
fredTheVampire.town?.printDescription()

print(Monster.makeSpookyNoise)
print(Zombie.makeSpookyNoise)
if Zombie.isTerrifying {
    print("快跑哦!")
}
