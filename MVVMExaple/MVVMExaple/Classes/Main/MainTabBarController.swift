//
//  MainTabBarController.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    override class func initialize() -> Void {
        if self.classForCoder() == MainTabBarController.self {
            let tabBar = UITabBar.appearance();
            tabBar.backgroundColor = COLOR_TABBAR_BG
            
            let item = UITabBarItem.appearance()
        
            item.setTitleTextAttributes([NSForegroundColorAttributeName: COLOR_TABBAR_TEXT], for: .normal)
            item.setTitleTextAttributes([NSForegroundColorAttributeName: COLOR_TABBAR_TEXT_SEL], for: .selected)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomePageViewController(), "find_tabbar_selecte", "首页")
        addChildViewController(HomePageViewController(), "moment_tabbar_select", "动态")
        addChildViewController(HomePageViewController(), "chat_tabbar_select", "消息")
        addChildViewController(HomePageViewController(), "mine_tabbar_select", "我的")
    }

    /// 添加子控件
    private func addChildViewController(_ childController: UIViewController, _ imageName: String, _ title: String) {
        let nav = MainNavigationController(rootViewController: childController)
        nav.tabBarItem.image = UIImage(named: imageName)?.xy_originalMode()
        nav.tabBarItem.title = title
        addChildViewController(nav)
    }
    


}
