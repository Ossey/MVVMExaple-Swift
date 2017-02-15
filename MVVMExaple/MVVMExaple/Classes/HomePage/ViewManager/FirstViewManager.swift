//
//  FirstViewManager.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

class FirstViewManager:NSObject, XYViewProtocol, XYViewManagerProtocol {
    
    
    internal func xy_view(_ view: UIView, events: [String: AnyObject]) {
        print(events)
    }

    internal func xy_viewManagerWithViewEventBlockOfInfos(_ infos: [String : AnyObject]) -> () -> () {
        
        return {
            print(infos)
        }
    }

}
