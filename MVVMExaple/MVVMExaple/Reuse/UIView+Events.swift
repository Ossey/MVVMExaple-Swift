//
//  UIView+Events.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

extension UIView {
    
    typealias ViewEventsBlock = () -> Void
    
    /// 关联属性的key
    private struct RunTimeKey {
        
        static let viewDelegateKey = UnsafeRawPointer.init(bitPattern: "viewDelegateKey".hashValue)
        static let viewEventsBlockKey = UnsafeRawPointer.init(bitPattern: "viewEventsBlockKey".hashValue)
    }
    
    /// 定义一个类属性作为闭包容器
    class XYEventsBlockContainer {
        var viewEventsBlock : ViewEventsBlock?
        
    }

   /// 传递view事件的代理对象
   weak var viewDelegate: XYViewProtocol? {
        set {
            objc_setAssociatedObject(self, RunTimeKey.viewDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get {
            return objc_getAssociatedObject(self, RunTimeKey.viewDelegateKey) as! XYViewProtocol?
        }
    }
    
    /// 传递view事件的闭包
    var eventBlockContainer: XYEventsBlockContainer? {
        get {
            if let viewEventsBlock = objc_getAssociatedObject(self, RunTimeKey.viewEventsBlockKey) as? XYEventsBlockContainer {
                return viewEventsBlock
            }
            return nil
        }
        
        set {
            objc_setAssociatedObject(self, RunTimeKey.viewEventsBlockKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    /// 将view的事件交给viewManager处理
    func xy_viewManager(viewManger: XYViewProtocol?) -> Void {
        guard let viewManger = viewManger else {
            return
        }
        viewDelegate = viewManger
    }
    
}
