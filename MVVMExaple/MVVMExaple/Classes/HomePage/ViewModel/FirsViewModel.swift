//
//  FirsViewModel.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

class FirsViewModel: NSObject, XYViewModelProtocol, XYViewManagerProtocol {

    func xy_viewModelWithViewMangerBlockOfInfos(_ info: [String : AnyObject]) -> XYViewModelProtocol.ViewMangerInfosBlock {
        
        return {
            print("22222")
        }
    }
    
    func xy_viewManger(_ viewManager: AnyObject, _ infos: [String: AnyObject]) -> Void {
        print(infos)
    }
    
    func xy_viewModelWithOtherViewModelBlockOfInfos(_ info: [String : AnyObject]) -> XYViewModelProtocol.ViewModelInfosBlock {
        return {
            if self.propertyBlockContainer?.viewModelInfosBlock != nil {
                self.propertyBlockContainer?.viewModelInfosBlock!()
            }
        }
    }
}
