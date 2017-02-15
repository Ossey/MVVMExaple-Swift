//
//  HomePageViewController.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    // MARK: - lazy
    lazy var firstView : FirstView = {
        let firstView = FirstView.viewFromNib()
        firstView.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: 300)
        self.view.addSubview(firstView)
        return firstView as! FirstView
    }()
    
    lazy var viewModel : FirsViewModel = {
        return FirsViewModel()
    }()
    
    lazy var viewManager: FirstViewManager = {
        let vm = FirstViewManager()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置firstView的事件处理者代理为viewManager
        self.firstView.xy_viewManager(viewManger: viewManager)
        
        // 设置firstView的时间处理者闭包 闭包方式
        let block = self.viewManager.xy_viewManagerWithViewEventBlockOfInfos(["1": "22" as AnyObject])
        self.firstView.eventBlockContainer?.viewEventsBlock = block
        
        // 让viewModel和viewManager之间通过代理进行交互
        viewModel.viewModelDelegate = viewManager as? XYViewModelProtocol
        viewManager.viewMangerDelegate = viewModel as? XYViewManagerProtocol
        
        /// viewModel和viewManager之间通过block方式交互
        self.viewManager.propertyBlockContainer?.viewModelInfosBlock = self.viewModel.xy_viewModelWithViewMangerBlockOfInfos(["info": "viewManager" as AnyObject])
        
    }

}
