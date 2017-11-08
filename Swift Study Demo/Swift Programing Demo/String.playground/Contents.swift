//: Playground - noun: a place where people can play

import Cocoa

let tel = "17723450089"

// 从某个位置开始截取, 比如从倒数第四个位置开始截取, 截取末四位
let str1 = tel.substring(from: tel.index(tel.endIndex, offsetBy: -4))

// 截取到某个位置, 比如截取到倒数第四个位置
let str2 = tel.substring(to: tel.index(tel.endIndex, offsetBy: -4))

// 截取前四位
let str3 = tel.substring(to: tel.index(tel.startIndex, offsetBy: 4))