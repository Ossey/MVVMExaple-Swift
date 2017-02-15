//
//  XYViewProtocol.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

// MARK: - 制定view事件传递的协议
protocol XYViewProtocol: NSObjectProtocol {
    
    /*
     将view的事件通过代理传递出去
     view  view自己
     events  所触发事件的一些描述信息
     */
    func xy_view(_ view: UIView, events: [Dictionary<String, Any>])
    
}
