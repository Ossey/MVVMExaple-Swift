//
//  UIView+UIAdditions.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import Foundation

extension UIView {

    public class func viewFromNib() -> UIView {
        let bundle = Bundle(for: self.classForCoder())
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
