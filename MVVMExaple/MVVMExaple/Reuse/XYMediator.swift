//
//  XYMediator.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//  传递者

import UIKit

class XYMediator: NSObject {

    var viewModel: XYViewModelProtocol?
    var viewManager: XYViewManagerProtocol?
    
    init(_ viewModel: XYViewModelProtocol, _ viewManager: XYViewManagerProtocol) {
        super.init()
        self.viewModel = viewModel
        self.viewManager = viewManager
    }
    
    /// 将infos通知给viewModel
    public func notityViewModelWithInfos(_ infos: [String: AnyObject]) -> Void {
        xy_viewModelInfos = infos
    }
    
    /// 将infos通知给viewManager;
    public func notityViewManagerWithInfos(_ infos: [String: AnyObject]) -> Void {
        xy_viewMangerInfos = infos
    }
    
}
