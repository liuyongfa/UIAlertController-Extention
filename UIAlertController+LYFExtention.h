//
//  UIAlertController+LYFExtention.h
//  fdsafsaffasdfsa
//
//  Created by yongfaliu on 2018/11/16.
//  Copyright © 2018 yongfaliu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^AlertBlock)(void);

@interface UIAlertController (LYFExtention)
/**
 显示UIAlertController，只有一个按钮
 @param title title
 @param buttonTitle 按钮文字
 @param block 按钮的回调
 */
+ (void)showWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle block:(AlertBlock)block;

/**
 显示UIAlertController
 
 @param title title
 @param message message
 @param viewController 在哪个UIViewcontroller上显示，可以为nil
 @param cancelString 取消按钮文字,为nil则没有取消按钮
 @param otherTitles 其他按钮文字
 @param block 响应按钮的block，如果cancelString不为nil，则第一个为cancel按钮的，之后的block依次对应otherTitles的元素
 */
+ (void)showWithTitle:(NSString *)title message: (nullable NSString *)message rootViewController:(nullable UIViewController *)viewController cancelButtonTitle:(nullable NSString *)cancelString otherButtonTitles:(NSArray <NSString *>*)otherTitles actionBlocks:(AlertBlock)block, ...NS_REQUIRES_NIL_TERMINATION;
@end

NS_ASSUME_NONNULL_END
