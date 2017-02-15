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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.backgroundColor = UIColor.white
    }



}
