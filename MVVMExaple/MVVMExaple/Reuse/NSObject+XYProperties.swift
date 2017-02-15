//
//  NSObject+XYProperties.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

extension NSObject {

    /**
     *  ViewModelBlock
     */
    typealias ViewModelBlock = () -> Void
    
    /**
     *  ViewMangerInfosBlock
     */
    typealias ViewMangerInfosBlock = () -> Void
    
    /**
     *  ViewModelInfosBlock
     */
    typealias ViewModelInfosBlock = () -> Void
    
    
    // MARK: - 定义一个类属性作为block容器
    class XYPropertyBlockContainer: NSObject, NSCopying {
   
        func copy(with zone: NSZone? = nil) -> Any {
            return self
        }
        
        /**
         *  viewModelBlock
         */
        var viewModelBlock : ViewModelBlock?
        
        /**
         *  ViewMangerInfosBlock
         */
        var viewMangerInfosBlock : ViewMangerInfosBlock?
        /**
         *  ViewModelInfosBlock
         */
        
        var viewModelInfosBlock : ViewModelInfosBlock?
        

    }
    
    // MARK: - 关联属性的可以
    private struct RunTimeKey {
        static let blockContainerKey = UnsafeRawPointer(bitPattern: "blockContainerKey".hashValue)
//        static var blockContainerKey = "blockContainerKey"
        static let viewMangerDelegateKey = UnsafeRawPointer(bitPattern: "viewMangerDelegate".hashValue)
        static let viewModelDelegateKey = UnsafeRawPointer(bitPattern: "viewModelDelegateKey".hashValue)
        static let xy_viewMangerInfosKey = UnsafeRawPointer(bitPattern: "xy_viewMangerInfosKey".hashValue)
        static let xy_viewModelInfosKey = UnsafeRawPointer(bitPattern: "xy_viewModelInfosKey".hashValue)
        static let xy_mediatorKey = UnsafeRawPointer(bitPattern: "xy_mediatorKey".hashValue)
    }

    /// block容器
    var propertyBlockContainer : XYPropertyBlockContainer? {
        set {
            objc_setAssociatedObject(self, RunTimeKey.blockContainerKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            if let blockContainer = objc_getAssociatedObject(self, RunTimeKey.blockContainerKey) as? XYPropertyBlockContainer {
            
                return blockContainer
            }
            return nil
        }
    }
    
    
    /**
     *  viewMangerDelegate
     */
    var viewMangerDelegate: XYViewManagerProtocol? {
    
        set {
            objc_setAssociatedObject(self, RunTimeKey.viewMangerDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get {
            if let viewMangerDelegate = objc_getAssociatedObject(self, RunTimeKey.viewMangerDelegateKey) as? XYViewManagerProtocol {
                return viewMangerDelegate
            }
            return nil
        }
    }
    

    
    /**
     *  viewModelDelegate
     */
    weak var viewModelDelegate: XYViewModelProtocol? {
        set {
            objc_setAssociatedObject(self, RunTimeKey.viewModelDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get {
            if let viewModelDelegate = objc_getAssociatedObject(self, RunTimeKey.viewModelDelegateKey) as? XYViewModelProtocol {
                return viewModelDelegate
            }
            return nil
        }
    }

    
    /**
     *  mediator
     */
    var xy_mediator : XYMediator? {
        set {
            objc_setAssociatedObject(self, RunTimeKey.xy_mediatorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            if let xy_mediator = objc_getAssociatedObject(self, RunTimeKey.xy_mediatorKey) as? XYMediator {
                return xy_mediator
            }
            return nil
        }
    }
    
    
    /**
     *  xy_viewMangerInfos
     */
    var xy_viewMangerInfos: [String: AnyObject]? {
        set {
            objc_setAssociatedObject(self, RunTimeKey.xy_viewMangerInfosKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            if let xy_viewMangerInfos = objc_getAssociatedObject(self, RunTimeKey.xy_viewMangerInfosKey) as? [String: AnyObject] {
                return xy_viewMangerInfos
            }
            return nil
        }
        
    }
    
    
    /**
     *  xy_viewModelInfos
     */
    var xy_viewModelInfos: [String: AnyObject]? {
        set {
            objc_setAssociatedObject(self, RunTimeKey.xy_viewModelInfosKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            if let xy_viewModelInfos = objc_getAssociatedObject(self, RunTimeKey.xy_viewModelInfosKey) as? [String: AnyObject] {
                return xy_viewModelInfos
            }
            return nil
        }
        
    }
    
    

    /**
     *  获取一个对象的所有属性
     */
    class func xy_propertyList() -> [String] {
        var count: UInt32 = 0
        //1.获取类的属性列表,返回属性列表的数组,可选项
        let list = class_copyPropertyList(self, &count)
        print("属性个数:\(count)")
        for i in 0..<Int(count) {
            //使用guard语法,一次判断每一项是否有值,只要有一项为nil,就不再执行后续的代码
            guard let pty = list?[i],
                let cName = property_getName(pty),
                let name = String(utf8String: cName)
                else {
                    //继续遍历下一个
                    continue
            }
            print(name)
        }
        free(list)
        return []
    }
    

}

