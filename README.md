# UIAlertController-Extention
调用：

        [UIAlertController showWithTitle:@"提示" buttonTitle:@"确定" block:^{
            
        }];
        [UIAlertController showWithTitle:@"提示"
                                 message:message rootViewController:nil
                       cancelButtonTitle:@"取消"
                       otherButtonTitles:@[@"确定"]
                            actionBlocks:^{
                                
                            }, ^{
                                
                            }, nil];
