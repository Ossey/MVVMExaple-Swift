//
//  XYViewModelProtocol.swift
//  MVVMExaple
//
//  Created by mofeini on 17/2/15.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

import UIKit

@objc protocol XYViewModelProtocol {

    // MARK: - 定义闭包类型
    
    /// 请求成功block
    
    typealias successBlock = (_ responseObj: AnyObject) -> Void
    
    
    /// 请求失败block
    typealias failureBlock = (_ error: Error) -> Void
    
    /// 请求响应block
    typealias responseBlock = (_ dataObj: AnyObject) -> Void
    
    /// 监听进度响应block
    typealias progressBlock = (_ progress: Progress) -> Void
    
    /// 将自己的信息返回给ViewManger的block
    typealias ViewMangerInfosBlock = () -> Void
    
    
    /// 将自己的信息返回给ViewModel的block
    typealias ViewModelInfosBlock = () -> Void

    
    /// 网络请求模型
    typealias requestItemBlock = (_ requestItem: AnyObject) -> Void
    

    typealias modelBlock = (_ model: AnyObject) -> Void
    
    // MARK: - 协议方法
    
    /// 通知
    @objc optional func xy_notify() -> Void;
    
    
    /// 返回指定viewModel的所引用的控制器
    @objc optional func xy_viewModelWithViewController(vc: UIViewController) -> Void;
    
    
    
    /// 加载数据
    @objc optional func xy_viewModelWithProgress(_ progress: progressBlock, _ success: successBlock, _ failure: failureBlock) -> URLSessionTask;

    
    
    /// 加载数据
    /// requestItem  通过此block回调一个网络请求对象，配置请求参数
    /// progress  请求进度回调
    /// success  请求成功回调
    /// failure  请求失败回调
    @objc optional func xy_viewModelWithConfigRequest(_requestItem: requestItemBlock, _ progress: progressBlock, _ success: successBlock, _ failure: failureBlock) -> URLSessionTask;
   
    
    
    /// 传递模型给view
    @objc optional func xy_viewModelWithModelBlcok(_ model: modelBlock) -> Void;
    
    
    
    /// 处理ViewMangerInfosBlock
    @objc optional func xy_viewModelWithViewMangerBlockOfInfos(_ info: [String: AnyObject]) -> ViewMangerInfosBlock;
    
    
    
    /// 处理ViewModelInfosBlock
    @objc optional func xy_viewModelWithOtherViewModelBlockOfInfos(_ info: [String: AnyObject]) -> ViewModelInfosBlock;
    
    
    
    /// 将viewModel中的信息通过代理传递给ViewManger
    /// - parameter viewModel: TviewModel自己
    /// - parameter infos: 描述信息
    /// - returns:   ViewModelInfosBlock
    @objc optional func xy_viewModel(_ viewModel: AnyObject, _ info: [String: AnyObject]) -> ViewModelInfosBlock;
    

}
