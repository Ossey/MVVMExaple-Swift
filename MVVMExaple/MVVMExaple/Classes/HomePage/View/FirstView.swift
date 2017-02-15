//
//  FirstView.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

class FirstView: UIView {
    
    
    @IBAction func btnClick(_ sender: Any) {
        // 传递事件 通过闭包
        if self.eventBlockContainer == nil {
            let eventBlockContainer = XYEventsBlockContainer()
            print(self.eventBlockContainer ?? "")
            eventBlockContainer.viewEventsBlock = {
                print("今天天气真好")
            }
            eventBlockContainer.viewEventsBlock!()
        }
        
        if self.propertyBlockContainer == nil {
            self.propertyBlockContainer = XYPropertyBlockContainer()
            self.propertyBlockContainer?.viewModelInfosBlock = {
                print("1=1")
            }
            self.propertyBlockContainer?.viewModelBlock = {
                print("1=1")
            }
            self.propertyBlockContainer?.viewMangerInfosBlock = {
                print("1=1")
            }
            
            self.propertyBlockContainer?.viewMangerInfosBlock!()
            self.propertyBlockContainer?.viewModelBlock!()
            self.propertyBlockContainer?.viewModelInfosBlock!()
        }
        
//        if self.eventBlockContainer?.viewEventsBlock != nil {
//            self.eventBlockContainer?.viewEventsBlock!()
//        }
//        
        
    }
    

    
    @IBAction func jumpToVc(_ sender: Any) {
        
        // 传递事件
        self.viewDelegate?.xy_view!(self, events: ["jump": "Example2VC" as AnyObject])
    }

    

}
