//
//  main.swift
//  MonsterTown
//
//  Created by che300 on 2017/8/22.
//  Copyright © 2017年 CuiJian. All rights reserved.
//

import Foundation

print("Hello, World!")

var myTown = Town()
myTown.changePopulation(by: 500)
myTown.printDescription()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

let fredTheVampire = Vampire()
fredTheVampire.town = myTown
fredTheVampire.terrorizeTown()
fredTheVampire.town?.printDescription()

print(Zombie.makeSpookyNoise())
print(GiantZombie.makeSpookyNoise())

