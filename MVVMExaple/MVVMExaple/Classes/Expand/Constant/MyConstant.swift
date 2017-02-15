//
//  MyConstant.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit



public func kColor(red: CGFloat, green: CGFloat, blue: CGFloat) ->UIColor {
    return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
}


let COLOR_RANDOM = kColor(red: CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0)
let COLOR_TABBAR_BG = kColor(red: 255, green: 255, blue: 255)

let COLOR_TABBAR_TEXT_SEL = kColor(red: 249, green: 98, blue: 88)
let COLOR_TABBAR_TEXT = kColor(red: 167, green: 167, blue: 167)
let COLOR_NAVBAR_BG = kColor(red: 254, green: 242, blue: 0)


