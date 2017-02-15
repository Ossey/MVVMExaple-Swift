//
//  XYViewManagerProtocol.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

@objc protocol XYViewManagerProtocol: NSObjectProtocol {

    typealias ViewEventsBlock = () -> Void
    /**
     *  将自己的信息返回给ViewModel的block
     */
    typealias ViewModelInfosBlock = () -> Void
    
    /**
     *  将自己的信息返回给ViewManger的block
     */
    typealias ViewMangerInfosBlock = () -> Void
    
    /// 通知
    @objc optional func xy_notify() -> Void;
    
    /**
     * @explain 设置控制器的子视图的管理者为self
     *
     * @param   superView  一般指superView所在的控制器的根view
     */
    @objc optional func xy_viewManagerWithSuperView(_ superView: UIView) -> Void;
    
    /**
     * @explain 设置subView的管理者为self
     *
     * @param   subView 管理的subview
     */
    @objc optional func xy_viewManagerWithSubView(_ subView: UIView) -> Void;
    
    /**
     * @explain 设置添加subView的事件
     *
     * @param   subView  管理的subView
     * @param   info  附带信息 用于区分回调
     */
    @objc optional func xy_viewManagerWithHandleOfSubView(_ subView: UIView, _info: String) -> Void;
    
    /**
     * @explain 返回viewManager所管理的视图
     * @return  view
     */
    @objc optional func xy_viewManagerOfSubView() -> UIView;
    /**
     * @explain 得到其他viewManager所管理的subview 用户自己内部
     *
     * @param   viewInfos  其他的subViews
     */
    @objc optional func xy_viewManagerWithOtherSubviews(_ viewInfos: [String: AnyObject]) -> Void;
    
    /**
     * @explain 需要重新布局subView时，更新subview的frame或约束
     *
     * @param   updateBlock  布局更新完成后的回调
     */
    @objc optional func xy_viewManagerWithLayoutSubviews(_ uodateBlock: (() -> Swift.Void)?) -> Void;
    
    /**
     * @explain 使子视图更新到最新的布局约束或frame
     */
    @objc optional func xy_viewManagerWithUpdateLayoutSubviews() -> Void;
    
    /**
     * @explain 将模型数据传递给viewManager
     */
    @objc optional func xy_viewManagerWithModel(_ block: () -> [String: AnyObject]) -> Void
    
    /**
     * @explain 处理viewBlock的事件
     */
    @objc optional func xy_viewManagerWithViewEventBlockOfInfos(_ infos: [String: AnyObject]) -> () -> ()
    
    /**
     *  处理ViewModelInfosBlock
     */
    @objc optional func xy_viewMangerWithViewModelBlockOfInfos(_ infos: [String: AnyObject]) -> ViewModelInfosBlock
    
    /**
     *  处理ViewMangerInfosBlock
     */
    @objc optional func xy_viewMangerWithOtherViewMangerBlockOfInfos(_ infos: [String: AnyObject]) -> ViewMangerInfosBlock
    
    /**
     *  将viewManger中的信息通过代理传递给ViewModel
     *
     *  @param viewManger   viewManger自己
     *  @param infos 描述信息
     */
    @objc optional func xy_viewManger(_ viewManager: AnyObject, _ infos: [String: AnyObject]) -> Void
    
    
}
