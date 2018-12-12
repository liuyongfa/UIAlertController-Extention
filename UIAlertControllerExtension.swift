//
//  UIAlertControllerExtension.swift
//  AlertExtension
//
//  Created by yongfaliu on 2018/11/16.
//  Copyright © 2018 yongfaliu. All rights reserved.
//

import UIKit

typealias LYFAlertBlcok = () -> Void

fileprivate let LYFButtonTitle = "确定"

extension UIAlertController {
    
    /// 显示UIAlertController，只有一个按钮
    ///
    /// - Parameters:
    ///   - title: title
    ///   - message: message，可以为nil
    ///   - buttonTitle: 按钮文字，可以为nil，默认值："确定"
    ///   - block: 按钮回调，可以为nil
    class func showWithTitle(_ title: String, message: String? = nil, buttonTitle: String? = LYFButtonTitle, block: LYFAlertBlcok? = nil) {
        UIAlertController.showWithTitle(title, message: message, otherButtonTitles: [buttonTitle ?? LYFButtonTitle], actionBlocks: block)
    }
    
    /// 显示UIAlertController
    ///
    /// - Parameters:
    ///   - title: title
    ///   - message: message
    ///   - rootViewController: 在哪个UIViewcontroller上显示，可以为nil
    ///   - cancelButtonTitle: 取消按钮文字,为nil则没有取消按钮
    ///   - otherButtonTitles: 其他按钮文字
    ///   - actionBlocks: 响应按钮的block，如果cancelString不为nil，则第一个为cancel按钮的，之后的block依次对应otherTitles的元素
    class func showWithTitle(_ title: String, message: String? = nil, rootViewController: UIViewController? = nil, cancelButtonTitle: String? = nil, otherButtonTitles: [String], actionBlocks: LYFAlertBlcok?...) {
        let alert = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
        var i = 0
        if let cancelString = cancelButtonTitle {
            let block: LYFAlertBlcok? = i < actionBlocks.count ? actionBlocks[i] : nil
            alert.addAction(UIAlertAction(title: cancelString, style: .cancel) { _ in
                block?()
            })
            i += 1
        }
        
        for string in otherButtonTitles {
            let block: LYFAlertBlcok? = i < actionBlocks.count ? actionBlocks[i] : nil
            alert.addAction(UIAlertAction(title: string, style: .default) { _ in
                block?()
            })
            i += 1
        }
        
        (rootViewController ?? visibleViewController())?.present(alert, animated: true, completion: nil)
    }

    fileprivate class func visibleViewController(_ rootViewController: UIViewController? = nil) -> UIViewController? {
        var root: UIViewController

        if let rootViewController = rootViewController {
            root = rootViewController
        }
        else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate

            guard let controller = appDelegate?.window?.rootViewController else {
                return nil
            }

            root = controller
        }

        guard let presented = root.presentedViewController else {
            return root
        }

        if let navigation = presented as? UINavigationController {
            return visibleViewController(navigation.topViewController)
        }
        if let tabBar = presented as? UITabBarController {
            return visibleViewController(tabBar.selectedViewController)
        }

        return presented
    }
}
