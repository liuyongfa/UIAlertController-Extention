# UIAlertController-Extention
调用：

        [UIAlertController showWithTitle:@"提示" buttonTitle:@"确定" block:^{
            NSLog(@"确定");
        }];
        [UIAlertController showWithTitle:@"提示"
                                 message:nil
                      rootViewController:nil
                       cancelButtonTitle:@"取消"
                       otherButtonTitles:@[@"确定"]
                            actionBlocks:^{
                                NSLog(@"取消");
                            }, ^{
                                NSLog(@"确定");
                            }, nil];
