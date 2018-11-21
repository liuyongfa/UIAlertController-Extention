//
//  UIAlertController+LYFExtention.m
//  fdsafsaffasdfsa
//
//  Created by yongfaliu on 2018/11/16.
//  Copyright © 2018 yongfaliu. All rights reserved.
//

#import "UIAlertController+LYFExtention.h"

@implementation UIAlertController (LYFExtention)

+ (void)showWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle block:(AlertBlock)block {
    [UIAlertController showWithTitle:title ?: @"" message:@"" rootViewController:nil cancelButtonTitle:nil otherButtonTitles:@[buttonTitle ?: @"确定"] actionBlocks:^{
        block();
    }, nil];
}

+ (void)showWithTitle:(NSString *)title message: (nullable NSString *)message rootViewController:(nullable UIViewController *)viewController cancelButtonTitle:(nullable NSString *)cancelString otherButtonTitles:(NSArray <NSString *>*)otherTitles actionBlocks:(AlertBlock)block, ... {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message ?: @"" preferredStyle:UIAlertControllerStyleAlert];
    int i = 0;
    if (cancelString) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelString style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            block();
        }]];
    } else {
        if (otherTitles.count > 0) {
            [alert addAction:[UIAlertAction actionWithTitle:otherTitles[0] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                block();
            }]];
            i = 1;
        }
    }
    if (otherTitles.count > i) {
        va_list arg_list;
        va_start(arg_list, block);
        AlertBlock tempBlock;
        while ((tempBlock = va_arg(arg_list, AlertBlock))) {
            if (i >= otherTitles.count) {
                break;
            }
            [alert addAction:[UIAlertAction actionWithTitle:otherTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                tempBlock();
            }]];
            i++;
        }
        va_end(arg_list);
        
        for (; i < otherTitles.count; i++) {
            [alert addAction:[UIAlertAction actionWithTitle:otherTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
        }
    }

    if (!viewController) {
        viewController = [alert visibleViewController:nil];
        if (!viewController) {
            return;
        }
    }

    [viewController presentViewController:alert animated:true completion:nil];
}

- (UIViewController *)visibleViewController:(UIViewController *)rootViewController {
    UIViewController *root;
    if (rootViewController) {
        root = rootViewController;
    } else {
        UIViewController *controller  = UIApplication.sharedApplication.delegate.window.rootViewController;
        if (!controller) {
            return nil;
        }
        root = controller;
    }
    UIViewController *presented = root.presentedViewController;
    if (!presented) {
        return root;
    }
    if ([presented isKindOfClass:[UINavigationController class]]) {
        return [self visibleViewController:((UINavigationController *)presented).topViewController];
    }
    if ([presented isKindOfClass:[UITabBarController class]]) {
        return [self visibleViewController:((UITabBarController *)presented).selectedViewController];
    }
    return presented;
}
@end
