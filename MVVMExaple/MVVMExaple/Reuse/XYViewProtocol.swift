//
//  XYViewProtocol.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

// MARK: - 制定view事件传递的协议
@objc protocol XYViewProtocol: NSObjectProtocol {
    
    /// 将view的事件通过代理传递出去
    /// - parameter view: view自己
    /// - parameter events: 所触发事件的一些描述信息
    @objc optional func xy_view(_ view: UIView, events: [String: AnyObject]) -> Void
    
}
